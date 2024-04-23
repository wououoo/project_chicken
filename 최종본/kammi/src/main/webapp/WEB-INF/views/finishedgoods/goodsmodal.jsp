<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!--전체 모달 css-->
<style>
    .goods-modal{
        height:300px;
    }

    .modal-input{
        margin-top:40px;
    }

    .modal-input .inputDivBox{
        width:100%;
    }

    .modal-input:first-child{
        margin-top:20px;
    }

    .modal-input-box{
        border:1px solid rgba(0,0,0,0.18);
        padding:20px;
        width:50%;
    }

    .modal-input-box:nth-child(2){
        background-image:url('/resources/img/mainimg/chicken2.png');
        background-repeat:no-repeat;
        background-size:contain;
    }

    .goods-insert{
        display: flex;
    }

    .float-right{
        margin-top:20px;
    }

</style>

<!--세션 1의 css-->
<style>
    #selectbox .sel{
        width:100%;
    }
</style>

<!-- 세션 1의 추가 버튼 누를 시 나오는 모달 -->
<div class="modal fade" id="modalArea" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제품 추가</h5>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div class="goods-modal">
                        <div class="goods-insert">
                            <div class="modal-input-box">
                                <div class="modal-input">
                                    <div id="selectbox">
                                        <div class="sel sel--black-panther">
                                            <select name="select-profession" id="goods-insert">
                                                <option value="1" disabled selected>제품 이름</option>

                                                <!--JSTL 사용하여 미판매중인 제품명 삽입-->
                                                <c:forEach items="${recipelist}" var="recipe">
                                                    <option><c:out value="${recipe.finishedgoods_name}" /></option>
                                                </c:forEach>

                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <div class = "inputDivBox">
                                        <input class = "inputBox" type="text" id="goods-price" required>
                                        <label class = "inputLabelTag">제품 가격</label>
                                        <span class = "inputSpanTag" id="inputtext"></span>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-insert-btn">추가</button>
                                </div>
                            </div>
                            <div class="modal-input-box">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button type="button" class="btn mr-2 mb-2" id="closeBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!--세션 1의 추가 버튼 모달 js-->
<script>
// 세션 1의 추가 버튼 클릭 시 나오는 모달 안에 select의 인덱스 값 가져오기
var checkindex = document.querySelectorAll('#selectbox .sel__box__options');
var modalindex;
checkindex.forEach((target, index) => target.addEventListener('click',function(){
    modalindex=index;
}));

const goodsInsert = document.getElementById('goods-insert-btn');


// 세션 1의 모달 안에 추가 선택 시 선택 되어 있는 값들 초기화 및 추가
goodsInsert.addEventListener('click', function(){
    var goodsPrice = document.getElementById('goods-price');
    const goodsInsert = document.getElementById('goods-insert');
    var option = goodsInsert.options[goodsInsert.selectedIndex];
    if(modalindex==null){
        modalindex=0;
    }

    var name = option.text; //값 가져오기
    var price = goodsPrice.value;

    //세션 1의 상태 변경 함수 사용
    goodsStatusChange(name, price,'1kg', 1);

    var rowIndex = document.getElementById('goods-table').rows;

    for(i=1;i<rowIndex.length;i++){
        var selectName = document.getElementById('goods-table').getElementsByTagName("tr")[i].getElementsByTagName("td")[2].innerHTML;
        var changePrice = document.getElementById('goods-table').getElementsByTagName("tr")[i].getElementsByTagName("td")[4];
        var changeStatus = document.getElementById('goods-table').getElementsByTagName("tr")[i].getElementsByTagName("td")[6];

        if(name==selectName){
            changePrice.innerHTML=price;
            changeStatus.innerHTML='판매중';
        }
    }

    document.querySelectorAll('.modal-input .sel__box__options')[modalindex].remove();
    document.querySelectorAll('.modal-input .sel__placeholder')[0].textContent="제품 이름";

    goodsInsert.options[0].selected = true;
    option=null;
    goodsPrice.value=null;
    $('#modalArea').modal('hide');
});

</script>

<!--세션 1의 테이블 선택 시 나오는 모달의 css-->
<style>
    #goods-row-modal .row{
        height:400px;
    }

    #goods-detail{
        border:1px solid rgba(0,0,0,0.18);
        display:flex;
        flex-direction:column;
        align-items:center;
        padding:20px;
    }

    .goods-contents{
        display:flex;
        justify-content:center;
        align-items:center;
        width:100%;

    }
    .goods-contents:nth-child(1){
        height:400px;
    }
    .goods-contents:nth-child(2){
        height:100px;
    }

    .goods-inner{
        display:flex;
        flex-direction:column;
        width:100%;
        height:100%;
        padding:0 30px;
        border:1px solid rgba(0,0,0,0.18);
    }
    .goods-inner .inputDivBox{
        width:100%;
        margin-top:40px;
        pointer-events:none;
    }
    .goods-detail-btn{
        display:flex;
        justify-content:center;
        align-items:flex-end;
        height:100%;
        margin-bottom:20px;
    }

    .goods-detail-btn .btn{
        margin-right:20px;
    }
    #goods-detail-status{
        margin-top:40px;
    }

    #goods-detail-status .sel{
        width:100%;
    }

    #goods-detail-price ,#storage-detail-total,#storage-detail-address{
        pointer-events:auto;
    }
</style>

<!-- 세션 1의 테이블 선택 시 나오는 모달 -->
<div class="modal fade" id="goods-row-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제품 상세 관리</h5>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div id="goods-detail">
                        <div class="goods-contents">
                            <div class="goods-inner">
                                <div class = "inputDivBox">
                                	<input id="goods-detail-num" class = "inputBox" type="text" value="1882" required>
                                	<label class = "inputLabelTag">제품 번호</label>
                                	<span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                	<input id="goods-detail-name" class = "inputBox" type="text" required>
                                	<label class = "inputLabelTag">제품 이름</label>
                                	<span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                	<input id="goods-detail-quantity" class = "inputBox" type="text" required>
                                	<label class = "inputLabelTag">제품 수량</label>
                                	<span class = "inputSpanTag"></span>
                                </div>
                            </div>
                            <div class="goods-inner">
                                <div id="goods-detail-status">
                                    <div class="sel sel--black-panther">
                                        <select name="select-profession" id="goods-detail-status-select">
                                            <option disabled>상태</option>
                                            <option value="0">미판매</option>
                                            <option value="1">판매중</option>
                                            <option value="2">품절</option>
                                        </select>
                                    </div>
                                </div>
                                <div class = "inputDivBox">
                                    <input id="goods-detail-price" class = "inputBox" type="text" required>
                                    <label class = "inputLabelTag">제품 가격</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox" style="pointer-events:auto;">
                                	<input id="goods-detail-units" class = "inputBox" type="text" required>
                                	<label class = "inputLabelTag">제품 단위</label>
                                	<span class = "inputSpanTag"></span>
                                </div>
                                <div class="goods-detail-btn">
                                    <div id="goods-detail-btnmenu">
                                        <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="goodsUpdate()">수정</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button type="button" class="btn mr-2 mb-2" id="goodsCloseBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>

//세션1의 테이블 행 클릭 시 나오는 모달 속 제품 상태 수정 버튼 클릭 함수
function goodsStatusChange(name, price,units, status){
    goodsService.update(
        {
            name:name,
            price:price,
            units:units,
            status:status
        }, function(result){
            alert("수정 완료");
        }
    );
}
</script>

<!-- 세션 3의 창고 관리 모달의 css-->
<style>
.map_wrap, .map_wrap * {margin:0;padding:0;font-family:'Pretendard-Regular',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:100%;height:100%;}
#menu_wrap {position:absolute;top:0;right:0;bottom:0;width:50%;margin:10px 0 30px 10px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.7);z-index: 1;font-size:12px;border-top-left-radius: 10px;border-bottom-left-radius: 10px;}
#menu_wrap::-webkit-scrollbar{display:none;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 2px solid #5F5F5F;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nomal; word-break:keep-all;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:100%; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}
#keyword{text-align:center;}
#keyword:focus{outline:none;}
</style>

<!-- 세션 3의 창고 추가 선택시 나오는 모달 -->
<div class="modal fade" id="storage-create-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5>창고 추가</h5>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="row" style="height:400px;">
                    <div class="goods-modal">
                        <div class="goods-insert">
                            <div class="modal-input-box">
                                <div class="modal-input">
                                    <div class = "inputDivBox">
                                        <input class = "inputBox" type="text" id="storage-name" required>
                                        <label class = "inputLabelTag">창고 이름</label>
                                        <span class = "inputSpanTag"></span>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <div class = "inputDivBox">
                                        <input class = "inputBox" type="text" id="storage-address" required>
                                        <label class = "inputLabelTag">창고 주소</label>
                                        <span class = "inputSpanTag"></span>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <div class = "inputDivBox">
                                        <input class = "inputBox" type="text" id="storage-capacity" required>
                                        <label class = "inputLabelTag">창고 수용량</label>
                                        <span class = "inputSpanTag"></span>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="storagePlusBtn" onclick="storageAdd()">추가</button>
                                </div>
                            </div>
                            <div class="modal-input-box">
                                <div class="map_wrap">
                                    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

                                    <div id="menu_wrap" class="bg_white">
                                        <div class="option">
                                            <div>
                                                <form onsubmit="searchPlaces(); return false;">
                                                    <input type="text" value="식품 창고" id="keyword" size="15" placeholder="창고 검색">
                                                </form>
                                            </div>
                                        </div>
                                        <hr>
                                        <ul id="placesList"></ul>
                                        <div id="pagination"></div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button type="button" class="btn mr-2 mb-2" id="storageClose">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!--카카오 지도 API 스크립트-->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=07f6a37e12a726e6176ae587829db214&libraries=services"></script>

<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div
    mapOption = {
        center: new kakao.maps.LatLng(40.26707518169585, 122.99832016866424), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };

// 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

    var keyword = document.getElementById('keyword').value;

    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }

    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB);
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}

// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'),
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(),
    bounds = new kakao.maps.LatLngBounds(),
    listStr = '';

    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();

    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i),
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Element에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {
    var el = document.createElement('li'),
    itemStr = '<div class="markerbg marker_' + (index+1) + '" style="z-index:-1;"></div>' +
              '<div class="info" onClick="storageValue(' + (index+1) + ')">' +
              '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>';
    }

      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i;

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}

// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}

 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

//카카오 지도가 화면에 적용시키는 시간
setTimeout(function(){
    map.relayout();
}, 4000);
</script>


<!--세션 3의 창고 관리 모달 스크립트-->
<script>
//제품 수정 버튼
function goodsUpdate(){
    var goodsDetailName = document.getElementById('goods-detail-name').value;
    var goodsDetailPrice = document.getElementById('goods-detail-price').value;
    var statusList = document.getElementById('goods-detail-status-select');
    var goodsDetailStatus = statusList.options[statusList.selectedIndex].value;
    var goodsDetailStatusText = statusList.options[statusList.selectedIndex].text;

    var goodsDetailUnits = document.getElementById('goods-detail-units').value;


    goodsStatusChange(goodsDetailName, goodsDetailPrice,goodsDetailUnits, goodsDetailStatus);


    var goodsTable = document.getElementById('goods-table');
    var rowIndex = goodsTable.rows;

    for(i=1;i<rowIndex.length;i++){
        var selectName = document.getElementById('goods-table').getElementsByTagName("tr")[i].getElementsByTagName("td")[2].innerHTML;
        var changePrice = document.getElementById('goods-table').getElementsByTagName("tr")[i].getElementsByTagName("td")[4];
        var changeStatus = document.getElementById('goods-table').getElementsByTagName("tr")[i].getElementsByTagName("td")[6];

        if(goodsDetailName==selectName){
            changePrice.innerHTML=goodsDetailPrice;
            changeStatus.innerHTML=goodsDetailStatusText;
        }
    }

    $('#goods-row-modal').modal('hide');
}

//제품 삭제 버튼
function goodsDelete(){
    var goodsDetailNum = document.getElementById('goods-detail-num').value;
    listDelete(goodsDetailNum);
    $('#goods-row-modal').modal('hide');
}

//카카오 지도에서 검색 결과 선택 시 input에 자동 입력
var mapLi = document.getElementsByClassName('item');
function storageValue(snum){
    var searchStorageName = mapLi[snum-1].getElementsByClassName('info')[0].getElementsByTagName('h5')[0].innerHTML;
    var storageName = document.getElementById('storage-name');
    storageName.value = searchStorageName;

    var searchStorageAddress = mapLi[snum-1].getElementsByClassName('info')[0].getElementsByTagName('span')[0].innerHTML;
    var storageAddress = document.getElementById('storage-address');
    storageAddress.value = searchStorageAddress;
}



// 창고 추가 모달에서 추가 버튼 실행시 값 추가 버튼
function storageAdd(){
    var storageName = document.getElementById('storage-name');
    var storageAddress = document.getElementById('storage-address');
    var storageCapacity = document.getElementById('storage-capacity');

    goodsService.storageAdd(
            {storage_name:storageName.value,
            storage_address:storageAddress.value,
            storage_total_amount:storageCapacity.value },
            function(result){
                $('#storage-create-modal').modal('hide');

                //모달 종료 시 뒷 배경 스크롤 실행 코드
                $('body').off('scroll touchmove mousewheel');
                showStorageList(1);
            }
    );
}

</script>

<!-- 세션 3의 테이블 선택 시 나오는 모달 -->
<div class="modal fade" id="storage-row-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>창고 상세 관리</h5>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div id="storage-detail">
                        <div class="goods-contents">
                            <div class="goods-inner">
                                <div class = "inputDivBox">
                                	<input id="storage-detail-num" class = "inputBox" type="text" required>
                                	<label class = "inputLabelTag">창고 번호</label>
                                	<span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                    <input id="storage-detail-name" class = "inputBox" type="text" required>
                                    <label class = "inputLabelTag">창고 이름</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                    <input id="storage-detail-current" class = "inputBox" type="text" required>
                                    <label class = "inputLabelTag">적재량</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                            </div>
                            <div class="goods-inner">
                                <div class = "inputDivBox">
                                    <input id="storage-detail-total" class = "inputBox" type="text" required>
                                    <label class = "inputLabelTag">수용량</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                    <input id="storage-detail-address" class = "inputBox" type="text" required>
                                    <label class = "inputLabelTag">창고 주소</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                                <div class="goods-detail-btn">
                                    <div id="goods-detail-btnmenu">
                                        <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="storageRenewal()">수정</button>
                                        <button class="btn btn-sm btn-danger ml-2 mt-2" onclick="storageDelete()">삭제</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button type="button" class="btn mr-2 mb-2" id="storageCloseBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
//세션 3의 테이블 행 클릭 시 나오는 모달 속 제품 삭제 버튼 클릭 함수
function listStorageDelete(snum){
    var con=confirm("삭제하시겠습니까?");
    if(con===true){
        goodsService.storageRemove(snum, function(){
            alert("삭제했습니다.");
            showStorageList(1);
            $('#storage-row-modal').modal('hide');
        }, function(err){
            alert("error....");
        });
    }
}

function storageDelete(){
    var storageNum = document.getElementById('storage-detail-num').value;
    listStorageDelete(storageNum);
}

//세션3의 테이블 행 클릭 시 나오는 모달 속 제품 상태 수정 버튼 클릭 함수
function storageChange(address, total, id){
    goodsService.storageUpdate(
        {
            address:address,
            total:total,
            id:id
        }, function(result){
            alert("수정 완료");
            $('#storage-row-modal').modal('hide');
            showStorageList(1);
        }
    );
}

function storageRenewal(){
    var storageNum = document.getElementById('storage-detail-num').value;
    var storageAddress = document.getElementById('storage-detail-address').value;
    var storageTotal = document.getElementById('storage-detail-total').value;
    storageChange(storageAddress, storageTotal,storageNum);
}
</script>


<style>
    .inven-modal-container{
        display:flex;

        border:1px solid rgba(0,0,0,0.18);
    }

    .inven-modal-contents{
        width:50%;
        padding:20px;
        margin:20px;
        border:1px solid rgba(0,0,0,0.18);
    }

    .inven-input{
        margin-top:40px;
    }
    .inven-input .sel{
        width:100%;
    }

    .inven-input .inputDivBox{
        width:100%;
    }

    #inven-modal-table{
        width:100%;
        font-size:12px;
    }
    #inven-modal-table tr th{
        word-break:keep-all;
        text-align:center;
    }
    #inven-modal-table tr td{
        word-break:keep-all;
        text-align:center;
    }

    .inven-page{
        margin-top:20px;
    }
    .inven-modal-btn{
        width:100%;
        display:flex;
        justify-content:center;
        align-items:center;
    }

    .invenDateLabel{
        display:none;
    }
</style>

<!-- 세션 2의 테이블 선택 시 나오는 모달 -->
<div class="modal fade" id="inven-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제품 출고 관리</h5>
            </div>
            <!-- Modal body -->
            <div class="modal-body">
                <div class="row" style="height:500px;">
                    <div class="inven-modal-container">
                        <div class="inven-modal-contents">
                            <div class="inven-input" id="invenSel">
                                <div class="sel sel--black-panther inven-modal-select">
                                    <select name="select-profession" id="inven-goods-name">

                                    </select>
                                </div>
                            </div>
                            <div class="inven-input">
                                <div class = "inputDivBox">
                                    <input class = "inputBox" type="text" id="inven-detail-count" oninput="availability()" required>
                                    <label class = "inputLabelTag">출고 수량</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                            </div>
                            <div class="inven-input">
                                <div class = "inputDivBox invenDate">
                                    <input class = "inputBox" type="date" id="inven-detail-date" required>
                                    <label class = "inputLabelTag invenDateLabel">재고 날짜</label>
                                    <span class = "inputSpanTag invenDateText"></span>
                                </div>
                            </div>
                            <div class="inven-input">
                                <div class = "inputDivBox" style="pointer-events:none;">
                                    <input class = "inputBox" type="text" id="inven-detail-storage" required>
                                    <label class = "inputLabelTag">적재 창고</label>
                                    <span class = "inputSpanTag" id="inputtext"></span>
                                </div>
                            </div>
                            <div class="inven-input">
                                <div class="inven-modal-btn">
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="" onclick="invenModalInsert()">출고</button>
                                </div>
                            </div>
                        </div>
                        <div class="inven-modal-contents">
                            <div class="inven-contants-table">
                                <table id="inven-modal-table" class="rwd-table">
                                    <tbody>

                                    </tbody>
                                </table>
                            </div>
                            <!-- 페이징 보여지는 구간 -->
                            <div class="inven-page">
                                <div class="pagination__wrapper">
                                    <ul class="pagination sectionTwoModalPage">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button type="button" class="btn mr-2 mb-2" id="invenCloseBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
//세션 2의 모달 내부에 테이블 조회하는 함수
var invenModalTableUL = $("#inven-modal-table tbody");
function showInvenModalTable(pageNum, goodsnum) {

    goodsService.getAvailableStorage(
    { goodsnum: goodsnum , page: pageNum || 1 },
        function(list) {

            var str = "";
            str+="<tr>";
            str+="<th>창고 번호</th>";
            str+="<th>창고 이름</th>";
            str+="<th>제품 이름</th>";
            str+="<th>남은 수량</th>";
            str+="<th>가능 여부</th>";
            str+="</tr>";

            if(list == null || list.length == 0){
                invenModalTableUL.html(str);
                return;
            }

            for(var i = 0, len = list.length || 0; i < len; i++) {
                str += "<tr onclick='invenModalTrValue()'>";
                str += "<td data-th='창고 번호'>"+list[i].finishedgoodsinventory_storage+"</td>";
                str += "<td data-th='창고 이름'>"+list[i].storage_name+"</td>";
                str += "<td data-th='제품 이름'>"+list[i].finishedgoodsinventory_goods_name+"</td>";
                str += "<td data-th='남은 수량'>"+list[i].finishedgoodsinventory_quantity+"</td>";
                str += "<td data-th='가능 여부'>불가능</td>";
                str += "</tr>";
            }
            invenModalTableUL.html(str);
            createInvenModalPage(goodsnum ,pageNum);
        }
    );
}
showInvenModalTable(1);

//세션 2의 출고 관리 모달에서 select ajax로 생성
function invenGoodsList() {
    goodsService.readyGoodsList(
        {},
        function(list) {

             if(list == null || list.length == 0){
                 $("#inven-goods-name").html("");
                 return;
             }
             var str = "";
             var str2 = "";
             str2+="<span class='sel__placeholder sel__placeholder--black-panther' data-placeholder='제품 이름'>제품 이름</span>";
             str2+="<div class='sel__box sel__box--black-panther'>";
             str += "<option disabled selected>제품 이름</option>";
             for(var i = 0, len = list.length || 0; i < len; i++) {
                str2+="<span class='sel__box__options sel__box__options--black-panther'>"+list[i].finishedgoods_name+"</span>";
                str += "<option value='"+list[i].finishedgoods_id+"'>"+list[i].finishedgoods_name+"</option>";
             }
             str2+="</div>";
             $("#inven-goods-name").empty();
             $("#inven-goods-name").append(str);
             $(".inven-modal-select span").remove();
             $(".inven-modal-select div").remove();
             $(".inven-modal-select").append(str2);
             $(function () {
                 $('.inven-modal-select .sel__box__options').on('click', function(){
                     $('.inven-modal-select .sel__box__options').removeClass("selected");
                     $(this).addClass("selected");
                     $('.inven-modal-select span').toggleClass('안녕');

                     var txt = $(this).text();
                     var index = $(this).index();

                     $(this).siblings('.sel__box__options').removeClass('selected');
                     $(this).addClass('selected');

                     var $currentSel = $(this).closest('.sel');
                     $currentSel.children('.sel__placeholder').text(txt);
                     $currentSel.children('select').prop('selectedIndex', index + 1);
                     var invenGoodsNum = document.getElementById('inven-goods-name'); // select 태그
                     var option = invenGoodsNum.options[invenGoodsNum.selectedIndex]; // select 태그에 선택된 값 가져오기
                     var goodsnum = option.value;
                     showInvenModalTable(1,goodsnum);

                 });
             });

        }
    );
}

//세션2의 테이블 페이지네이션 생성 함수
function createInvenModalPage(goodsNum,pageNum){
    var pageUL = $(".sectionTwoModalPage");
    goodsService.getInvenModalCount(
        { goodsNum: goodsNum},
        function(list) {
            var str2="";
            var prevInt;
            if(pageNum==1){
                prevInt=1;
            } else{
                prevInt=(pageNum-1);
            }
            var currentPageSize = 5;
            var currentPageList = Math.ceil(pageNum/currentPageSize);
            var currentMaxPage = currentPageList*currentPageSize;

            var currentMaxPageReal;

            if(currentMaxPage>=list){
                currentMaxPageReal=list;
            }
            var currentMinPage = currentMaxPage-(currentPageSize-1);
            str2+="<li class='pagelist'><button class='pagebtn prev' onclick='showInvenModalTable("+prevInt+")'>&#10094;</button></li>";
            for(var i=currentMinPage; i <= currentMaxPageReal; i++) {
                if(i==pageNum){
                    str2+="<li class='pagelist'><button class='pagebtn pagenum active' onclick='showInvenModalTable("+i+")'>"+i+"</button></li>";
                } else {
                    str2+="<li class='pagelist'><button class='pagebtn pagenum' onclick='showInvenModalTable("+i+")'>"+i+"</button></li>";
                }
            }
            var nextInt;
            if(pageNum==list){
                nextInt=list;
            } else{
                nextInt=(pageNum+1);
            }
            str2+="<li class='pagelist'><button class='pagebtn next' title='next page' onclick='showInvenModalTable("+nextInt+")'>&#10095;</button></li>";
            pageUL.html(str2);

        }
    );
}


function availability(){
    var invenModaltbl = document.getElementById('inven-modal-table');
    var rowList = invenModaltbl.rows;
    var invenModalCount=0;
    invenModalCount = document.getElementById('inven-detail-count').value;
    for(let i=1;i<rowList.length;i++){
        var row = rowList[i];
        var row_count = row.cells[3].innerHTML;
        if(Number(invenModalCount) > row_count){
            rowList[i].cells[4].innerHTML="불가능";
        }
        if(Number(invenModalCount) <= row_count){
            rowList[i].cells[4].innerHTML="가능";
        }
        if(invenModalCount == ""){
            rowList[i].cells[4].innerHTML="불가능";
        }
    }
}

//세션 2의 모달 안 테이블 행 클릭 시 동작하는 구간
function invenModalTrValue(){
    var table = document.getElementById('inven-modal-table');
    var rowList = table.rows;

    for(i=1;i<rowList.length;i++){
        var row = rowList[i];

        row.onclick = function(){
            return function(){
                var str = "";
                var storageNum = this.cells[0].innerHTML;

                document.getElementById('inven-detail-storage').value=storageNum;
            };
        }(row);
    }
}

// 세션 2의 출고 버튼 클릭 시 나오는 모달 안에 select의 인덱스 값 가져오기
var checkindex2 = document.querySelectorAll('#invenSel .sel__box__options');
var modalindex2;
checkindex2.forEach((target, index) => target.addEventListener('click',function(){
    modalindex2=index;
}));

function invenModalInsert(){
        var goodsName = document.getElementById('inven-goods-name'); // select 태그
        var option = goodsName.options[goodsName.selectedIndex]; // select 태그에 선택된 값 가져오기
        var goodsnum = option.value;
        var name = option.text;

        var invenModalCount = document.getElementById('inven-detail-count').value;
        var dateVal = document.getElementById('inven-detail-date').value;

        var storage = document.getElementById('inven-detail-storage').value;
        console.log(name, invenModalCount, dateVal, storage);

        goodsService.outterSet(
            {finishedgoodsinventory_goods_id:goodsnum, finishedgoodsinventory_goods_name:name, finishedgoodsinventory_quantity:invenModalCount, finishedgoodsinventory_date:dateVal, finishedgoodsinventory_storage:storage},
            function(result){

            }
        );
        document.getElementById('inven-detail-count').value="";
        document.getElementById('inven-detail-date').value=null;
        document.getElementById('inven-detail-storage').value="";

        document.querySelectorAll('.inven-modal-select .sel__box__options')[modalindex2]=null;
        document.querySelectorAll('.inven-modal-select .sel__placeholder')[0].textContent="제품 이름";

        goodsName.options[0].selected = true;
        option=null;

        showInvenModalTable(1, 0);
        $('#inven-modal').modal('hide');
}

</script>