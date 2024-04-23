<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.7.1.js" integrity="sha256-eKhayi8LEQwp4NKxN+CfCh+3qOVUtJn3QNZ0TciWLP4=" crossorigin="anonymous"></script>


<style>
    @font-face {
        font-family: 'PuradakGentleGothicR';
        src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_11-01@1.1/PuradakGentleGothicR.woff2') format('woff2');
        font-weight: normal;
        font-style: normal;
    }

    .container {
        margin-left: 20px;
        margin-top: 5%;
        width: 100%;
        height: 600PX;
        display: grid;
        overflow-y: scroll;
        grid-template-columns: 1fr 1fr;
        grid-template-columns: 200px 200px 200px;  <!--떨어진 거리-->
        row-gap: 300px;
        column-gap: 150px;
    }

    .item{
        width: 300px;
        height: 250px;
        text-align: center;
        align-items: center;
        justify-content: center;
        overflow: hidden;
    }

    .chickenPhotoBox{
       width: 300px;
       height: 200px;
       overflow: hidden;
    }

    .namePhotoBox{
        margin-top: 20px;
        width: 300px;
        height: 50px;
        font-family: 'PuradakGentleGothicR';
    }

    .recipeBtnBigBox{
        width: 100%;
        height: 50px;
        display: flex;
    }
    .recipeBtnLeftBox{
        width: 33%;
    }
    .recipeBtnMidBox{
        width: 33%;
    }

    .recipeBtnRightBox{
        margin-right: 2%;
        text-align: right;
        width: 34%;
    }
    .recipeHeadNameBox{
        margin-top: 2%;
        margin-bottom: -2%;
        width: 100%;
        height: 5%;
        display: flex;
                text-align: center;
                align-items: center;
                justify-content: center;
    }

    h3{
        font-family: 'PuradakGentleGothicR';
    }

    .row{
      display: flex;
      width: 100%;
      margin-top: 60px;
    }

    .row .inputDivBox {
      width: 300px;
      overflow: hide;
      margin-top: 15px;
      margin-bottom: 20px;
    }

    .inputDivBox {
       position: relative;
       width: 300px;
       margin-top: 100px;
     }

     #firstModalSizeControlFile{
        margin-bottom: 10px;
     }

     .modalBtnControlBox{
        margin: 0px auto;
        width: 40%;
        height: 60px;
        display: flex;
     }

     #FirstModalBtn{
        width: 100%;
        text-align: center;
        align-items: center;
        justify-content: center;
     }

     input[type='file'] {
       display: block;
       width: 0;
       height: 0;
       overflow: hidden;
     }

     .form__input--file_wrap {
       display: flex;
       margin-bottom: 20px;
       margin-top: 35px;
       margin-left: 50px;
     }

     .form__label--file {
       width:120px;
       height: 30px;
       line-height:30px;
       background: #999;
       border-radius: 3px;
       color: #fff;
       font-weight: bold;
       display: flex;
       align-items: center;
       justify-content: center;
       cursor: pointer;
     }
     .form__span--file {
       padding: 0 5px 0 10px;
       margin-left: 5px;
       display: block;
       width: 450px;
       min-height: 30px;
       border: 1px solid #e7e7e7;
       border-radius: 3px;
       line-height: 30px;
       color: #999;
       overflow: hidden;
       text-overflow: ellipsis;
       white-space: nowrap;
       box-sizing: border-box;
     }

     .closeBtn{
        margin-right: 5px;
        margin-bottom: 5px;
     }

     .underBox{
        margin-right: 10px;
        margin-bottom: 5px;
     }
     .forUpdateModalBody{
        display: flex;
     }

     .recipeInfoGetForUpdate{
        width: 100%;
     }
     .recipeStandardInfoGetForUpdate {
        width: 45%;
        height: 840px;
        overflow: auto;
        border: 1px solid #999;
     }

     .recipeInfoGetForUpdateBixBox{
         margin-left: 5%;
        border: 1px #999 solid;
        width: 45%;
     }
     .recipeInfoGetForUpdate{
        margin: 0px auto;
     }

     .forUpdateFirstBox{
        border: 1px #999 solid;
        height: 900px;
     }

     .recipeStandardUpdateButtonBox{
        margin-top: 3%;
        margin-left: 60%;
     }
    .recipeStandardUpdateButtonBox button{
          margin-left: 1%;
    }

    .pageWrapperBox{
        width: 40%;
        height: 60px;
        margin-right: 30%;
        margin-left: 27%;
    }

    .haveAddButton{
        width: 10%;
        position: absolute;
        right: 5%;
        bottom: 30%;
    }

    .recipeUpdateButtonBox{
       width: 40%;
       position: absolute;
       right: 31%;
       bottom: 3%;
    }

    .recipeUpdateButtonBox button {
       margin-left: 1%;
    }

    .forUpdateInsertAddInputBox{
        position: absolute;
        right: 5%;
    }


</style>


    <div class = "recipeHeadNameBox" >
        <h3 class "recipeHeadName"> 레시피 목록 </h3>
    </div>
    <div class="container">
        <c:forEach items="${recipeVOList}" var="recipe">
        <div class="item">
            <div class = "chickenPhotoBox  <c:out value='${recipe.recipe_Id}'/>" id = "chickenPhotoBox <c:out value='${recipe.recipe_Id}'/>" value = "<c:out value='${recipe.recipe_Id}'/>"  onclick = "openRecipeUpdateModal(<c:out value='${recipe.recipe_Id}'/>)"><img id="chickenPhoto" src="/resources/upload/chickenPhoto/<c:out value='${recipe.filename}'/>"> </div>
            <div class='recipe_list' id = "recipe_list<c:out value='${recipe.recipe_Id}'/>" display="hidden" value ="<c:out value='${recipe.recipe_Id}' />"></div>
            <div class = "namePhotoBox"><td><c:out value="${recipe.recipe_Name}" /></td></div>
        </div>
        </c:forEach>

    </div>

    <div class ="pageWrapperBox">
        <div class="pagination__wrapper">
            <ul class="pagination">

            </ul>
        </div>
    </div>

    <div class = "haveAddButton">
        <button class="btn btn-primary btn-primary ml-2 mt-2 modalBtn" id="testModal">레시피 등록</button>
    </div>


<form action="/recipe/upload" method="post" id="form1" enctype="multipart/form-data" onSubmit="return false">

<!-- Modal 공간 -->
<div class="modal fade" id="modalArea1" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5>레시피 등록</h5>
            </div>
             <form action="/recipe/upload" method="post" id="form1" enctype="multipart/form-data" onSubmit="return false">
                    <div class="modal-body">
                        <div class="row">

                        <div>
                            <div class = "inputDivBox">
                                  <input class = "inputBox recipe_name firstModalSizeControl" id= "recipeInsertName" type="text" name ="recipeName" required>
                                  <label class = "inputLabelTag">레시피명</label>
                                  <span class = "inputSpanTag"></span>
                            </div>
                             <div class="form__input--file_wrap">
                               <input class="form__input--file" id="upload1" type="file" name="file">
                               <label class="form__label--file" for="upload1">파일선택</label>
                               <span class="form__span--file">선택된 파일이 없습니다.</span>
                             </div>
                        </div>
                </div>
            </div>
            <!-- Modal footer -->
                <div class="footer">
                    <div class="float-right underBox" style="text-align: right;">
                         <div class ="modalBtnControlBox">
                            <button class="btn btn-primary btn-secondary ml-2 mt-2" id="FirstModalBtn" onclick="InsertRecipe();">레시피</button>
                         </div>
                        <button type="button" class="btn btn-primary mr-2 mb-2" id="closeBtn">닫기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal 공간 -->
<div class="modal fade" id="modalArea2" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-xl">
        <div class="modal-content">
            <div class="modal-header">
                <h5>레시피 규격 등록</h5>
            </div>
            <div class="modal-body">
                <div id="inputFields">
                    <div class="row dataInputBox" style = "width: 100%; height: 200pX; margin-left: 0.3%; border: 1px solid #999">
                       <div class = "inputDivBox" id = "receiveParameterName" style ="margin-top: 30px">

                       </div>
                       <div class = "inputDivBox" style ="margin-top: 30px">
                          <input type="text" name="recipeStandardList[0].material_Name" class="inputBox" required>
                          <label class = "inputLabelTag">재료명</label>
                          <span class = "inputSpanTag"></span>
                       </div>
                       <div class = "inputDivBox" style ="margin-top: 30px">
                           <input type="text" name="recipeStandardList[0].recipe_Product_Quantity" class="inputBox" required>
                           <label class = "inputLabelTag">필요수량</label>
                           <span class = "inputSpanTag"></span>
                       </div>
                      <div class = "inputDivBox">
                         <input type="text" name="recipeStandardList[0].quantity_Units" class="inputBox" required>
                         <label class = "inputLabelTag">단위</label>
                         <span class = "inputSpanTag"></span>
                      </div>
                      <div class = "inputDivBox">
                         <input type="text" name="recipeStandardList[0].usePhase" class="inputBox" required>
                         <label class = "inputLabelTag">사용단계</label>
                         <span class = "inputSpanTag"></span>
                      </div>

                    </div>
                </div>
            </div>
            <!-- Modal footer -->
            <div class="footer">
                <div class="float-right" style="text-align: right;">
                    <button type="button" id="addInputField" class="btn btn-primary">추가</button>
                    <button type="button" onClick='javascript: sendData();' class="btn btn-primary">등록</button>
                    <a class="btn btn-primary" data-bs-toggle="modal" href="#modalArea1" role="button" id= "rollbackButton">뒤로</a>
                    <button type="button" class="btn mr-2 mb-2" id="closeBtn2">닫기</button>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="recipeInfoModal" tabindex="-1" role="dialog" aria-labelledby="recipeModalLabel" >
    <div class="modal-dialog modal-dialog-centered modal-xl" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="recipeModalLabel">Recipe Details</h5>
                <div class = "headerBtnBoxForMoving">
                <button type="button" class="close3 btn btn-primary btn-primary ml-2 mt-2" id = "forUpdateInsertAddInputBox" style="text-align: right;">데이터 추가</button>
                <button type="button" class="close3 btn btn-primary btn-primary ml-2 mt-2" data-dismiss="modal" aria-label="Close">닫기</button>
                </div>
            </div>
            <div class="modal-body forUpdateModalBody" id="recipeModalBody">
                <!-- 모달 바디에 데이터를 동적으로 로드할 예정 -->
                <div class = "recipeInfoGetForUpdateBixBox">
                    <div class = "recipeInfoGetForUpdate" id = "recipeInfoGetForUpdate">

                    </div>
                    <div class = "recipeInfoGetForUpdateBtn">

                    </div>
                </div>

                <div class = "recipeStandardInfoGetForUpdate" id = "recipeStandardInfoGetForUpdate">

                </div>
            </div>
        </div>

    </div>
</div>





<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
<script>

    let index = 1;
    let test1 = 1;
     const fileTarget = $('.form__input--file_wrap input');
      fileTarget.on('change', function () {
        var files = $(this)[0].files;
        var fileArr = [];
        for (var i = 0; i < files.length; i++) {
          fileArr.push(files[i].name);
      }

      // 파일명 노출방법1: 배열 값 사이에 공백 추가
      var fileList = fileArr.join(', '); // 배열 값을 쉼표와 공백으로 연결
      $(this).siblings('.form__span--file').text(fileList);
      console.log(fileList);
    });


    $('#recipeInfoModal').on('shown.bs.modal', function () {
        $('#upload2').on('change', function () {
            var files = $(this)[0].files;
            var fileArr = [];
            for (var i = 0; i < files.length; i++) {
                fileArr.push(files[i].name);
            }
            var fileList = fileArr.join(', ');
            $(this).siblings('.form__span--file').text(fileList);
            console.log(fileList);
        });
    });



    $(function(){
        // 모달 오픈 (show)
        $(document).on('click', '.modalBtn', function(){
            $('#modalArea1').modal('show');
        });

        $(document).on('click', '#FirstModalBtn', function(){
            $('#modalArea1').modal('show');
        });

        // 모달 종료 (hide)
        $(document).on('click', '.modalBtn2', function(){
            $('#modalArea1').modal('hide');
        });

        // 모달 종료 (hide)
        $(document).on('click', '#closeBtn', function(){
            $('#modalArea1').modal('hide');
        });

        $(document).on('click', '#closeBtn2', function(){
            $('#modalArea2').modal('hide');
        });

        $(document).on('click', '.close3', function(){
            $('#recipeInfoModal').modal('hide');
        });


        $('#forUpdateInsertAddInputBox').on('click', function() {
            var recipeName = $('#recipeInfoGetForUpdate').find('input[name="recipe_Name"]').val();
            var recipeInputName = $("#receiveParameterName");
            var str = "";
            $('#modalArea2').modal('show');
            $('#recipeInfoModal').modal('hide');

            str += "    <input type='text' name='recipeStandardList[0].recipe_Name' value = '" + recipeName + "' class='inputBox' id = 'autoInputRecipeName1' >";
            str += "    <label class='inputLabelTag' id = 'autoInputRecipeName2'>레시피명</label>";
            str += "    <span class='inputSpanTag' id = 'autoInputRecipeName3'></span>";

            recipeInputName.append(str);
        });


        $("#addInputField").click(function () {
            var insertRecipe = "";
            if($('#recipeInsertName').val() != null && $('#recipeInsertName').val() != ""){
                insertRecipe = $('#recipeInsertName').val();
            } else{
               insertRecipe = $('#recipeInfoGetForUpdate').find('input[name="recipe_Name"]').val();
            }

            var recipeInputName = $("#receiveParameterName");

            console.log("1번", recipeInputName);

            let newRow =
             `<div class="row dataInputBox reactiveTypeContent" style = "width: 100%; height: 200pX; margin-left: 0.3%; border: 1px solid #999">
                   <div class = "inputDivBox" style = "margin-top: 30px;">
                      <input type="text" name="recipeStandardList[\${index}].recipe_Name" value = "\${insertRecipe}" class="inputBox" required>
                      <label class = "inputLabelTag">레시피명</label>
                      <span class = "inputSpanTag"></span>
                   </div>
                  <div class = "inputDivBox" style ="margin-top: 30px">
                     <input type="text" name="recipeStandardList[\${index}].material_Name" class="inputBox" required>
                     <label class = "inputLabelTag">재료명</label>
                     <span class = "inputSpanTag"></span>
                  </div>
                   <div class = "inputDivBox" style ="margin-top: 30px">
                       <input type="text" name="recipeStandardList[\${index}].recipe_Product_Quantity" class="inputBox" required>
                       <label class = "inputLabelTag">필요수량</label>
                       <span class = "inputSpanTag"></span>
                   </div>
                  <div class = "inputDivBox">
                     <input type="text" name="recipeStandardList[\${index}].quantity_Units" class="inputBox" required>
                     <label class = "inputLabelTag">단위</label>
                     <span class = "inputSpanTag"></span>
                  </div>
                  <div class = "inputDivBox">
                     <input type="text" name="recipeStandardList[\${index}].usePhase" class="inputBox" required>
                     <label class = "inputLabelTag">사용단계</label>
                     <span class = "inputSpanTag"></span>
                  </div>
            </div>`;


            console.log(`aaaa: \${index}`);
            console.log(`aaaa: ` + index);


            $("#inputFields").append(newRow);
            index++; // 인덱스 증가
        });

    });

    // 업데이트를 위한 모달 생성
    function openRecipeUpdateModal(recipe_Id){
        console.log('Clicked Recipe ID:', recipe_Id);
        var recipeInfoGetForUpdate = $("#recipeInfoGetForUpdate");
        var recipeStandardInfoGetForUpdate = $('#recipeStandardInfoGetForUpdate');

        var ClickedRecipeId = {recipe_Id : recipe_Id};
        console.log('ClickedRecipeId:', recipe_Id);


        // 레시피Id 정보를 가지고 있는 모달 생성
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/recipe/rest/selectAllRecipeInfoForUpdate/" + recipe_Id,
            data: JSON.stringify(recipe_Id),
            success: function(response) {
                var modalContent = '';
                var recipeInfo = response; // 받아온 데이터
                console.log('ClickedRecipeId:', recipe_Id);
                // moment.js를 사용하여 날짜 형식 변경
                var registration_Date = moment(recipeInfo.registration_Date).format('YYYY-MM-DD');
                var modify_Date = recipeInfo.modify_Date ? moment(recipeInfo.modify_Date).format('YYYY-MM-DD') : '최초등록';

                // 모달 내용을 구성하는 HTML 생성

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + recipeInfo.recipe_Id + '"name ="recipe_Id"  class="inputBox" required>';
                modalContent += '<label class="inputLabelTag">레시피ID</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + recipeInfo.recipe_Name + '" name ="recipe_Name" id = "recipeUpdateName"class="inputBox">';
                modalContent += '<label class="inputLabelTag">레시피명</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + registration_Date+ '" name ="registration_Date" class="inputBox" required>';
                modalContent += '<label class="inputLabelTag">등록일</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + modify_Date + '" name ="recipe_Id" class="inputBox" required>';
                modalContent += '<label class="inputLabelTag">수정일</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text"  value="' + recipeInfo.filename + '" id ="recipeUpdateFileName" class="inputBox" required >';
                modalContent += '<label class="inputLabelTag">파일명</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="form__input--file_wrap">';
                modalContent += '<input class="form__input--file" id="upload2" type="file" name="fileName">';
                modalContent += '<label class="form__label--file" for="upload2">파일선택</label>';
                modalContent += '<span class="form__span--file">선택된 파일이 없습니다.</span>';
                modalContent += '</div>';

                modalContent += '<div class = "recipeUpdateButtonBox">';
                modalContent += '<button type="button" onclick="javascript:recipeUpdateDataSend(' + recipeInfo.recipe_Id + ');" class="btn btn-primary">데이터 변경</button>';
                modalContent += '<button type="button" onclick="javascript:recipeDeleteDataSend(' + recipeInfo.recipe_Id + ');" class="btn btn-primary">데이터 삭제</button>';
                modalContent += '</div>';
                modalContent += '</div>';


               // 모달 내용 업데이트
               $('#recipeInfoGetForUpdate').html(modalContent);
                console.log('ClickedRecipeId:', recipe_Id);
                console.log(recipeInfoGetForUpdate);

                showStandardInfoData(recipeInfo.recipe_Id, 1);
            },
            error: function(error) {
                console.error("레시피정보 Error occurred: ", error);
            }
        });
    }

    function showStandardInfoData(recipe_Id, page){
        var updatePageSize = 1;
        var pagesize = 1;
        var sendStandardData = { page: page, recipe_Id: recipe_Id, pagesize: pagesize};

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/recipe/rest/selectRecipeStandardInfoForUpdate/" + recipe_Id + "/" + pagesize + "/" + page,
            data: JSON.stringify(sendStandardData),
            success: function(response) {
                var modalContent = '';

                // 받아온 데이터를 바로 사용
                // 변수명을 서버에서 정의한 변수명으로 수정
            for (var i = 0; i < response.length; i++) {
                var data = response[i];

                modalContent += '<div class="forUpdateFirstBox ' + data.standard_Id + '">';
                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + data.standard_Id + '" name = "standard_Id" class="inputBox" required>';
                modalContent += '<label class="inputLabelTag">Standard ID</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + data.recipe_Name + '"name = "recipe_Name" id = recipe_Name' + data.standard_Id +' class="inputBox" required>';
                modalContent += '<label class="inputLabelTag">Recipe Name</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + data.material_Name + '" name = "material_Name" id = material_Name' + data.standard_Id +' class="inputBox" required>';
                modalContent += '<label class="inputLabelTag">Material Name</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + data.recipe_Product_Quantity + '"name = "recipe_Product_Quantity"  id = recipe_Product_Quantity' + data.standard_Id +' class="inputBox" required>';
                modalContent += '<label class="inputLabelTag">Recipe Product Quantity</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + data.quantity_Units + '" name = "quantity_Units" id = quantity_Units' + data.standard_Id +' class="inputBox" required>';
                modalContent += '<label class="inputLabelTag">Quantity Units</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';

                modalContent += '<div class="inputDivBox">';
                modalContent += '<input type="text" value="' + data.usePhase + '" name = "usePhase" id = usePhase' + data.standard_Id +' class="inputBox" required>';
                modalContent += '<label class="inputLabelTag">Use Phase</label>';
                modalContent += '<span class="inputSpanTag"></span>';
                modalContent += '</div>';
                modalContent += '<div class = "recipeStandardUpdateButtonBox">';
                modalContent += '<button type="button" onClick="javascript:updateStandardInfo(' + data.standard_Id + ');" class="btn btn-primary">변경</button>';
                modalContent += '<button type="button" onClick="javascript:deleteStandardInfo(' + data.standard_Id + ');" class="btn btn-primary">삭제</button>';
                modalContent += '</div>';
                modalContent += '</div>';
            }

                createPage(page);
                $('#recipeStandardInfoGetForUpdate').html(modalContent);

                addEventListenersToPagenum();

                $('#recipeInfoModal').modal('show');

                },
                error: function(error) {
                    console.error("Error occurred: ", error);
                }
        });
    }




    function createPage(pageNum){
        var pageUL = $(".pagination");

        // 서버에서 총 페이지 수 가져오는 로직 추가

        var maxPage = 30; // 예시로 10 페이지로 가정

        var str2="";
        var prevInt;
        if(pageNum == 1){
            prevInt = 1;
        } else {
            prevInt = pageNum - 1;
        }
        str2 += "<li class='pagelist'><button class='pagebtn prev' onclick='showStandardInfoData("+prevInt+")'>&#10094;</button></li>";
        for(var i = 1; i <= maxPage; i++) {
            if(i == pageNum){
                str2 += "<li class='pagelist'><button class='pagebtn pagenum active' onclick='showStandardInfoData("+i+")'>"+i+"</button></li>";
            } else {
                str2 += "<li class='pagelist'><button class='pagebtn pagenum' onclick='showStandardInfoData("+i+")'>"+i+"</button></li>";
            }
        }
        var nextInt;
        if(pageNum == maxPage){
            nextInt = maxPage;
        } else {
            nextInt = pageNum
        }
    }

    var test = 1;
    function addEventListenersToPagenum() {
        let pagenum = document.querySelectorAll('.pagenum');
        console.log("Test" ,test++);

        pagenum.forEach((target) => target.addEventListener("click", function(){
            pagenum.forEach((e) => e.classList.remove('active'));
            target.classList.add('active');
        }));
    }

    let pagenum = document.querySelectorAll('.pagenum');
    pagenum.forEach((target) => target.addEventListener("click", function(){
        pagenum.forEach((e)=>{
            e.classList.remove('active');
        })
            target.classList.add('active');
        })
    );


    function recipeUpdateDataSend(recipeId){
        var recipeName = $('#recipeUpdateName').val();
        var fileName = $('#recipeUpdateFileName').val();

        var dataToSend = {
            recipe_Id: recipeId,
            recipe_Name: recipeName,
            fileName: fileName
        };

        var fileUpdate = $('#upload2')[0].files[0];


        if(fileUpdate != null && fileUpdate != ""){
             var formData = new FormData();

             formData.append('fileName', fileUpdate);

             $.ajax({
                 type: 'POST',
                 url: '/recipe/rest/uploadFile',
                 data: formData,
                 contentType: false,
                 processData: false,
                 success: function(response) {

                 },
                 error: function(xhr, status, error) {
                     console.error('Error occurred while uploading the file:', error);
                 }
             });

             var formData = new FormData();
             var fileDeleteName = $('#recipeUpdateFileName').val();
             formData.append('fileName', fileDeleteName);
             console.log(fileDeleteName);

             $.ajax({
                 type: 'DELETE',
                 url: '/recipe/rest/recipeFileDelete/' + fileDeleteName,
                 data: formData,
                 contentType: false,
                 processData: false,
                 success: function(response) {

                 },
                 error: function(xhr, status, error) {
                     alert('Failed to delete the file: ' + error);
                 }
             });


             var fileName = $('#upload2').val().split('\\').pop(); // 파일 경로에서 파일 이름만 추출
             console.log(fileName); // 추출한 파일 이름 확인
             var updateFileNameDataToSend = {
                 recipe_Id: recipeId,
                 fileName: fileName
             };
             $.ajax({
                 type: "POST",
                 contentType: "application/json",
                 url: "/recipe/rest/RecipeFilenameUpdate/" + recipeId +"/" + fileName,
                 data: JSON.stringify(updateFileNameDataToSend),
                 success: function(response) {

                 },
                 error: function(error) {
                     console.error("Error occurred: ", error);
                 }
             });
         }
        console.log("래시피",recipeId,recipeName);
        console.log("!!!!!!!!!!!! ",dataToSend);

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/recipe/rest/autoRecipeStandardUpdate/" + recipeId +"/" + recipeName,
            data: JSON.stringify(dataToSend),
            success: function(response) {

                $.ajax({
                   type: "POST",
                   contentType: "application/json",
                   url: "/recipe/rest/recipeUpdate/" + recipeId +"/" + recipeName,
                   data: JSON.stringify(dataToSend),
                   success: function(response) {

                       window.location.href = "/recipe";
                   },
                   error: function(error) {
                       console.error("Error occurred: ", error);
                   }
               });
            },
            error: function(error) {
                console.error("Error occurred: ", error);
            }
        });
    }


    function InsertRecipe() {
        if (!$('#recipeInsertName').val() && $('#recipeInsertName').val()==="") {
            $('#recipeInsertName').focus();
            alert('레시피명을 입력하세요.');
            return false;

        } else {
            // 모달 오픈 (show)
            $(document).on('click', '#FirstModalBtn', function(){
                $('#modalArea2').modal('show');
                $('#modalArea1').modal('hide');
            });

            $('#recipeInsertToggle2').attr("aria-hidden", "false");
            var recipeInputName = $("#receiveParameterName");
            var insertRecipe = $('#recipeInsertName').val();
            var str = "";

            console.log("1번", recipeInputName);
            console.log("버튼클릭");

            str += "    <input type='text' name='recipeStandardList[0].recipe_Name' value = '" + insertRecipe + "' class='inputBox' id = 'autoInputRecipeName1' >";
            str += "    <label class='inputLabelTag' id = 'autoInputRecipeName2'>레시피명</label>";
            str += "    <span class='inputSpanTag' id = 'autoInputRecipeName3'></span>";

            recipeInputName.append(str);

        }
    }

    function sendData() {
        var recipeStandardList = [];

        // 모든 입력 필드를 가져와서 반복문으로 처리
        $(".dataInputBox").each(function(index) {
            var recipe_Name = $(this).find("input[name='recipeStandardList[" + index + "].recipe_Name']").val();
            var material_Name = $(this).find("input[name='recipeStandardList[" + index + "].material_Name']").val();
            var recipe_Product_Quantity = $(this).find("input[name='recipeStandardList[" + index + "].recipe_Product_Quantity']").val();
            var quantity_Units = $(this).find("input[name='recipeStandardList[" + index + "].quantity_Units']").val();
            var usePhase = $(this).find("input[name='recipeStandardList[" + index + "].usePhase']").val();

            console.log("1111111111111111111111111" ,recipe_Name, material_Name,recipe_Product_Quantity,quantity_Units,usePhase );
            // 입력된 값들을 JSON 형식으로 만들어서 recipeStandardList에 추가
            var recipeStandard = {
                "recipe_Name": recipe_Name,
                "material_Name": material_Name,
                "recipe_Product_Quantity": recipe_Product_Quantity,
                "quantity_Units": quantity_Units,
                "usePhase": usePhase
            };
            recipeStandardList.push(recipeStandard);

        });

        // 만들어진 JSON 데이터를 서버로 전송
        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/recipe/rest/recipe-standard",
            data: JSON.stringify(recipeStandardList),
            success: function(response) {

            },
            error: function(error) {
                console.error("Error occurred: ", error);
            }
        });
        const form1 = document.getElementById('form1');
        form1.action = "/recipe/upload";
        form1.submit();
    }

    $('#closeBtn2').on('click', function(e){
        var autoInputRecipeName1 = document.getElementById("autoInputRecipeName1");
        var autoInputRecipeName2 = document.getElementById("autoInputRecipeName2");
        var autoInputRecipeName3 = document.getElementById("autoInputRecipeName3");

        autoInputRecipeName1.remove();
        autoInputRecipeName2.remove();
        autoInputRecipeName3.remove();

        var reactiveTypeContents = document.getElementsByClassName("reactiveTypeContent");
        // 모든 클래스가 적용된 엘리먼트를 제거합니다.
        while (reactiveTypeContents.length > 0) {
            reactiveTypeContents[0].parentNode.removeChild(reactiveTypeContents[0]);
        }

        index = 1;
    })

    $('#rollbackButton').on('click', function(e){
        var autoInputRecipeName1 = document.getElementById("autoInputRecipeName1");
        var autoInputRecipeName2 = document.getElementById("autoInputRecipeName2");
        var autoInputRecipeName3 = document.getElementById("autoInputRecipeName3");

        autoInputRecipeName1.remove()
        autoInputRecipeName2.remove()
        autoInputRecipeName3.remove()

        var reactiveTypeContents = document.getElementsByClassName("reactiveTypeContent");
        // 모든 클래스가 적용된 엘리먼트를 제거합니다.
        while (reactiveTypeContents.length > 0) {
            reactiveTypeContents[0].parentNode.removeChild(reactiveTypeContents[0]);
        }

        index = 1;
    })

    function updateStandardInfo(standardId){
       var recipe_Name = $('#recipe_Name'+standardId).val();
       var material_Name = $('#material_Name'+standardId).val();
       var recipe_Product_Quantity = $('#recipe_Product_Quantity'+standardId).val();
       var quantity_Units = $('#quantity_Units'+standardId).val();
       var usePhase = $('#usePhase'+standardId).val();

       var recipeStandard = {
           "standard_Id" : standardId,
           "recipe_Name": recipe_Name,
           "material_Name": material_Name,
           "recipe_Product_Quantity": recipe_Product_Quantity,
           "quantity_Units": quantity_Units,
           "usePhase": usePhase
       };
       console.log(recipeStandard);

        $.ajax({
            type: "POST",
            contentType: "application/json",
            url: "/recipe/rest/updateRecipeStandardUpdate",
            data: JSON.stringify(recipeStandard),
            success: function(response) {
                alert("성공");
            },
            error: function(error) {
                console.error("Error occurred: ", error);
            }
        });
    }

    function deleteStandardInfo(standardId){
       var recipeStandard = {
           "standard_Id" : standardId
       };
       $.ajax({
           type: "DELETE",
           contentType: "application/json",
           url: "/recipe/rest/deleteRecipeStandard/" + standardId,
           data: JSON.stringify(recipeStandard),
           success: function(response) {
               alert("성공");
           },
           error: function(error) {
               console.error("Error occurred: ", error);
           }
       });
       $('.forUpdateFirstBox ' + standardId).remove();       // 화면에 삭제처리
    }


    function recipeDeleteDataSend(recipeId){
        var recipeName = $('#recipeUpdateName').val();
        var fileName = $('#recipeUpdateFileName').val();

        var formData = new FormData();
        var fileDeleteName = $('#recipeUpdateFileName').val();
        formData.append('fileName', fileDeleteName);
        console.log(fileDeleteName);

        var recipe_Id = {recipe_Id : recipeId};

        $.ajax({
            type: 'DELETE',
            url: '/recipe/rest/recipeFileDelete/' + fileDeleteName,
            data: formData,
            contentType: false,
            processData: false,
            success: function(response) {

            },
            error: function(xhr, status, error) {
                alert('Failed to delete the file: ' + error);
            }
        });

        $.ajax({
            type: "DELETE",
            contentType: "application/json",
            url: "/recipe/rest/deleteRecipeAndStandard/" + recipeId,
            data: JSON.stringify(recipe_Id),
            success: function(response) {
                window.location.href = "/recipe";
            },
            error: function(error) {
                console.error("Error occurred: ", error);
            }
        });
    }

</script>

<%@ include file="../includes/footer.jsp" %>