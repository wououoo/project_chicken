<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/header.jsp" %>

<style>
    /* 기존 스타일 유지 */
    .container-fluid{
        padding-left: 1.5rem;
        padding-right: 1.5rem;
        width: 100%;
        margin-right: auto;
        margin-left: auto;
        border-collapse: collapse; /* 외부 테이블 선 삭제 */
    }
    /* 수정된 부분 */
    body {
        font-family: 'Nanum Gothic', sans-serif;
    }
    .h3, .btn {
        font-family: 'Nanum Gothic', sans-serif;
    }
    .containerTable table {
        border-collapse: collapse; /* 내부 테이블 선 삭제 */
        width: 100%;
    }
    .containerTable th, .containerTable td {
        border: 1px solid #dddddd; /* 내부 테이블 선 스타일 */
        padding: 8px;
        text-align: left;
    }
    .containerTable th {
        background-color: #f2f2f2;
    }

    .rwd-table tr:first-child{
        background: #fff;
        color: #000;
    }
</style>
<div id="content-wrapper" class="d-flex flex-column" style="width:100%;height: 100%;background: #2c3034;color: #f0f0f0">
    <!-- Main Content -->
    <div id="content">
        <!-- Topbar -->
        <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow" style="justify-content: flex-end">
            <!-- Topbar Navbar -->
            <ul class="navbar-nav ml-auto">
                <div class="topbar-divider d-none d-sm-block">
                    <!-- Nav Item - User Information -->
                    <li class="nav-item dropdown no-arrow">
                        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                           data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">
                                                        <%-- <c:out value="${id}"/> --%>
                                                        <%-- <sec:authentication property="principal.memberVO.korName" /> --%>님~ 반가워요
                                                    </span>
                            <!--
                            <img class="img-profile rounded-circle" src="img/undraw_profile.svg">
                            -->
                        </a>
                        <!-- Dropdown - User Information -->
                        <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                             aria-labelledby="userDropdown">
                            <a class="dropdown-item" href="/member">
                                <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                Profile
                            </a>
                            <!--
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-cogs fa-sm fa-fw mr-2 text-gray-400"></i>
                                Settings
                            </a>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-list fa-sm fa-fw mr-2 text-gray-400"></i>
                                Activity Log
                            </a>
                            -->
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="" data-toggle="modal" data-target="#logoutModal">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                Logout
                            </a>
                        </div>
                    </li>
                </div>
            </ul>
        </nav>
        <!-- End of Topbar -->

        <div class="container-fluid">

            <h2 class="h3 mb-2 text-gray-800">
                게시판 목록
            </h2>
            <div>
                <a href="/board/new" class="btn btn-danger"> 작성하기 </a>
            </div>
            <!-- DataTales Example -->
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div id="dataTable_wrapper" class="dataTables_wrapper" dt-bootstrap4 no-footer>
                        <div class="row">
                            <div class="col-sm-12 col-md-6">
                                <div class="dataTables_length" id="dataTable_lenght">
                                    <div class="dataTable_wrapper">
                                        <div class="col-sm-12 col-md-6">
                                            <div class = row>
                                                <div class="dataTables_length" id="dataTable_length">
                                                    <select name="dataTable_length" aria-controls="dataTable" class="custom-select custom-select-sm form-control form-control-sm">
                                                        <option value="10">10</option>
                                                        <option value="25">25</option>
                                                        <option value="50">50</option>
                                                        <option value="100">100</option>
                                                    </select>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="containerTable" style="height: auto">
                        <table class="rwd-table">
                            <%--                            <table class="table table-bordered" id="dataTable" >--%>
                            <tbody>
                            <tr style="color: #1a1e21">
                                <th>#번호</th>
                                <th>상태</th>
                                <th>내용</th>
                                <th>작성자</th>
                                <th>액션</th>
                            </tr>
                            <c:forEach items="${boards}" var="board">
                                <tr>   <%-- 2024-04-20 부트 스트랩 효과 일부 제한--%>
                                    <td>${board.id}</td>
                                    <td>${board.title}</td>
                                    <td>${board.content}<a href="/board/${board.id}" style="color: red">상세보기</a></td>
                                    <td>${board.author}</td>
                                    <td>
                                        <a href="/board/edit/${board.id}" class="btn btn-danger">수정</a>
                                        <form action="/board/delete/${board.id}" method="post" style="display:inline;">
                                            <button type="submit" class="btn btn-danger">삭제</button>
                                        </form>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                            <%--</table>--%>
                        </table>
                        <div style="display: flex; align-items: center; justify-content: center;">
                            <div style="margin-right: 10px;">검색</div>
                            <div>
                                <div>
                                    <form id='searchForm' action='/board/list' method='get'>
                                        <select name='type'>
                                            <option value="">--</option>
                                            <option value="T" <c:out value="${criteria.type == 'T' ? 'selected' : ''}" />>제목</option>
                                            <option value="C" <c:if test="${criteria.type == 'C'}">selected</c:if>>내용</option>
                                            <option value="W">작성자</option>
                                            <option value="TC">제목 or 내용</option>
                                            <option value="TW">제목 or 작성자</option>
                                            <option value="WC">작성자 or 내용</option>
                                            <option value="TWC">제목 or 내용 or 작성자</option>
                                        </select>
                                        <input type='text' name='keyword' value='<c:out value="" />' />
                                        <%-- <input type='hidden' name='pageNum' />
                                        <input type='hidden' name='amount' /> --%>
                                        <button class='btn btn-danger'>Search</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>               <!-- container-fluid end -->
        </div>                   <!-- container end -->
    </div>                       <!-- content-wrapper end -->
</div>
<script>
    document.title="게시물 목록";
</script>
<%@ include file="../includes/footer.jsp" %>