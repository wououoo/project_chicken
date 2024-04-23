<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../includes/header.jsp" %>

<h2 style="color: red;padding: 20px">게시물 상세 정보</h2>
<table class="containerTable">
    <table class="rwd-table" style="height: 95%;width: 95%">
        <thead>
        <tr>
            <th>아이디</th>
            <th>상태</th>
            <th>내용</th>
            <th>작성자</th>
            <th>액션</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td>${board.id}</td>
            <td>${board.title}</td>
            <td>${board.content}</td>
            <td>${board.author}</td>
            <td>
                <a href="/board/edit/${board.id}" class="btn btn-danger">수정</a>
                <a href="/board" class="btn btn-danger">목록</a>
            </td>
        </tr>
        </tbody>
    </table>
</table>

<script>
document.title="게시물 상세조회";
</script>
<%@ include file="../includes/footer.jsp" %>
