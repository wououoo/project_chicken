<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="/resources/css/default/fullpage/jquery.fullpage.css" rel="stylesheet" />

<style>
    .goods-modal{
        height:300px;
    }

    .rwd-table{
        margin:0;
        padding:0;
        text-align:left;
    }

    .containerdiv{
        display:flex;
        flex-direction:column;
        justify-content:center;
        align-items:center;
        padding:30px;
        border:1px solid rgba(0,0,0,0.18);
        background-color:white;
        border-radius:10px;
        width:80%;
        height:auto;
    }
    .containerGoods{
        display:flex;
        justify-content:center;
        margin:10px;
        margin-bottom:100px;
        height:auto;
    }

    .title-name{
        display:flex;
        justify-content:center;
        align-items:center;
        width:100%;
    }

    .title-name, .modal-header, #closeBtn{
        font-family: 'PuradakGentleGothicR';
    }

    .goodstitle{
        display:flex;
        justify-content:space-between;
        align-items:center;
        width:100%;
        margin:20px 0;
        padding:10px;
        padding-top:30px;
        border:1px solid rgba(0,0,0,0.18);
    }

    .goodsfooter{
        display:flex;
        justify-content:center;
        align-items:center;
        margin-top:50px;
    }
    .table-height{
        height:auto;
    }

    .goods-btn{
        display:flex;
        justify-content:flex-end;
        align-items:center;
    }

    .select-div{
        display:flex;
        justify-content:space-between;
        align-items:center;
        width:100%;
    }
    .inputDivBox{
        margin:0;
        padding:0;
    }

    #search-input{
        width:200px;
        margin:0 20px;
    }

    .select-box{
        display:flex;
    }
    .rwd-table, .goodsfooter, .select-div{
        font-family: 'Pretendard-Regular';
    }

    .modal-input{
        margin-top:40px;
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
        display:flex;
    }

    .float-right{
        margin-top:20px;
    }

    #goods-status .sel{
        width:90px;
    }
    #instructionEmployeeBox{
        margin-top: 30px;
    }

    .selectRowClickInstructionForUpdate{
        display: flex;
        width: 110%;

    }

    .updateInstructionBoxForControl{
        width: 40%;
        margin-top: 3%;
        margin-bottom: 5%;
        margin-left: 5%;
        align-items: center;
        justify-content:space-between;

    }
</style>

<div class="fullpage">
    <div class="section">
        <div>
            <div class="scroll"> <!-- 섹션 구간에 스크롤 지정 -->
                <div class="containerGoods">
                    <div class="containerdiv">
                        <div class="goodscontents">
                        <div class="title-name"><h1>제조 지시</h1></div> <!-- 제목 -->
<!-- 검색 및 추가하는 상단 구간 -->
                        <div class="goodstitle">
                            <div class="select-div">
                                <div class="select-box">
                                    <div id="goods-status">
                                        <div class="sel sel--black-panther">
                                            <select name="select-profession" id="select-status">
                                                <option disabled>상태</option>
                                                <option value="3">전체</option>
                                                <option value="0">제조전</option>
                                                <option value="1">제조중</option>
                                                <option value="2">완료</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="search-input" class = "inputDivBox">
                                        <input id="search-goods" class = "inputBox" type="text" required>
                                        <label class = "inputLabelTag">검색</label>
                                        <span class = "inputSpanTag"></span>
                                    </div>
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="showGoodsList(1)">검색</button>
                                </div>
                                <div class="goods-btn">
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2 modalBtn" id="testModal">지시</button>
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
                                        <ul class="pagination instructionPaging">

                                        </ul>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

<!-- 2번째 섹션 -->
    <div class="section">
        <div>
            <div class="scroll"> <!-- 섹션 구간에 스크롤 지정 -->
                <div class="containerGoods">
                    <div class="containerdiv">
                        <div class="performContent">
                        <div class="title-name"><h1>제조 수행</h1></div> <!-- 제목 -->
<!-- 검색 및 추가하는 상단 구간 -->
                        <div class="goodstitle">
                            <div class="select-div">
                                <div class="select-box">
                                    <div id="goods-status">
                                        <div class="sel sel--black-panther">
                                            <select name="select-profession" id="select-perform-option">
                                                <option disabled>상태</option>
                                                <option value="4">전체</option>
                                                <option value="1">1번라인</option>
                                                <option value="2">2번라인</option>
                                                <option value="3">3번라인</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="search-input" class = "inputDivBox">
                                        <input id="search-recipe_Name" class = "inputBox" type="text" required>
                                        <label class = "inputLabelTag">검색</label>
                                        <span class = "inputSpanTag"></span>
                                    </div>
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick="showPerformList(1)">검색</button>
                                </div>
                                <div class="insertPerformBtn-btn">
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="insertPerformBtn" >수행</button>
                                </div>
                            </div>
                        </div>

<!-- 테이블 영역 -->
                        <div class="table-height">
                                    <table id="perform-table" class="rwd-table">
                                        <tbody>

                                        </tbody>
                                    </table>
                        </div>

<!-- 페이징 보여지는 구간 -->
                                <div class="goodsfooter">
                                    <div class="pagination__wrapper">
                                        <ul class="pagination paginationForPerform">

                                        </ul>
                                    </div>
                                </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
<!-- 3번째 섹션  -->

</div>

<!-- 지시 버튼 누를 시 나오는 모달 -->
<div class="modal fade" id="modalArea" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제조 지시</h5>
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
                                            <select id = "select-status1">
                                                <option disabled>--선택--</option>
                                                <c:forEach items="${recipe}" var="recipeItem">
                                                    <option><c:out value="${recipeItem.recipe_Name}"/></option>
                                                </c:forEach>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <div class = "inputDivBox">
                                        <input class = "inputBox" type="text" id="instructionAmount" required>
                                        <label class = "inputLabelTag">제조 수량</label>
                                        <span class = "inputSpanTag"></span>
                                    </div>

                                    <div class = "inputDivBox" margin-top ="40px" id = "instructionEmployeeBox">
                                        <input class = "inputBox" type="text" id="instructionEmployee" required>
                                        <label class = "inputLabelTag">지시자</label>
                                        <span class = "inputSpanTag"></span>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-insert-btn" onclick= "InsertInstruction()">제조지시</button>
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

<!-- 수행 버튼 누를 시 나오는 모달 -->
<div class="modal fade" id="insertModalBox" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제조 지시</h5>
            </div>
     <!-- Modal body -->
            <div class="modal-body">
                <div class="row">
                    <div class="goods-modal">
                        <div class="goods-insert">
                            <div class="modal-input-box" style = "width: 100%;">
                                <div class="modal-input">
                                    <div id="selectbox">
                                        <select  style = "font-size: 18px;" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example" id = "selectBoxForInsertPerform">
                                              <option disabled>--선택--</option>
                                               <c:forEach items="${insertPerform}" var="insertPerformItem">
                                                  <option value = "<c:out value='${insertPerformItem.instruction_Id}'/>">제조번호: <c:out value='${insertPerformItem.instruction_Id}'/> | 제품명: <c:out value='${insertPerformItem.recipe_Name}'/> | 지시자: <c:out value='${insertPerformItem.instruction_Employee}'/> | 지시수량: <c:out value='${insertPerformItem.output}'/> |
                                                  생산수량: <c:out value='${insertPerformItem.remainingProduction}'/></option>
                                               </c:forEach>
                                        </select>
                                    </div>
                                </div>
                                <div class="modal-input">
                                    <select class="form-select form-select mb-3" id = "insertPerformManufacturingLine" aria-label=".form-select-lg example">
                                          <option disabled>--선택--</option>
                                          <option value = "1">제조 라인: 1번 라인</option>
                                          <option value = "2">제조 라인: 2번 라인</option>
                                          <option value = "3">제조 라인: 3번 라인</option>
                                    </select>
                                    <select class="form-select form-select mb-3" id = "insertPerformAmount" aria-label=".form-select-lg example" >
                                          <option disabled>--선택--</option>
                                          <option value = "100">생산수량: 100개</option>
                                          <option value = "200">생산수량: 200개</option>
                                          <option value = "300">생산수량: 300개</option>
                                          <option value = "400">생산수량: 400개</option>
                                          <option value = "500">생산수량: 500개</option>
                                    </select>
                                    <select class="form-select form-select mb-3" id = "insertPerformEmpName"aria-label=".form-select-lg example">
                                          <option value ="자기이름">수행자: 세션으로 받은 자기 이름</option>
                                    </select>

                                </div>
                                <div class="modal-input">
                                    <button class="btn btn-sm btn-secondary ml-2 mt-2" onclick= "javascript: InsertPerformForControl();">제조 수행</button>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right; position : relative; margin-right: 1%;z-index: 999;">
                    <button type="button" class="btn mr-2 mb-2" id="closePerformBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- 테이블 선택 시 나오는 모달 -->
<div class="modal fade" id="goods-row-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제조지시서 수정</h5>
            </div>
     <!-- Modal body -->
            <div class="modal-body">
                <div class="row selectRowClickInstructionForUpdate">

                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-insert-btn" onclick= "UpdateInstruction()" style= "margin-bottom: 1.8%;">제조수행서 수정</button>
                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-insert-btn" onclick= "DeleteInstruction()" style= "margin-bottom: 1.8%;">삭제</button>
                    <button type="button" class="btn mr-2 mb-2" id="goodsCloseBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="modal fade" id="perform-row-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5>제조수행서 수정</h5>
            </div>
     <!-- Modal body -->
            <div class="modal-body">
                <div class="row selectRowClickPerformForUpdate">

                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="timeStatusChange" onclick= "updatePerformTimeStatus()" style= "margin-bottom: 1.8%;">작업 실행</button>
                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-insert-btn" onclick= "updatePerform()" style= "margin-bottom: 1.8%;">생산량 수정</button>
                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-insert-btn" onclick= "deletePerform()" style= "margin-bottom: 1.8%;">삭제</button>
                    <button type="button" class="btn mr-2 mb-2" id="performCloseBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="DI-check-modal" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal">
        <div class="modal-content">
            <div class="modal-header">
                <h5>불량품</h5>
            </div>
     <!-- Modal body -->
            <div class="modal-body">
                <div class="row inputDICount">

                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="timeStatusChange" onclick= "updatePerformTimeStatus()" style= "margin-bottom: 1.8%;">작업 실행</button>
                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-insert-btn" onclick= "updatePerform()" style= "margin-bottom: 1.8%;">생산량 수정</button>
                    <button class="btn btn-sm btn-secondary ml-2 mt-2" id="goods-insert-btn" onclick= "deletePerform()" style= "margin-bottom: 1.8%;">삭제</button>
                    <button type="button" class="btn mr-2 mb-2" id="performCloseBtn">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>


<script src="/resources/js/default/fullpage/jquery.fullpage.js"></script>
<script src="/resources/js/default/fullpage/scrolloverflow.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>

    <script>
        document.title="완제품 관리"; //화면 위에 title 이름 변경

        //특정 구간을 넘으면 검색 바 사라지는 로직
        window.addEventListener("resize", function() {
            if(document.getElementsByClassName('containerdiv')[0].getBoundingClientRect().width<463){
                document.getElementsByClassName('goodstitle')[0].style.display="none";
            } else{
                document.getElementsByClassName('goodstitle')[0].style.display="flex";
            }
        });

        $(function(){
            // 모달 오픈 (show)
            $(document).on('click', '.modalBtn', function(){
                $('#modalArea').modal('show');
            });
            $(document).on('click', '#insertPerformBtn', function(){
                $('#insertModalBox').modal('show');
            });

            // 모달 종료 (hide)
            $(document).on('click', '#closePerformBtn', function(){
                $('#insertModalBox').modal('hide');
            });

            // 모달 종료 (hide)
            $(document).on('click', '#closeBtn', function(){
                $('#modalArea').modal('hide');
            });
        });

        // 수행버튼 클릭 시 모달 창 열림
        $(function(){
            $(document).on('click', '#performCloseBtn', function(){
                $('#perform-row-modal').modal('hide');
            });

            $(document).on('click', '#goodsCloseBtn', function(){
                $('#goods-row-modal').modal('hide');
            });

       })

        var selectBox = document.querySelector('.form-select');


       // 초기에는 선택 불가능한 상태로 설정
       selectBox.selectedIndex = 0;

       // select 박스를 클릭했을 때 이벤트 처리
       selectBox.addEventListener('click', function() {
           // 만약 선택된 값이 없다면
           if (selectBox.selectedIndex === 0) {
               // 선택 불가능한 상태로 다시 설정
               selectBox.selectedIndex = -1;
           }
       });

        $(function() {
            var page = $('.fullpage').fullpage({
                menu:'.sb-topnav',
                anchors: ['firstPage', 'secondPage'],

                // 1. 네비게이션 보이기 옆에 생기는 선택 버튼 허용
                navigation : true,

                // 2. 네비게이션 위치 지정 옆에 생기는 선택 버튼
                navigationPosition : 'right',

                // 3. 각 섹션의 배경색상 지정 (6자의 핵사코드 작성가능)
                sectionsColor : ['#E5DDC5', 'gray'],

                // 스크롤 허용을 원하는 요소의 클래스
                scrollOverflow: true, //섹션 내용이 커지면 저절로 섹션 구간에 스크롤 생김

            });
        });

        //모달 안에 select의 인덱스 값 가져오기
        var checkindex = document.querySelectorAll('.modal-input .sel__box__options');
        var modalindex;
        checkindex.forEach((target, index) => target.addEventListener('click',function(){
            modalindex=index;
        }));

        const goodsInsert = document.getElementById('goods-insert-btn');

        //테이블 행 클릭 시 동작하는 구간
        function rowClicked() {
            var table = document.getElementById('goods-table');
            var rowList = table.rows;

            for(i=1;i<rowList.length;i++){
                var row = rowList[i];
                var tdsNum = row.cells;

                row.onclick = function(currentRow){

                   return function(){
                        var instructionId = currentRow.cells[1].innerText;
                        goodsModal(instructionId);
                    };
                }(row);
            }

        }

        function rowClickedPerform() {
            var performTable = document.getElementById('perform-table');
            var performRowList = performTable.rows;

            for(i=1;i<performRowList.length;i++){
                var row = performRowList[i];
                var tdsNum = row.cells;

                row.onclick = function(currentRow){

                   return function(){
                        var performId = currentRow.cells[1].innerText;
                             (performId);
                        performModal(performId);
                    };
                }(row);
            }
        }

        function performModal(perform_Id){
            $('#perform-row-modal').modal('show');
            var performModalbody = $('.selectRowClickPerformForUpdate');
            var sendData = {perform_Id : perform_Id};
            var str = "";
            $.ajax({
                type: 'POST',
                url: '/perform/rest/selectRowClickPerform/' + perform_Id,
                data: JSON.stringify(sendData),
                contentType: "application/json",
                success: function(response) {
                    var saline = moment(response.saline).format('YYYY-MM-DD hh:mm');
                    var seasoning = moment(response.seasoning).format('YYYY-MM-DD hh:mm');
                    var cooking = moment(response.cooking).format('YYYY-MM-DD hh:mm');
                    var packaging = moment(response.packaging).format('YYYY-MM-DD hh:mm');
                    var start_Date = moment(response.start_Date).format('YYYY-MM-DD hh:mm');
                    var end_Date = moment(response.end_Date).format('YYYY-MM-DD hh:mm');

                    if (saline == null || saline == "undefined" || saline == "Invalid date"){
                        saline = "";
                    } else {
                        saline = moment(response.saline).format('YYYY-MM-DD hh:mm');
                    }
                    if (seasoning == null || seasoning == "undefined" || seasoning == "Invalid date"){
                        seasoning = "";
                    } else {
                        seasoning = moment(response.seasoning).format('YYYY-MM-DD hh:mm');
                    }
                    if (cooking == null || cooking == "undefined" || cooking == "Invalid date"){
                        cooking = "";
                    } else {
                        cooking = moment(response.cooking).format('YYYY-MM-DD hh:mm');
                    }
                    if (packaging == null || packaging == "undefined" || packaging == "Invalid date"){
                        packaging = "";
                    } else {
                        packaging = moment(response.packaging).format('YYYY-MM-DD hh:mm');
                    }
                    if (start_Date == null || start_Date == "undefined" || start_Date == "Invalid date"){
                        start_Date = "";
                    } else {
                        start_Date = moment(response.start_Date).format('YYYY-MM-DD hh:mm');
                    }
                    if (end_Date == null || end_Date == "undefined" || end_Date == "Invalid date"){
                        end_Date = "";
                    } else {
                        end_Date = moment(response.end_Date).format('YYYY-MM-DD hh:mm');
                    }

                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.instruction_Id + '" name = "instruction_Id" id = "bringInstruction_Id"  class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">지시 번호</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.perform_Id + '" name = "perform_Id" id = "bringPerform_Id"  class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">수행번호</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.manufacturing_Line + '" name = "manufacturing_Line" id = "bringPerformManufacturing_Line"  class="inputBox" required>';
                    str += '<label class="inputLabelTag">제조라인(수정가능)</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.recipe_Name + '" name = "recipe_Name" id = "bringRecipeName" class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">품명</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                     str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.output + '" name = "output" id = "bringPerformOutput" class="inputBox" required>';
                    str += '<label class="inputLabelTag">생산량(수정가능)</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                     str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.perform_Employee + '" name = "Perform_Employee" id = "bringPerformEmployee" class="inputBox" required>';
                    str += '<label class="inputLabelTag">수행자(수정가능)</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + saline + '" name = "saline" id = "saline' + saline +'" class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">염지</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + cooking + '" name = "saline" id = "cooking' + cooking +'" class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">조리</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + seasoning + '" name = "seasoning" id = "seasoning' + seasoning +'" class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">양념</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + packaging + '" name = "packaging" id = "packaging' + packaging +'" class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">포장</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';

                    performModalbody.html(str);
                    var inputField = document.getElementById('perform_Id' + response.perform_Id);

                    //$('#instruction_Id' + response.instruction_Id).attr("readonly", true);
                },
                error: function(xhr, status, error) {
                    alert('Failed to select: ' + error);
                }
            });
        }

        window.onload = rowClicked();

        //테이블 행 클릭 시 화면에 나오는 모달
        function goodsModal(instruction_Id){
            $('#goods-row-modal').modal('show');
            var modalbody = $('.selectRowClickInstructionForUpdate');
            var sendData = {instruction_Id : instruction_Id};
            var str = "";
            $.ajax({
                type: 'POST',
                url: '/instruction/rest/selectRowClickInstruction/' + instruction_Id,
                data: JSON.stringify(sendData),
                contentType: "application/json",
                success: function(response) {
                    var Instruction_Date = moment(response.instruction_Date).format('YYYY-MM-DD hh:mm');


                    var Modify_Date;
                    if (response.modify_Date == null || response.modify_Date == undefined){
                        Modify_Date = "최초 등록";
                    } else {
                        Modify_Date = moment(response.modify_Date).format('YYYY-MM-DD hh:mm');
                    }
                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.instruction_Id + '" name = "instruction_Id" id = "bringInstruction_Id"  class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">instruction_Id</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                    str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.recipe_Name + '" name = "recipe_Name" id = "bringRecipe_Name' + response.recipe_Name +'" class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">recipe_Name</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                     str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.output + '" name = "output" id = "bringOutput" class="inputBox" required>';
                    str += '<label class="inputLabelTag">output(수정가능)</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                     str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + response.instruction_Employee + '" name = "instruction_Employee" id = "instruction_Employee' + response.instruction_Employee +'" class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">instruction_Employee</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                     str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + Instruction_Date + '" name = "instruction_Date" id = "instruction_Date' + Instruction_Date +'" class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">instruction_Date</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                     str += '<div class="updateInstructionBoxForControl">';
                    str += '<div class="inputDivBox">';
                    str += '<input type="text" value="' + Modify_Date + '" name = "modify_Date" id = "modify_Date' + Modify_Date +'" class="inputBox" required readonly>';
                    str += '<label class="inputLabelTag" style="position:absolute; bottom: 40px; font-weight: bold; font-size: 16px; color: #666;">modify_Date</label>';
                    str += '<span class="inputSpanTag"></span>';
                    str += '</div>';
                    str += '</div>';
                    modalbody.html(str);
                    var inputField = document.getElementById('instruction_Id' + response.instruction_Id);

                    //$('#instruction_Id' + response.instruction_Id).attr("readonly", true);
                },
                error: function(xhr, status, error) {
                    alert('Failed to select: ' + error);
                }
            });
        }

        // Ajax 값 넣는 부분
        var instructionService = (function() {
            var pageSizeNum=5;

            //상품 조회
            function getInstruction(goodsSearch, callback, error){
                var search = goodsSearch.search || "없음";
                var status = goodsSearch.status;
                var page = goodsSearch.page || 1;

                $.getJSON("/instruction/rest/search/"+search+"/page/"+page+"/pagesize/"+pageSizeNum + "/" + status,
                    function(data){
                        if(callback){
                            callback(data);
                        }
                }).fail(function(xhr,status,err){
                    if(error){
                        error();
                    }
                });
            }

            function maxPage(goodsSearch, callback, error){
                var search = goodsSearch.search || "없음";
                var status = goodsSearch.status;
                $.getJSON("/instruction/rest/"+search+"/" + status + "/pageSize/"+pageSizeNum,
                    function(data){
                        if(callback){
                            callback(data);
                        }
                }).fail(function(xhr,status,err){
                    if(error){
                        error();
                    }
                });
            }

            return {
                getInstruction:getInstruction,
                maxPage:maxPage
            };
        })();

        var performService = (function() {
            var pageSizeNum1=5;

            //상품 조회
            function getPerform(perform, callback, error){
                var search = perform.search || "없음";
                var manufacturing_Line = perform.manufacturing_Line;
                var page = perform.page || 1;

                $.getJSON("/perform/rest/search/"+search+"/page/"+page+"/pagesize/"+pageSizeNum1 + "/" + manufacturing_Line,
                    function(data){
                        if(callback){
                            callback(data);
                        }
                }).fail(function(xhr,status,err){
                    if(error){
                        error();
                    }
                });
            }

            function maxpageCount(perform, callback, error){
                var search = perform.search || "없음";
                var manufacturing_Line = perform.manufacturing_Line;
                $.getJSON("/perform/rest/"+search+"/" + manufacturing_Line + "/pageSize/"+pageSizeNum1,
                    function(data){
                        if(callback){
                            callback(data);
                        }
                }).fail(function(xhr,status,err){
                    if(error){
                        error();
                    }
                });
            }

            return {
                getPerform:getPerform,
                maxpageCount:maxpageCount
            };
        })();

        var goodsTableUL = $("#goods-table tbody");
        function showGoodsList(pageNum) {
            var instructionStatus = document.getElementById('select-status');
            var goodsSearch = document.getElementById('search-goods');
            var option = instructionStatus.options[instructionStatus.selectedIndex];
            var status = option.value;
            var search = goodsSearch.value;

            instructionService.getInstruction(
            { status: status, search: search , page: pageNum || 1 },
                function(list) {

                    var str = "";
                    str+="<tr>";
                    str+="<th>번호</th>";
                    str+="<th>지시 번호</th>";
                    str+="<th>제 픔 명</th>";
                    str+="<th>생 산 량</th>";
                    str+="<th>지 시 자</th>";
                    str+="<th>지 시 일</th>";
                    str+="<th>지시 상태</th>";
                    str+="</tr>";

                    if(list == null || list.length == 0){
                        goodsTableUL.html(str);
                        return;
                    }

                    for(var i = 0, len = list.length || 0; i < len; i++) {
                        str += "<tr onclick='rowClicked()'>";
                        str += "<td data-th='번호'>"+list[i].rn+"</td>";
                        str += "<td data-th='지시 번호'>"+list[i].instruction_Id+"</td>";
                        str += "<td data-th='제 품 명'>"+list[i].recipe_Name+"</td>";
                        str += "<td data-th='생 산 량'>"+list[i].output+"</td>";
                        str += "<td data-th='지 시 자'>"+list[i].instruction_Employee+"</td>";
                        str += "<td data-th='지 시 일'>"+moment(list[i].instruction_Date).format('YYYY-MM-DD hh:mm')+"</td>";
                        if(list[i].manufacturing_Status==0){
                            str += "<td data-th='제품 상태'>제조 전</td>";
                        } else if(list[i].manufacturing_Status==1){
                            str += "<td data-th='제품 상태'>제조 중</td>";
                        } else if(list[i].manufacturing_Status==2){
                            str += "<td data-th='제품 상태'>제조 완료</td>";
                        }
                        str += "</tr>";
                    }
                    goodsTableUL.html(str);
                    createPage(search, status, pageNum);
                }
            );
        }
        showGoodsList(1);

        var performTableUL = $("#perform-table tbody");

        function showPerformList(performPageNum) {
            var performStatus = document.getElementById('select-perform-option');
            var recipeSearch = document.getElementById('search-recipe_Name');
            var option = performStatus.options[performStatus.selectedIndex];
            var manufacturing_Line = option.value;
            var search = recipeSearch.value;

            performService.getPerform(
            { manufacturing_Line: manufacturing_Line, search: search , page: performPageNum || 1 },
                function(list) {

                    var str = "";
                    str+="<tr>";
                    str+="<th>번호</th>";
                    str+="<th>수행 번호</th>";
                    str+="<th>생산 라인</th>";
                    str+="<th>제 픔 명</th>";
                    str+="<th>생 산 량</th>";
                    str+="<th>수 행 자</th>";
                    str+="<th>시작 시간</th>";
                    str+="<th>종료 시간</th>";
                    str+="<th>상태</th>";
                    str+="</tr>";

                    if(list == null || list.length == 0){
                        performTableUL.html(str);
                        return;
                    }

                    for(var i = 0, len = list.length || 0; i < len; i++) {
                        str += "<tr onclick='rowClickedPerform()'>";
                        str += "<td data-th='번호'>"+list[i].rn+"</td>";
                        str += "<td data-th='수행 번호'>"+list[i].perform_Id+"</td>";
                        str += "<td data-th='생산 라인'>"+list[i].manufacturing_Line+"</td>";
                        str += "<td data-th='제 품 명'>"+list[i].recipe_Name+"</td>";
                        str += "<td data-th='생 산 량'>"+list[i].output+"</td>";
                        str += "<td data-th='수 행 자'>"+list[i].perform_Employee+"</td>";
                        //str += "<td data-th='시작 시간'>"+moment(list[i].start_Date).format('YYYY-MM-DD hh:mm')+"</td>";
                        //str += "<td data-th='종료 시간'>"+moment(list[i].end_Date).format('YYYY-MM-DD hh:mm')+"</td>";
                        if(list[i].start_Date==null){
                            str += "<td data-th='상태'>제조 전</td>";
                        } else{
                            str += "<td data-th='시작 시간'>"+moment(list[i].start_Date).format('YYYY-MM-DD hh:mm')+"</td>";
                        }

                        if(list[i].end_Date==null && list[i].start_Date==null){
                            str += "<td data-th='상태'>제조 전</td>";
                        } else if(list[i].start_Date != null && list[i].end_Date==null){
                            str += "<td data-th='상태'>제조 중</td>";
                        }
                        else{
                            str += "<td data-th='종료 시간'>"+moment(list[i].end_Date).format('YYYY-MM-DD hh:mm')+"</td>";
                        }

                        if(list[i].saline==null){
                            str += "<td data-th='상태'>제조 전</td>";
                        } else if(list[i].saline!=null&&list[i].cooking==null){
                            str += "<td data-th='상태'>염지 중</td>";
                        } else if(list[i].seasoning==null & list[i].cooking!=null){
                            str += "<td data-th='상태'>조리 중</td>";
                        } else if(list[i].seasoning!=null & list[i].packaging==null){
                            str += "<td data-th='상태'>양념 중</td>";
                        } else if(list[i].packaging!=null & list[i].end_Date==null){
                            str += "<td data-th='상태'>포장 중</td>";
                        } else if (list[i].end_Date!=null){
                            str += "<td data-th='수행 상태'>제조 완료</td>";
                        }
                        str += "</tr>";
                    }

                    performTableUL.html(str);
                    createPerformPage(search, manufacturing_Line, performPageNum);
                }
            );
        }
        showPerformList(1);

        function createPage(search,status,pageNum){
            var pageUL = $(".instructionPaging");
            instructionService.maxPage(
                { status: status, search: search},
                function(list) {
                    var str2="";
                    var prevInt;
                    if(pageNum==1){
                        prevInt=1;
                    } else{
                        prevInt=(pageNum-1);
                    }
                    var currentPageSize = 10;
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

        function createPerformPage(search,manufacturing_Line,performPageNum){
            var pagePerformUL = $(".paginationForPerform");
            performService.maxpageCount(
                { manufacturing_Line: manufacturing_Line, search: search},
                function(performList) {
                    var str3="";
                    var prevInt1;
                    if(performPageNum==1){
                        prevInt1=1;
                    } else{
                        prevInt1=(performPageNum-1);
                    }
                    var currentPerformPageSize = 5;
                    var currentPerformPageList = Math.ceil(performPageNum/currentPerformPageSize);
                    var currentPerformMaxPage = currentPerformPageList*currentPerformPageSize;

                    var currentPerformMaxPageReal;

                    if(currentPerformMaxPage>=performList){
                        currentPerformMaxPageReal=performList;
                    }
                    var currentPerformMinPage = currentPerformMaxPage-(currentPerformPageSize-1);

                    str3+="<li class='pagelist'><button class='pagebtn prev' onclick='showPerformList("+prevInt1+")'>&#10094;</button></li>";
                    for(var ii=currentPerformMinPage; ii <= currentPerformMaxPageReal; ii++) {
                        if(ii==performPageNum){
                            str3+="<li class='pagelist'><button class='pagebtn performPageNum active' onclick='showPerformList("+ii+")'>"+ii+"</button></li>";

                        } else {
                            str3+="<li class='pagelist'><button class='pagebtn performPageNum' onclick='showPerformList("+ii+")'>"+ii+"</button></li>";
                        }
                    }


                    var nextInt1;
                    if(performPageNum==performList){
                        nextInt1=performList;
                    } else{
                        nextInt1=(performPageNum+1);
                    }
                    str3+="<li class='pagelist'><button class='pagebtn next' title='next page' onclick='showPerformList("+nextInt1+")'>&#10095;</button></li>";
                    pagePerformUL.html(str3);

                }
            );
        }

    // 지시 버튼 클릭 시 레시피명 가지오기

        function InsertInstruction(){
            var output = $("#instructionAmount").val();
            var recipe_Name = $("#select-status1").val();
            var instruction_Employee = $("#instructionEmployee").val();


            var sendData = {recipe_Name : recipe_Name, output : output, instruction_Employee: instruction_Employee};



            $.ajax({
                type: 'POST',
                url: '/instruction/rest/insertInstruction/' + recipe_Name +"/" + output +"/" + instruction_Employee,
                data: JSON.stringify(sendData),
                contentType: "application/json",
                success: function(response) {
                    window.location.href = "/instruction";
                },
                error: function(xhr, status, error) {
                    alert('Failed to insert: ' + error);
                }
            });
        }

        function UpdateInstruction(){
            var instruction_Id = $("#bringInstruction_Id").val();
            var output = $("#bringOutput").val();

            var sendData = {instruction_Id: instruction_Id, output: output};

            $.ajax({
                type: 'POST',
                url: '/instruction/rest/updateInstruction/' + output +"/" +instruction_Id,
                data: JSON.stringify(sendData),
                contentType: "application/json",
                success: function(response) {
                    if(response==0){
                        alert('제조 시작 전에만 수정할 수 있습니다!');
                    } else{
                    window.location.href = "/instruction";
                    }
                },
                error: function(xhr, status, error) {
                    alert('제조 시작 전에만 수정할 수 있습니다!');
                }
            });
        }

        function DeleteInstruction(){
            var instruction_Id = $("#bringInstruction_Id").val();

            var sendData = {instruction_Id: instruction_Id};
            $.ajax({
                type: 'POST',
                url: '/instruction/rest/deleteInstruction/' + instruction_Id,
                data: JSON.stringify(sendData),
                contentType: "application/json",
                success: function(response) {
                    if(response==0){
                        alert('제조 시작 전에만 삭제할 수 있습니다!');
                    } else{
                    window.location.href = "/instruction";
                    }
                },
                error: function(xhr, status, error) {

                }
            });
        }

        function InsertPerformForControl(){
            var manufacturing_Line = $("#insertPerformManufacturingLine").val();
            var instruction_Id =$("#selectBoxForInsertPerform").val();      // 지시번호
            var output = $("#insertPerformAmount").val();           // 내가 생산할 양
            var perform_Employee = $("#insertPerformEmpName").val();
            var remainingProduction = output;
            var instructionOutput;
            var instructionRemainingProduction;
            var sendData = {
                instruction_Id: instruction_Id, manufacturing_Line: manufacturing_Line, perform_Employee: perform_Employee, output: output
            };

            var sendDataForInstruction = {
                instruction_Id: instruction_Id, remainingProduction: remainingProduction
            };

            var sendDataForSelectRecipeName = {
                instruction_Id: instruction_Id
            };




            // 직원과 공정을 확인(겹치지 않도록, 겹치면 불가함)

            $.ajax({
                type: 'POST',
                url: '/perform/rest/selectLineAndEmployee',
                contentType: "application/json",
                success: function(response0) {
                    var manufacturingLines = [];
                    var performEmployees = [];

                    for(var i = 0 ; i < response0.length ; i++){
                        manufacturingLines.push(response0[i].manufacturing_Line);
                        performEmployees.push(response0[i].perform_Employee);
                    }

                    if (performEmployees.includes(perform_Employee) && manufacturingLines.includes(manufacturing_Line)) {
                        alert("선택한 직원 및 제조 라인은 사용중입니다. ");
                    } else if(performEmployees.includes(perform_Employee) && !manufacturingLines.includes(manufacturing_Line)){
                        alert("선택한 직원은 다른 공정을 수행중입니다. ")
                    } else if(!performEmployees.includes(perform_Employee) && manufacturingLines.includes(manufacturing_Line)){
                        alert("선택한 제조 라인은 사용중입니다. ")
                    } else{
                        // 지시한양 >= 기 생산량 + 현재 수행할 생산량 + 100 까지만 가능하도록
                        $.ajax({
                            type: 'POST',
                            url: '/instruction/rest/selectRowClickInstruction/' + instruction_Id,
                            data: JSON.stringify(sendData),
                            contentType: "application/json",
                            success: function(response) {
                                var instructionOutput = response.output;                                // 지시한 양
                                var instructionRemainingProduction = response.remainingProduction;      // 기 생산량


                                var booleanCheck;

                                if(parseInt(instructionOutput) >= parseInt(instructionRemainingProduction) + parseInt(output) - 100){
                                    booleanCheck = true;
                                } else{
                                    booleanCheck = false;
                                }

                                if(booleanCheck){
                                    // updateInstructionRemainingProduction , manufacturingInstruction테이블을 업데이트 시키기 위함
                                    $.ajax({
                                        type: 'POST',
                                        url: '/instruction/rest/updateInstructionRemainingProduction/' + remainingProduction + '/'+ instruction_Id,
                                        data: JSON.stringify(sendDataForInstruction),
                                        contentType: "application/json",
                                        success: function(response1) {
                                            $.ajax({
                                                type: 'POST',
                                                url: '/perform/rest/InsertPerformForControl/' + manufacturing_Line + '/'+ instruction_Id +'/' + output + '/' + perform_Employee,
                                                data: JSON.stringify(sendData),
                                                contentType: "application/json",
                                                success: function(response2) {
                                                    $.ajax({
                                                        type: 'POST',
                                                        url: '/perform/rest/selectRecipeName/' + instruction_Id,
                                                        data: JSON.stringify(sendDataForSelectRecipeName),
                                                        contentType: "application/json",
                                                        success: function(response10) {
                                                            var recipe_Name = response10.recipe_Name;

                                                            var sendDataForUpdateAllAmount = {
                                                                output: output, recipe_Name: recipe_Name
                                                            };
                                                            $.ajax({
                                                                type: 'POST',
                                                                url: '/perform/rest/updateMaterialAllAmount/' + output + '/' + recipe_Name,
                                                                data: JSON.stringify(sendDataForUpdateAllAmount),
                                                                contentType: "application/json",
                                                                success: function(response2) {
                                                                    alert('제조 수행서가 입력되었습니다!');
                                                                    window.location.reload();
                                                                },
                                                                error: function(xhr, status, error) {
                                                                }
                                                            });
                                                        },
                                                        error: function(xhr, status, error) {
                                                        }
                                                    });
                                                },
                                                error: function(xhr, status, error) {
                                                }
                                            });
                                        },
                                        error: function(xhr, status, error) {

                                        }
                                    });
                                } else{
                                    alert('지시수량 + 100을 초과할 수 없습니다!');
                                }
                            },
                            error: function(xhr, status, error) {
                                alert('Failed to select: ' + error);
                            }
                        });
                    }
                },
                error: function(xhr, status, error) {
                    // 오류 처리
                }
            });
        }


        function updatePerform () {
            var manufacturing_Line = $("#bringPerformManufacturing_Line").val();
            var output = $("#bringPerformOutput").val();
            var perform_Employee = $("#bringPerformEmployee").val();
            var perform_Id = $("#bringPerform_Id").val();

            var selectSendData = {
                perform_Id: perform_Id
            };
            var sendData = {
                manufacturing_Line: manufacturing_Line, output : output, perform_Employee: perform_Employee, perform_Id: perform_Id
            };

             $.ajax({
                type: 'POST',
                url: '/perform/rest/selectIngPerform',
                data: JSON.stringify(selectSendData),
                contentType: "application/json",
                success: function(response){
                    for(var i = 0; i<response.length; i++){
                        if(response[i].manufacturing_Line == manufacturing_Line){
                            alert("사용 중인 제작 라인입니다.");

                            return;
                        }
                    }
                    for(var i = 0; i<response.length; i++){
                        if(response[i].perform_Employee == perform_Employee){
                            alert("다른 공정을 진행중인 직원입니다.");

                            return;
                        }
                    }
                    $.ajax({
                        type: 'POST',
                        url: '/perform/rest/selectIngStartDate/' + perform_Id,
                        data: JSON.stringify(selectSendData),
                        contentType: "application/json",
                        success: function(response1) {
                            if(response1.start_Date == null){
                                $.ajax({
                                    type: 'POST',
                                    url: '/perform/rest/update/' + manufacturing_Line + '/'+ output +'/' + perform_Employee + '/' + perform_Id,
                                    data: JSON.stringify(sendData),
                                    contentType: "application/json",
                                    success: function(response2) {
                                        alert('제조 수행서가 수정되었습니다!');
                                        window.location.reload();
                                    },
                                    error: function(xhr, status, error) {
                                    }
                                });
                            } else{
                                alert('실행 전 작업만 수정할 수 있습니다!');
                            }
                        },
                        error: function(xhr, status, error) {
                        }
                    });
                },
                error: function(xhr, status, error) {
                }
            });
        }


        function deletePerform(){
            var perform_Id = $("#bringPerform_Id").val();
            var instruction_Id = $("#bringInstruction_Id").val();
            var remainingProduction = $("#bringPerformOutput").val();


            var selectSendData = {
                perform_Id: perform_Id
            };

            var remainingProductionDeleteData = {
                instruction_Id : instruction_Id, remainingProduction: remainingProduction
            };

            $.ajax({
                type: 'POST',
                url: '/perform/rest/selectIngStartDate/' + perform_Id,
                data: JSON.stringify(selectSendData),
                contentType: "application/json",
                success: function(response1) {
                    if(response1.start_Date == null){
                        if (confirm("정말 삭제하시겠습니까??") == true){
                            $.ajax({
                                type: 'POST',
                                url: '/perform/rest/deletePerform/' + perform_Id,
                                data: JSON.stringify(selectSendData),
                                contentType: "application/json",
                                success: function(response2) {
                                    alert('제조 수행서가 삭제되었습니다!');
                                    $.ajax({
                                        type: 'POST',
                                        url: '/instruction/rest/deleteRemainingProduction/' + instruction_Id +'/' + remainingProduction,
                                        data: JSON.stringify(remainingProductionDeleteData),
                                        contentType: "application/json",
                                        success: function(response2) {
                                            alert("수량이 변경되었습니다");
                                            window.location.reload();
                                        },
                                        error: function(xhr, status, error) {
                                        }
                                    });
                                },
                                error: function(xhr, status, error) {
                                }
                            });

                        } else{
                            return;
                        }
                    } else{
                        alert('실행중인 작업은 삭제할 수 없습니다!');
                    }
                },
                error: function(xhr, status, error) {
                }
            });

        }

    function updatePerformTimeStatus(){
        var perform_Id = $("#bringPerform_Id").val();
        var instruction_Id = $("#bringInstruction_Id").val();

        var inputDICount = $("#inputDICount");
        var output = $("#bringPerformOutput").val();
        var recipe_Name = $("#bringRecipeName").val();

        var sendData = {perform_Id: perform_Id};
        var sendDataForInstruction = {instruction_Id: instruction_Id};
        var sendDataFinishedGoods = {output: output, recipe_Name: recipe_Name};

        $.ajax({
            type: 'POST',
            url: '/perform/rest/selectPerformAllTime/' + perform_Id,
            data: JSON.stringify(sendData),
            contentType: "application/json",
            success: function(response) {
                if(response.start_Date == null || response.start_Date == ""){
                    $.ajax({
                        type: 'POST',
                        url: '/perform/rest/updatePerformTimeStatus/' + perform_Id,
                        data: JSON.stringify(sendData),
                        contentType: "application/json",
                        success: function(response) {
                            alert("제조가 시작되었습니다.");
                            window.location.reload();
                        },
                        error: function(xhr, status, error) {
                        }
                    });
                } else if(response.start_Date != null && response.saline ==null){

                    $.ajax({
                        type: 'POST',
                        url: '/perform/rest/updatePerformTimeStatus2/' + perform_Id,
                        data: JSON.stringify(sendData),
                        contentType: "application/json",
                        success: function(response) {
                            alert("염지가 시작되었습니다.");
                            window.location.reload();
                        },
                        error: function(xhr, status, error) {
                        }
                    });
                } else if(response.saline !=null && response.cooking == null){
                    $('#DI-check-modal').modal('show');



                    $.ajax({
                        type: 'POST',
                        url: '/perform/rest/updatePerformTimeStatus3/' + perform_Id,
                        data: JSON.stringify(sendData),
                        contentType: "application/json",
                        success: function(response) {
                            alert("조리가 시작되었습니다.");
                            window.location.reload();
                        },
                        error: function(xhr, status, error) {
                        }
                    });
                } else if(response.cooking !=null && response.seasoning == null){
                      $.ajax({
                          type: 'POST',
                          url: '/perform/rest/updatePerformTimeStatus4/' + perform_Id,
                          data: JSON.stringify(sendData),
                          contentType: "application/json",
                          success: function(response) {
                              alert("양념이 시작되었습니다.");
                              window.location.reload();
                          },
                          error: function(xhr, status, error) {
                          }
                      });
                  } else if(response.seasoning !=null && response.packaging == null){

                      $.ajax({
                          type: 'POST',
                          url: '/perform/rest/updatePerformTimeStatus5/' + perform_Id,
                          data: JSON.stringify(sendData),
                          contentType: "application/json",
                          success: function(response) {
                              alert("포장이 시작되었습니다.");
                              window.location.reload();
                          },
                          error: function(xhr, status, error) {
                          }
                      });
                  } else if(response.packaging !=null && response.end_Date == null){
                     $.ajax({
                         type: 'POST',
                         url: '/perform/rest/updatePerformTimeStatus6/' + perform_Id,
                         data: JSON.stringify(sendData),
                         contentType: "application/json",
                         success: function(response) {
                             alert("작업이 종료 되었습니다..");
                             $.ajax({
                                 type: 'POST',
                                 url: '/instruction/rest/selectOutputAndRemainingProduction/' + instruction_Id,
                                 data: JSON.stringify(sendDataForInstruction),
                                 contentType: "application/json",
                                 success: function(response) {

                                     if(response.output <= response.remainingProduction){
                                          $.ajax({
                                              type: 'POST',
                                              url: '/instruction/rest/updateInstructionStatus/' + instruction_Id,
                                              data: JSON.stringify(sendDataForInstruction),
                                              contentType: "application/json",
                                              success: function(response) {

                                              },
                                              error: function(xhr, status, error) {
                                              }
                                          });
                                     }
                                 },
                                 error: function(xhr, status, error) {
                                 }
                             });
                             $.ajax({
                                 type: 'POST',
                                 url: '/perform/rest/selectPerformAllTime/' + output + '/' + recipe_Name,
                                 data: JSON.stringify(sendDataFinishedGoods),
                                 contentType: "application/json",
                                 success: function(response) {
                                     window.location.reload();
                                 },
                                 error: function(xhr, status, error) {
                                 }
                             });
                         },
                         error: function(xhr, status, error) {
                         }
                     });
                 }
            },
            error: function(xhr, status, error) {
            }
        });

    }


</script>

<%@ include file="../includes/footer.jsp" %>