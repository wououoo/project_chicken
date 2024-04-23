<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/js/purchase/purchase.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- 사용방법 -->
        <!-- 1. 헤더 밑에는 반드시 풋터가 있어야합니다. -->
<%@ include file="../includes/header.jsp" %>
        <div class="container-fluid px-4">
            <h1 class="mt-4">원자재 재고 현황</h1>
            <div class="card mb-4">
            </div>
            <div class="card mb-4">
                <div class="containerTable">
                    <table class="rwd-table">

                        <tbody>
                            <tr>
                                <th>번호</th>
                                <th>원자재명</th>
                                <th>수량</th>
                                <th>단위</th>
                                <th>가격</th>
                                <th>분류</th>
                            </tr>
                            <c:forEach items="${materList}" var="mater">
                                <tr class="clickable-row">
                                    <td>${mater.material_id}</td>
                                    <td>${mater.material_name}</td>
                                    <td>${mater.material_quantity}</td>
                                    <td>${mater.material_units}</td>
                                    <td>${mater.material_price}</td>
                                    <td>${mater.material_category}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    <div class="pagination__wrapper">
                        <ul class="pagination">
                            <li class="pagelist"><button class="pagebtn prev">&#10094;</button></li><!--이전버튼-->

                            <li class="pagelist">
                                <button class="pagebtn pagenum active">1</button><!--현재 위치-->
                            </li>
                            <li class="pagelist">
                                <button class="pagebtn pagenum ">2</button>
                            </li>
                            <li class="pagelist">
                                <button class="pagebtn pagenum">3</button>
                            </li>

                            <li class="pagelist"><button class="pagebtn next" title="next page">&#10095;</button></li><!--다음버튼-->
                        </ul>
                    </div>
                </div>


                <div class="card-buttonBox">
                    <input class="buttons btn btn-secondary" type="button" value="원자재 등록">
                </div>
            </div>
        </div>
        <%--모달창--%>
        <div class="modal fade" id="modalArea" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>원자재 정보</h5>
                        <button type="deleteButton" class="btn-danger btn mr-2 mb-2" id="deleteBtn">삭제</button>
                    </div>
             <!-- Modal body -->
                    <div class="modal-body">
                        <div class="row">
                            <div class="story">
                                <h5 id="name"></h5>
                                <h5 id="category"></h5>
                                <h5 id="price"></h5>
                                <h5 id="units"></h5>
                            </div>
                        </div>
                    </div>
                    <!-- Modal footer -->
                    <div class="footer">
                        <div class="float-right" style="text-align: right;">
                            <!-- 종료 버튼 -->
                            <!--
                                btn : [bootstrap] 부트 스트랩 버튼 사용
                                mr-2 : [bootstrap] margin right를 2만큼
                                bm-2 : [bootstrap] margin bottom을 2만큼
                            -->
                            <button type="button" class="btn-dark btn mr-2 mb-2" id="closeBtn">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--모달창--%>
            <div class="modal fade" id="modalArea2" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5>원자재 등록</h5>
                            <button type="button" class="btn mr-2 mb-2" id="clearBtn">등록</button>
                        </div>
                <!-- Modal body -->
                        <div class="modal-body">
                            <div class="row">
                                <div id="selectbox">
                                    <select name="select-profession" id="select-category">
                                        <option value="">==대분류==</option>
                                        <option value="육류">육류</option>
                                        <option value="소모성식품">소모성식품</option>
                                        <option value="기름">기름</option>
                                    </select>
                                    <select name="select-profession" id="select-profession">
                                        <option value="">==소분류==</option>
                                    </select>
                                </div>
                                <div class = "inputDivBox">
                                    <input class = "inputBox" type="text" required>
                                    <label class = "inputLabelTag">원자재명</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                    <input class = "inputBox" type="text" required>
                                    <label class = "inputLabelTag">단위</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                                <div class = "inputDivBox">
                                    <input class = "inputBox" type="text" required>
                                    <label class = "inputLabelTag">용량</label>
                                    <span class = "inputSpanTag"></span>
                                </div>
                            </div>
                        </div>
                        <!-- Modal footer -->
                        <div class="footer">
                            <div class="float-right" style="text-align: right;">
                                <!-- 종료 버튼 -->
                                <!--
                                    btn : [bootstrap] 부트 스트랩 버튼 사용
                                    mr-2 : [bootstrap] margin right를 2만큼
                                    bm-2 : [bootstrap] margin bottom을 2만큼
                                -->
                                <button type="button" class="btn btn-dark mr-2 mb-2" id="newCloseBtn">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<%@ include file="../includes/footer.jsp" %>
<script>
    $(document).ready(function() {

        createPagination(${count}, 1);

      $(document).on("click", ".clickable-row", function() {
        console.log('모달창 등장');
        var materialId = $(this).find("td:first").text();

        materialRead(materialId,
            function(item){
                var materialName = item.material_name;
                var materialQuantity = item.material_quantity;
                var materialUnit = item.material_units;
                var materialPrice = item.material_price;
                var materialCategory = item.material_category;
                var stroy = $("#modalArea .story");

                $("#modalArea").modal('show');
                $("#modalArea .modal-body #name").text("원자재명 : "+materialName);
                $("#modalArea .modal-body #category").text("분류 : "+materialCategory);
                $("#modalArea .modal-body #price").text("단가 : "+materialPrice);
                $("#modalArea .modal-body #units").text("수량 : "+materialUnit);
            }
        );
      });

      $(document).on('click', '#closeBtn', function(){
          $('#modalArea').modal('hide');
      });

      $(document).on('click', '#newCloseBtn', function(){
            $('#select-profession').empty();
            $('#select-profession').append($("<option>").attr('value', '').text('==소분류=='));
            $('#select-category').val('');
            $('.inputBox').val('');
            $('#modalArea2').modal('hide');
        });
      $(".buttons").click(function() {
        $("#modalArea2").modal('show');
        // $('#modalArea2 #select-category').empty();
        // $('#modalArea2 #select-category').append($("<option>").attr('value', '').text('==대분류=='));
        // categoryRead();
      });

      $(document).on('click', '#clearBtn', function(){
        var materialName = $('#modalArea2 .inputBox:eq(0)').val();
        var materialUnits = $('#modalArea2 .inputBox:eq(1)').val();
        var materialAmount = $('#modalArea2 .inputBox:eq(2)').val();
        var materialCategory = $('#modalArea2 #select-category').val();
        var materialDivision = $('#modalArea2 #select-profession').val();
        if(materialName != "" && materialUnits != "" && materialCategory != "" && materialDivision != ""){
            materialInsert(
                {material_name: materialName, material_units: materialUnits, material_division: materialDivision,material_category: materialCategory, amount:materialAmount},
                function(result){
                    alert('등록 되었습니다.');
                    location.reload();
                }
            );
        } else {
            alert('누락된 정보가 있습니다.');
        }
      });

      $(document).on('click', '#deleteBtn', function(){
        console.log(materialId);
        materialDelete(
            materialId,
            function(result){
                alert('삭제 되었습니다..');
                location.reload();
            }
        );
      });
    });

    $(document).on('change', '#select-category', function(){
        console.log('확인중');
        var part = $(this).val();
        var partname = $('#select-profession');
        if (part !== "") {
            categoryRead(part,
                function(list) {
                    partname.empty(); // 기존 옵션 제거
                    partname.append($("<option>").attr('value', '').text('==소분류==')); // 기본 옵션 추가
                    list.forEach(function(item) {
                        partname.append($("<option>").attr('value', item.materialcategory_name).text(item.materialcategory_name)); // 새로운 옵션 추가
                    });
                },
                function(error) {
                    partname.empty(); // 기존 옵션 제거
                    partname.append($("<option>").attr('value', '').text('==소분류==')); // 기본 옵션 추가
                    console.error("Error:", error);
                }
            );
        }
    });

</script>
