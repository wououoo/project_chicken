<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!--세션 1의 css-->
<style>
    #goods-status .sel{
        width:90px;
    }
    .select-box .inputDivBox{
        margin:0 20px;
    }
</style>

<div class="scroll"> <!-- 섹션 구간에 스크롤 지정 -->
    <div class="containerGoods">
        <div class="containerdiv">
            <div class="goodscontents">
                <div class="title-name"><h1>제품 관리</h1></div> <!-- 제목 -->
                <!-- 검색 및 추가하는 상단 구간 -->
                <div class="goodstitle">
                    <div class="select-div">
                        <div class="select-box">
                            <div id="goods-status">
                                <div class="sel sel--black-panther">
                                    <select name="select-profession" id="select-status">
                                        <option disabled>상태</option>
                                        <option value="3">전체</option>
                                        <option value="0">미판매</option>
                                        <option value="1">판매중</option>
                                        <option value="2">품절</option>
                                    </select>
                                </div>
                            </div>
                            <div class = "inputDivBox">
                                <input id="search-goods" class = "inputBox" type="text" required>
                                <label class = "inputLabelTag">검색</label>
                                <span class = "inputSpanTag"></span>
                            </div>
                            <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="showGoodsList(1)">검색</button>
                        </div>
                        <div class="goods-btn">
                            <button class="btn btn-sm btn-secondary ml-2 mt-2 modalBtn" id="testModal">추가</button>
                        </div>
                    </div>
                </div>
                <!-- 테이블 영역 -->
                <div class="table-height">
                    <table id="goods-table" class="rwd-table">
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <!-- 페이징 보여지는 구간 -->
                <div class="goodsfooter">
                    <div class="pagination__wrapper">
                        <ul class="pagination sectionOnePage">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
//세션 1의 추가버튼 클릭 시 나오는 모달
$(function(){
    // 모달 오픈 (show)
    $(document).on('click', '.modalBtn', function(){
        $('#modalArea').modal('show');
    });

    // 모달 종료 (hide)
    $(document).on('click', '#closeBtn', function(){
        $('#modalArea').modal('hide');
    });
});

//세션 1의 테이블 행 클릭 시 화면에 나오는 모달
function goodsModal(){
    $('#goods-row-modal').modal('show');
}
//세션 1의 테이블 행 클릭 시 나온 모달 닫는 버튼
$(function(){
    // 모달 종료 (hide)
    $(document).on('click', '#goodsCloseBtn', function(){
        $('#goods-row-modal').modal('hide');
    });
});

//세션 1의 테이블 조회하는 함수
var goodsTableUL = $("#goods-table tbody");
function showGoodsList(pageNum) {
    var goodsStatus = document.getElementById('select-status'); // select 태그
    var goodsSearch = document.getElementById('search-goods');
    var option = goodsStatus.options[goodsStatus.selectedIndex]; // select 태그에 선택된 값 가져오기
    var status = option.value;
    var search = goodsSearch.value;

    goodsService.getGoods(
    { status: status, search: search , page: pageNum || 1 },
        function(list) {


            var str = "";
            str+="<tr>";
            str+="<th>번호</th>";
            str+="<th>제품 번호</th>";
            str+="<th>제품 이름</th>";
            str+="<th>제품 수량</th>";
            str+="<th>제품 가격</th>";
            str+="<th>제품 단위</th>";
            str+="<th>제품 상태</th>";
            str+="</tr>";

            if(list == null || list.length == 0){
                goodsTableUL.html(str);
                return;
            }

            for(var i = 0, len = list.length || 0; i < len; i++) {
                str += "<tr onclick='rowClicked()'>";
                str += "<td data-th='번호'>"+list[i].rn+"</td>";
                str += "<td data-th='제품 번호'>"+list[i].finishedgoods_id+"</td>";
                str += "<td data-th='제품 이름'>"+list[i].finishedgoods_name+"</td>";
                str += "<td data-th='제품 수량'>"+list[i].finishedgoods_quantity+"</td>";
                str += "<td data-th='제품 가격'>"+list[i].finishedgoods_price+"</td>";
                str += "<td data-th='제품 단위'>"+list[i].quantity_units+"</td>";
                if(list[i].finishedgoods_status==0){
                    str += "<td data-th='제품 상태'>미판매</td>";
                } else if(list[i].finishedgoods_status==1){
                    str += "<td data-th='제품 상태'>판매중</td>";
                } else if(list[i].finishedgoods_status==2){
                    str += "<td data-th='제품 상태'>품절</td>";
                }
                str += "</tr>";
            }
            goodsTableUL.html(str);
            createPage(search, status, pageNum);
        }
    );
}
showGoodsList(1);

//세션 1의 테이블 행 클릭 시 동작하는 구간
function rowClicked() {
    var table = document.getElementById('goods-table');
    var rowList = table.rows;
    var statusJs = document.getElementById('goods-detail-status');

    for(i=1;i<rowList.length;i++){
        var row = rowList[i];

        row.onclick = function(){
            return function(){
                var str = "";
                var goodsNum = this.cells[1].innerHTML;
                var goodsName = this.cells[2].innerHTML;
                var goodsQuantity = this.cells[3].innerHTML;
                var goodsModalPrice = this.cells[4].innerHTML;
                var goodsUnit = this.cells[5].innerHTML;
                var goodsModalStatus = this.cells[6].innerHTML;

                document.getElementById('goods-detail-num').value=goodsNum;
                document.getElementById('goods-detail-name').value=goodsName;
                document.getElementById('goods-detail-quantity').value=goodsQuantity;
                document.getElementById('goods-detail-units').value=goodsUnit;
                document.getElementById('goods-detail-price').value=goodsModalPrice;

                var statusJsLen = document.getElementById('goods-detail-status-select').options.length-1;
                var statusList = document.getElementById('goods-detail-status-select');
                for(let i=0;i<statusJsLen;i++){
                    document.querySelectorAll('#goods-detail-status .sel__box__options')[i].classList.remove('selected');
                }
                for(let i=0;i<statusJsLen;i++){
                    if(statusList[i].text == goodsModalStatus){
                        statusList[i].selected=true;
                        document.querySelectorAll('#goods-detail-status .sel__box__options')[i-1].className='sel__box__options sel__box__options--black-panther selected';
                    }
                }

                document.querySelectorAll('#goods-detail-status .sel__placeholder')[0].textContent=goodsModalStatus;

                goodsModal();
            };
        }(row);
    }
}

//세션1의 테이블 페이지네이션 생성 함수
function createPage(search,status,pageNum){
    var pageUL = $(".sectionOnePage");
    goodsService.maxPage(
        { status: status, search: search},
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

            str2+="<li class='pagelist'><button class='pagebtn prev' onclick='showGoodsList("+prevInt+")'>&#10094;</button></li>";
            for(var i=currentMinPage; i <= currentMaxPageReal; i++) {
                if(i==pageNum){
                    str2+="<li class='pagelist'><button class='pagebtn pagenum active' onclick='showGoodsList("+i+")'>"+i+"</button></li>";
                } else {
                    str2+="<li class='pagelist'><button class='pagebtn pagenum' onclick='showGoodsList("+i+")'>"+i+"</button></li>";
                }
            }
            var nextInt;
            if(pageNum==list){
                nextInt=list;
            } else{
                nextInt=(pageNum+1);
            }
            str2+="<li class='pagelist'><button class='pagebtn next' title='next page' onclick='showGoodsList("+nextInt+")'>&#10095;</button></li>";
            pageUL.html(str2);

        }
    );
}

</script>