<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<style>
    #inven-status .sel{
        width:90px;
    }
</style>

<div class="scroll"> <!-- 섹션 구간에 스크롤 지정 -->
    <div class="containerGoods">
        <div class="containerdiv">
            <div class="goodscontents">
                <div class="title-name"><h1>제품 재고 현황</h1></div> <!-- 제목 -->
                <!-- 검색 및 추가하는 상단 구간 -->
                <div class="goodstitle">
                    <div class="select-div">
                        <div class="select-box">
                            <div id="inven-status">
                                <div class="sel sel--black-panther">
                                    <select name="select-profession" id="inven-div">
                                        <option disabled>상태</option>
                                        <option value="3">전체</option>
                                        <option value="0">입고</option>
                                        <option value="1">출고</option>
                                    </select>
                                </div>
                            </div>
                            <div class = "inputDivBox">
                                <input id="search-inven" class = "inputBox" type="text" required>
                                <label class = "inputLabelTag">검색</label>
                                <span class = "inputSpanTag"></span>
                            </div>
                            <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="">검색</button>
                        </div>
                        <div class="goods-btn">
                            <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-inven-release" onclick="invenGoodsList()">출고</button>
                        </div>
                    </div>
                </div>
                <!-- 테이블 영역 -->
                <div class="table-height">
                    <table id="goods-inven-table" class="rwd-table">
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <!-- 페이징 보여지는 구간 -->
                <div class="goodsfooter">
                    <div class="pagination__wrapper">
                        <ul class="pagination sectionTwoPage">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
    // 모달 오픈 (show)
    $(document).on('click', '#goods-inven-release', function(){
        $('#inven-modal').modal('show');
    });

    // 모달 종료 (hide)
    $(document).on('click', '#invenCloseBtn', function(){
        $('#inven-modal').modal('hide');
    });
});

//세션 2의 테이블 조회하는 함수
var invenTableUL = $("#goods-inven-table tbody");
function showInvenList(pageNum) {
    var goodsStatus = document.getElementById('inven-div'); // select 태그
    var goodsSearch = document.getElementById('search-inven');
    var option = goodsStatus.options[goodsStatus.selectedIndex]; // select 태그에 선택된 값 가져오기
    var division = option.text;
    var goods = goodsSearch.value;

    goodsService.getInvenTable(
    { division: division, goods: goods , page: pageNum || 1 },
        function(list) {


            var str = "";
            str+="<tr>";
            str+="<th>재고 번호</th>";
            str+="<th>재고 구분</th>";
            str+="<th>제품 번호</th>";
            str+="<th>제품 이름</th>";
            str+="<th>수량</th>";
            str+="<th>적재 창고</th>";
            str+="<th>재고 날짜</th>";
            str+="</tr>";

            if(list == null || list.length == 0){
                invenTableUL.html(str);
                return;
            }

            for(var i = 0, len = list.length || 0; i < len; i++) {
                str += "<tr onclick=''>";
                str += "<td data-th='재고 번호'>"+list[i].finishedgoodsinventory_id+"</td>";
                str += "<td data-th='재고 구분'>"+list[i].finishedgoodsinventory_division+"</td>";
                str += "<td data-th='제품 번호'>"+list[i].finishedgoodsinventory_goods_id+"</td>";
                str += "<td data-th='제품 이름'>"+list[i].finishedgoodsinventory_goods_name+"</td>";
                str += "<td data-th='수량'>"+list[i].finishedgoodsinventory_quantity+"</td>";
                str += "<td data-th='적재 창고'>"+list[i].storage_name+"</td>";
                str += "<td data-th='재고 날짜'>"+invenDateForm(list[i].finishedgoodsinventory_date)+"</td>";
                str += "</tr>";
            }
            invenTableUL.html(str);
            createInvenPage(division, goods, pageNum);
        }
    );
}
showInvenList(1);

//세션2의 테이블 페이지네이션 생성 함수
function createInvenPage(division,goods,pageNum){
    var pageUL = $(".sectionTwoPage");
    goodsService.maxInvenPage(
        { goods: goods, division: division},
        function(list) {
            var str2="";
            var prevInt;


            //list는 페이지 최대 개수

            if(pageNum==1){             //현재 페이지가 1이면 이전 페이지 수를 1로 초기화
                prevInt=1;
            } else{
                prevInt=(pageNum-1);    //현재 페이지가 1이 아니면 -1을 한다.
            }

            var nextInt;
            if(pageNum==list){          //현재 페이지가 마지막 페이지와 같다면 다음 페이지 수를
                nextInt=list;           //마지막 페이지 수로 초기화
            } else{
                nextInt=(pageNum+1);    //아닐 경우 현재 페이지 수에 +1
            }

            var currentPageSize = 5; //한번에 보여질 페이지 개수
            var currentPageList = Math.ceil(pageNum/currentPageSize);   //현재 페이지가 속해있는 그룹 확인
            var currentMaxPage = currentPageList*currentPageSize;       //현재 그룹에서 최대 페이지 수

            var currentMaxPageReal;
            if(currentMaxPage>=list){       //총 페이지 개수가 현재 최대 페이지 개수보다 작으면 초기화
                currentMaxPageReal=list;
            }
            var currentMinPage = currentMaxPage-(currentPageSize-1);    //현재 그룹에서 최소 페이지

            str2+="<li class='pagelist'><button class='pagebtn prev' onclick='showInvenList("+prevInt+")'>&#10094;</button></li>";
            for(var i=currentMinPage; i <= currentMaxPageReal; i++) {
                if(i==pageNum){
                    str2+="<li class='pagelist'><button class='pagebtn pagenum active' onclick='showInvenList("+i+")'>"+i+"</button></li>";
                } else {
                    str2+="<li class='pagelist'><button class='pagebtn pagenum' onclick='showInvenList("+i+")'>"+i+"</button></li>";
                }
            }
            str2+="<li class='pagelist'><button class='pagebtn next' title='next page' onclick='showInvenList("+nextInt+")'>&#10095;</button></li>";

            pageUL.html(str2);
        }
    );
}

//날짜 형태 지정
function invenDateForm(invenDate){
    return invenDate.substr(0,10);
}

</script>