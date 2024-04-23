<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%@ include file="../includes/header.jsp" %>
<style>
    /* 기존 스타일 유지 */
    main {
        width: 100%;
        height: 100%;
    }
</style>
<div class="col-lg-7" style="width:100%;height: 100%;background: #2c3034;color: #f0f0f0">
    <div class="p-5">
        <div class="text-center">
            <h1 class="h4 text-gray-900 mb-4" style="color: red"> 게시판 등록 </h1>
            <form action="/board/new" method="post">
                <div class="form-group" style="padding: 1%;text-align: left;" >
<%--                    <input type="text" class="form-control" id="title" name="title" placeholder="상태">--%>
                    <select class="inputBox" name="title" >
                        <c:choose>
                            <c:when test="${board.title eq '요청'}">
                                <option value="ready" selected>요청</option>

                                <option value="notification">공지</option>
                            </c:when>

                            <c:when test="${board.title eq '공지'}">
                                <option value="ready">요청</option>

                                <option value="notification" selected >공지</option>
                            </c:when>
                            <c:otherwise>
                                <option value="ready" selected>요청</option>

                                <option value="notification">공지</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </div>
                <div class="form-group" style="padding: 1%">
                    <textarea rows="5" class="form-control" id="content"  name="content" placeholder="내용"></textarea>
                </div>
                <div class="form-group" style="padding: 1%">
                    <input type="text" class="form-control" id="author"  name="author" placeholder="작성자">
                </div>
                <div class="form-group" style="padding: 1%">
                    <button type="submit" class="btn btn-danger">등록</button>
                    <a href="/board" class="btn btn-danger">취소</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script>
    document.title="게시물 등록";
</script>
<%@ include file="../includes/footer.jsp" %>
