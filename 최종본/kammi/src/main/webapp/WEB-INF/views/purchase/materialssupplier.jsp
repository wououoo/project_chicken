<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<!-- 사용방법 -->

        <!-- 1. 헤더 밑에는 반드시 풋터가 있어야합니다. -->
<%@ include file="../includes/header.jsp" %>
        <div class="container-fluid px-4">
            <h1 class="mt-4">원자재 공급 업체</h1>
            <div class="card mb-4">
            </div>
            <div class="card mb-4">
                <div class="containerTable">
                    <table class="rwd-table">

                        <tbody>
                            <tr>
                                <th>번호</th>
                                <th>업체명</th>
                                <th>주소</th>
                                <th>취급물품</th>
                                <th>전화번호</th>
                            </tr>

                            <tr class="clickable-row">
                                <td>1</td>
                                <td>순천상회</td>
                                <td>경기 수원시 권선구 세권로 243 채소2동 순천상회</td>
                                <td>야채</td>
                                <td>031-225-5771</td>
                            </tr>
                            <tr class="clickable-row">
                                <td>2</td>
                                <td><a href="#" onclick="">부엉이식자재마트</a></td>
                                <td>경기 수원시 권선구 세권로 243 농수산물도매시장 관리동 1층</td>
                                <td>야채</td>
                                <td>0507-1371-7781</td>
                            </tr>
                            <c:forEach items="${materList}" var="mater">
                                <tr class="clickable-row">
                                    <td>${mater.supplier_id}</td>
                                    <td>${mater.supplier_name}</td>
                                    <td>${mater.supplier_location}</td>
                                    <td>${mater.supplier_sell_material}</td>
                                    <td>${mater.supplier_number}</td>
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
                    <input class="buttons" type="button" value="업체 등록">
                </div>
            </div>
        </div>
        <%--모달창--%>
        <div class="modal fade" id="modalArea" tabindex="-1" data-bs-backdrop = "static" aria-labelledby="modalArea" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-xl">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5>업체 정보</h5>
                    </div>
             <!-- Modal body -->
                    <div class="modal-body">
                        <div class="row">
                            <h5>업체명 :</h5>
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
                            <button type="button" class="btn mr-2 mb-2" id="closeBtn">닫기</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
<%@ include file="../includes/footer.jsp" %>
<script>
    $(document).ready(function() {
      $(".clickable-row").click(function() {
        var ssupplierId = $(this).find("td:first").text();
        var ssupplierName = $(this).find("td:nth-child(2)").text();
        var ssupplierLocation = $(this).find("td:nth-child(3)").text();
        var ssupplierMaterial = $(this).find("td:nth-child(4)").text();
        var ssupplierNumber = $(this).find("td:nth-child(5)").text();
        $("#modalArea").modal('show');
        $("#modalArea .modal-header h5").text("업체명:"+ssupplierName);
      });

      $(document).on('click', '#closeBtn', function(){
          $('#modalArea').modal('hide');
      });
    });


</script>
