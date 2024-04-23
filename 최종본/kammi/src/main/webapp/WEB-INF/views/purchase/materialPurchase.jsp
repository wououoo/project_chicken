
<!-- 사용방법 -->
<!-- 1. 헤더 밑에는 반드시 풋터가 있어야합니다. -->
<%@ include file="../includes/header.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="/resources/js/purchase/purchase.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/purchase.css" rel="stylesheet">
<style>
    .materialDiv{
        margin-top: 5px;
    }
</style>

        <div class="container-fluid px-4">
            <h1 class="mt-4">원자재 구매 현황</h1>
            <div class="card mb-4">
            </div>
            <div class="card mb-4">
                <div class="containerTable">
                    <table class="rwd-table">

                        <tbody>
                            <tr>
                                <th>구매번호</th>
                                <th>구매신청날짜</th>
                                <th>제목</th>
                                <th>비용</th>
                                <th>현황</th>
                            </tr>
                            <c:forEach items="${purchaseList}" var="purchase">
                                <tr class="clickable-row">
                                    <td>${purchase.purchaseList_id}</td>
                                    <td>${purchase.purchaseList_date}</td>
                                    <td>${purchase.purchaseList_subject}</td>
                                    <td>비용입니다</td>
                                    <td>현황입니다.</td>
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
                    <input class="buttons" type="button" value="원자재 구매신청">
                </div>
            </div>
        </div>
        <%--모달창--%>
        <div class="modal fade" id="modalArea" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>구매 정보</h5>
                        <div>
                        <input id="deleteBtn" type="button" value="삭제">
                        <input type="button" value="수정">
                    </div>
                    </div>
             <!-- Modal body -->
                    <div class="modal-body">
                        <div class="row">
                            제목:<input id="subject" type="text" value="" readonly>
                            내용:<textarea id="content" name="opinion" cols="80%" rows="5" readonly ></textarea>
                            <div class="materialModal">

                            </div>
                            <div class="contentModal">

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
                            <button type="button" class="btn mr-2 mb-2" id="">완료</button>
                            <button type="button" class="btn mr-2 mb-2" id="closeBtn">닫기</button>
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
                            <h5>원자재 구매신청</h5>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="row">
                                <div class = "inputDivBox">
                                    <input class = "inputBox subject" type="text" required>
                                    <label class = "inputLabelTag">제목</label>
                                    <span class = "inputSpanTag"></span>
                                </div><br>
                                <div class = "textBox">
                                    <label>내용 :</label><br>
                                    <textarea class="content" name="opinion" cols="80%" rows="5"></textarea><br>
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
                                <button type="button" class="btn mr-2 mb-2" id="nextBtn">다음</button>
                                <button type="button" class="btn mr-2 mb-2" id="newCloseBtn">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <%--모달창--%>
            <div class="modal fade" id="modalArea3" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-lg">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5>원자재 구매신청</h5>
                            <button type="button" class="btn mr-2 mb-2" id="clearBtn">등록</button>
                        </div>
                        <!-- Modal body -->
                        <div class="modal-body">
                            <div class="row">
                                <div id="selectbox" class = "selectDivBox">
                                    <label>분류 :</label>
                                    <select name="select-profession" class="select-profession">
                                        <option value="">==선택하세요==</option>
                                        <option value="육류">육류</option>
                                        <option value="소모성 식품">소모성 식품</option>
                                        <option value="기름">기름</option>
                                        <option value="야채">야채</option>
                                    </select>
                                    <label>업체 :</label>
                                    <select name="select-supplier" class="select-supplier">
                                        <option value="">==선택하세요==</option>
                                    </select>
                                    <label>원자재 :</label>
                                    <select name="select-supplier" class="select-material">
                                        <option value="">==선택하세요==</option>
                                    </select>
                                    <input class = "inputBox eaBox" type="text" required>
                                    <label class = "inputLabelTag">수량</label>
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
                                <button type="button" class="btn mr-2 mb-2" id="beforeBtn">이전</button>
                                <button type="button" class="btn mr-2 mb-2" id="addBtn">추가</button>
                                <button type="button" class="btn mr-2 mb-2" id="newCloseBtn">닫기</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
<%@ include file="../includes/footer.jsp" %>
<script>
    $(document).ready(function() {
        var purchaseId;
        createPagination(${count}, 1);
        $(".clickable-row").click(function() {
            purchaseId = $(this).find("td:first").text();
            var purchaseDate = $(this).find("td:nth-child(2)").text();
            var purchaseSubject = $(this).find("td:nth-child(3)").text();
            var purchaseMaterial = $(this).find("td:nth-child(4)").text();
            var contentModal = $('.contentModal');
            var materialModal = $('.materialModal');
            var num = 0;

            $("#modalArea").modal('show');
            $("#modalArea #subject").val(purchaseSubject);
            materialPurchaseRead(purchaseId
                ,function(list){
                    materialModal.empty();
                    list.forEach(function(item){
                        
                        var newDivElement = $("<div>").attr("class", "materialDiv");
                        var inputElement = $("<input>").attr("type", "text").attr("class", "materialInput").attr("readonly", "readonly");
                        var inputEaElement = $("<input>").attr("type", "text").attr("class", "materialEaInput").attr("readonly", "readonly");
                        var EaElement = $("<input>").attr("type", "text").attr("class", "EaInput").attr("placeholder", "납품받을수량");
                        var btnElement = $("<input>").attr("type", "button").attr("class", "btnInput").attr("value", "납품");
                        materialModal.append(newDivElement);
                        $('.materialDiv:eq('+num+')').append(inputElement);
                        $('.materialDiv:eq('+num+')').append(inputEaElement);
                        $('.materialDiv:eq('+num+')').append(EaElement);
                        $('.materialDiv:eq('+num+')').append(btnElement);
                        $(".materialInput:eq("+num+")").val(item.material_id);
                        $(".materialEaInput:eq("+num+")").val(item.purchase_amount);
                        num++;
                    });
                }
            );
        });

        $(document).on('click', '#closeBtn', function(){
            $('#modalArea').modal('hide');
        });

        $(document).on('click', '#deleteBtn', function(){
            purchaseListDelete(purchaseId,
                function(result){
                    alert('삭제되었습니다.');
                }
            );
        });
        $(document).on('click', '#newCloseBtn', function(){
            $('#modalArea2').modal('hide');
            $('#modalArea3').modal('hide');
            $("#modalArea3").find(".modal-body").empty();
            $("#addBtn").click();
        });
        $(".buttons").click(function() {
            $("#modalArea2").modal('show');
        });
        $(document).on('click', '#nextBtn', function(){
            $('#modalArea2').modal('hide');
            $('#modalArea3').modal('show');
        });
        $(document).on('click', '#beforeBtn', function(){
            $('#modalArea2').modal('show');
            $('#modalArea3').modal('hide');
        });
        $(document).on('click', '#clearBtn', function(){
            var subject = $('.subject').val();
            var content = $('.content').val();
            var selectList = [];
            $('.selectDivBox').each(function(){
                var eaBox = $(this).find('.eaBox').val();
                var selectMaterial = $(this).find('.select-material').val();
                var selectSupplier = $(this).find('.select-supplier').val();
                console.log('eaBox:'+ eaBox);
                console.log('selectMaterial:'+ selectMaterial);
                console.log('selectSupplier:'+ selectSupplier);

                var item = {purchase_amount: eaBox,
                            material_id: selectMaterial,
                            supplier_id: selectSupplier
                };
                console.log(item);
                selectList.push(item);
            });

            purchaseListInsert(
                {purchaseList_subject: subject, purchaseList_content: content},
                function(){
                    materialPurchaseInsert(
                        selectList,
                        function(){
                            alert('성공적으로 작성하였습니다.');
                            location.reload();
                        }
                    );
                });
        });

        $(document).on('change', '.select-profession', function(){
            const part = $(this).val();
            const partname = $(this).siblings('.select-supplier');
            const materialname = $(this).siblings('.select-material');
            if (part !== "") {
                supplierRead(part,
                    function(list) {
                        partname.empty(); // 기존 옵션 제거
                        partname.append($("<option>").attr('value', '').text('==선택하세요==')); // 기본 옵션 추가
                        list.forEach(function(item) {
                            partname.append($("<option>").attr('value', item.supplier_id).text(item.supplier_name)); // 새로운 옵션 추가
                        });
                    },
                    function(error) {
                        partname.empty(); // 기존 옵션 제거
                        partname.append($("<option>").attr('value', '').text('==선택하세요==')); // 기본 옵션 추가
                        console.error("Error:", error);
                    }
                );

                materialsRead(part,
                    function(list) {
                        materialname.empty(); // 기존 옵션 제거
                        materialname.append($("<option>").attr('value', '').text('==선택하세요==')); // 기본 옵션 추가
                        list.forEach(function(item) {
                            materialname.append($("<option>").attr('value', item.material_id).text(item.material_name)); // 새로운 옵션 추가
                        });
                    },
                    function(error) {
                        materialname.empty(); // 기존 옵션 제거
                        materialname.append($("<option>").attr('value', '').text('==선택하세요==')); // 기본 옵션 추가
                        console.error("Error:", error);
                    }
                );
            }
        });
    });

    $(document).on('click', '#addBtn', function() {
        // 새로운 원자재 구매 신청 폼 생성
        var newForm = `
            <div id="selectbox" class="selectDivBox">
                <label>분류 :</label>
                <select name="select-profession" class="select-profession">
                    <option value="">==선택하세요==</option>
                    <option value="육류">육류</option>
                    <option value="소모성 식품">소모성 식품</option>
                    <option value="기름">기름</option>
                </select>
                <label>업체 :</label>
                <select name="select-supplier" class="select-supplier">
                    <option value="">==선택하세요==</option>
                </select>
                <label>원자재 :</label>
                <select name="select-material" class="select-material">
                    <option value="">==선택하세요==</option>
                </select>
                <input class="inputBox eaBox" type="text" required>
                <label class="inputLabelTag">수량</label>
                <span class="inputSpanTag"></span>
            </div>
        `;

        // 새로운 원자재 구매 신청 폼을 모달 바디에 추가
        $("#modalArea3").find(".modal-body").append(newForm);
    });

</script>
