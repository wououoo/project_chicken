<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!--세션 3의 css-->
<style>
    #createStorage{
        margin-right:10px;
    }
    #storage-status .sel{
        width:90px;
    }
</style>

<div class="scroll"> <!-- 섹션 구간에 스크롤 지정 -->
    <div class="containerGoods">
        <div class="containerdiv">
            <div class="goodscontents">
                <div class="title-name"><h1>창고 관리</h1></div> <!-- 제목 -->
                <!-- 검색 및 추가하는 상단 구간 -->
                <div class="goodstitle">
                    <div class="select-div">
                        <div class="select-box">
                            <div id="storage-status">
                                <div class="sel sel--black-panther">
                                    <select name="select-profession" id="select-storage-status">
                                        <option disabled>상태</option>
                                        <option value="3">All</option>
                                        <option value="0">Empty</option>
                                        <option value="1">Full</option>
                                    </select>
                                </div>
                            </div>
                            <div class = "inputDivBox">
                                <input id="search-storage" class = "inputBox" type="text" required>
                                <label class = "inputLabelTag">검색</label>
                                <span class = "inputSpanTag"></span>
                            </div>
                            <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="showStorageList(1)">검색</button>
                        </div>
                        <div class="goods-btn">
                            <button class="btn btn-sm btn-secondary ml-2 mt-2" id="createStorage">창고 추가</button>
                        </div>
                    </div>
                </div>
                <!-- 테이블 영역 -->
                <div class="table-height">
                    <table id="storage-table" class="rwd-table">
                        <tbody>

                        </tbody>
                    </table>
                </div>
                <!-- 페이징 보여지는 구간 -->
                <div class="goodsfooter">
                    <div class="pagination__wrapper">
                        <ul class="pagination sectionThreePage">

                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script>
$(function(){
    // 세션 3의 창고 추가 모달 실행 (show)
    $(document).on('click', '#createStorage', function(){
        $('#storage-create-modal').modal('show');

        //모달 실행시 뒷 배경 스크롤 막는 코드
        $('body').on('scroll touchmove mousewheel', function(event) {
            event.preventDefault();
            event.stopPropagation();
            return false;
        });
        setTimeout(function(){
            map.relayout();
        }, 4000);
    });

    // 세션 3의 창고 추가 모달 종료 (hide)
    $(document).on('click', '#storageClose', function(){
        $('#storage-create-modal').modal('hide');

        //모달 종료 시 뒷 배경 스크롤 실행 코드
        $('body').off('scroll touchmove mousewheel');
    });
});
function storagePlusHide(){
    $('#storage-create-modal').modal('hide');

    //모달 종료 시 뒷 배경 스크롤 실행 코드
    $('body').off('scroll touchmove mousewheel');
}

//세션 3의 테이블 행 클릭 시 화면에 나오는 모달
function storageModal(){
    $('#storage-row-modal').modal('show');
}
//세션 3의 테이블 행 클릭 시 나온 모달 닫는 버튼
$(function(){
    // 모달 종료 (hide)
    $(document).on('click', '#storageCloseBtn', function(){
        $('#storage-row-modal').modal('hide');
    });
});

//세션 3의 테이블 조회하는 함수
var storageTableUL = $("#storage-table tbody");
function showStorageList(pageNum) {
    var search = document.getElementById('search-storage').value;
    var storageStatus = document.getElementById('select-storage-status'); // select 태그
    var option = storageStatus.options[storageStatus.selectedIndex]; // select 태그에 선택된 값 가져오기
    var status = option.value;


    goodsService.getStorage(
    { status: status, search: search , page: pageNum || 1 },
        function(list) {
            var str = "";
            str+="<tr>";
            str+="<th>창고 번호</th>";
            str+="<th>창고 이름</th>";
            str+="<th>창고 주소</th>";
            str+="<th>적재량</th>";
            str+="<th>수용량</th>";
            str+="</tr>";

            if(list == null || list.length == 0){
                storageTableUL.html(str);
                return;
            }

            for(var i = 0, len = list.length || 0; i < len; i++) {
                str += "<tr onclick='rowStorageClicked()'>";
                str += "<td data-th='창고 번호'>"+list[i].storage_id+"</td>";
                str += "<td data-th='창고 이름'>"+list[i].storage_name+"</td>";
                str += "<td data-th='창고 주소'>"+list[i].storage_address+"</td>";
                str += "<td data-th='적재량'>"+list[i].storage_current_amount+"</td>";
                str += "<td data-th='수용량'>"+list[i].storage_total_amount+"</td>";
                str += "</tr>";
            }

            storageTableUL.html(str);
            createStoragePage(search, status, pageNum);
        }
    );
}
showStorageList(1);

//세션3의 테이블 페이지네이션 생성 함수
function createStoragePage(search,status,pageNum){
    var pageUL = $(".sectionThreePage");
    goodsService.maxStoragePage(
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

            str2+="<li class='pagelist'><button class='pagebtn prev' onclick='showStorageList("+prevInt+")'>&#10094;</button></li>";
            for(var i=currentMinPage; i <= currentMaxPageReal; i++) {
                if(i==pageNum){
                    str2+="<li class='pagelist'><button class='pagebtn pagenum active' onclick='showStorageList("+i+")'>"+i+"</button></li>";
                } else {
                    str2+="<li class='pagelist'><button class='pagebtn pagenum' onclick='showStorageList("+i+")'>"+i+"</button></li>";
                }
            }
            var nextInt;
            if(pageNum==list){
                nextInt=list;
            } else{
                nextInt=(pageNum+1);
            }
            str2+="<li class='pagelist'><button class='pagebtn next' title='next page' onclick='showStorageList("+nextInt+")'>&#10095;</button></li>";
            pageUL.html(str2);

        }
    );
}

//세션 3의 테이블 행 클릭 시 동작하는 구간
function rowStorageClicked() {
    var table = document.getElementById('storage-table');
    var rowList = table.rows;

    for(i=1;i<rowList.length;i++){
        var row = rowList[i];

        row.onclick = function(){
            return function(){
                var str = "";
                var storageNum = this.cells[0].innerHTML;
                var storageName = this.cells[1].innerHTML;
                var storageAddress = this.cells[2].innerHTML;
                var storageCurrent = this.cells[3].innerHTML;
                var storageTotal = this.cells[4].innerHTML;

                document.getElementById('storage-detail-num').value=storageNum;
                document.getElementById('storage-detail-name').value=storageName;
                document.getElementById('storage-detail-address').value=storageAddress;
                document.getElementById('storage-detail-current').value=storageCurrent;
                document.getElementById('storage-detail-total').value=storageTotal;


                storageModal();
            };
        }(row);
    }
}
</script>