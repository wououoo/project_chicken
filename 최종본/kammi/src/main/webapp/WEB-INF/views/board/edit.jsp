<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@ include file="../includes/header.jsp" %>
<style>
/* 기존 스타일 유지 */
select.inputBox{
    display: inline-block;
    width: 300px;
    padding-right: 10px;
    background-color: transparent;
    position: relative;
    cursor: pointer;
    word-break:keep-all;
    z-index:100;
}

select.inputBox::before{
    position: absolute;
    content: "\2660";
    font-family: 'FontAwesome';
    font-size: 20px;
    color: #838e95;
    right: 10px;
    top: calc(50% - 0.5em);
}

select.inputBox::before {
    transform: rotateX(-180deg);
}

select__placeholder {
    display: block;
    font-family: 'Quicksand';
    font-size: 20px;
    color: #838e95;
    padding: 0.2em 0.5em;
    text-align: left;
    pointer-events: none;
    user-select: none;
    visibility: visible;
}

select.active .sel__placeholder {
    visibility: hidden;
}

select__placeholder::before {
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    padding: 0.2em 0.5em;
    content: attr(data-placeholder);
    visibility: hidden;
}
main {
    width: 100%;
    height: 100%;
}
</style>

<h2 class="h3 mb-2 text-gray-800" STYLE="padding: 20px;color: red"> 게시글 수정</h2>
<form class="constant-values-container" action="/board/update" method="post" > <!-- form action 변경 -->
    <div class="containerTable">
        <table class="rwd-table" style="width: 98%">
            <tbody>
            <tr>
                <th>#번호</th>
                <th>상태</th>
                <th>작성자</th>
                <th>내용</th>
            </tr>
            <tr>
                <td>
                    <input type="text" class="inputBox" value="${board.id}" name="id" readonly>
                </td>
                <td>
                    <!-- input에서 select로 변경 -->
                    <select class="inputBox" name="title">
                        <c:choose>

                            <c:when test="${board.title eq '진행'}">
                                <option value="ready">요청</option>
                                <option value="run" selected>진행</option>
                                <option value="complete">완료</option>
                                <option value="notification">공지</option>
                            </c:when>
                            <c:when test="${board.title eq '완료'}">
                                <option value="ready">요청</option>
                                <option value="run">진행</option>
                                <option value="complete" selected>완료</option>
                                <option value="notification">공지</option>
                            </c:when>
                            <c:when test="${board.title eq '공지'}">
                                <option value="ready">요청</option>
                                <option value="run">진행</option>
                                <option value="complete">완료</option>
                                <option value="notification" selected>공지</option>
                            </c:when>
                            <c:otherwise>
                                <option value="run" elected>진행</option>
                                <option value="complete">완료</option>
                                <option value="notification">공지</option>
                            </c:otherwise>
                        </c:choose>
                    </select>
                </td>
                <td>
                    <input type="text" class="inputBox" placeholder="${board.author}" name="author">
                </td>
                <td>
                    <!-- textarea로 변경 -->
                    <textarea rows="5" class="inputBox" id="content"  name="content" placeholder="내용">${board.content}</textarea>
                </td>
            </tr>
            </tbody>
        </table>
        <br>
        <button type="submit" class="btn btn-danger">완료</button>
        <a href="/board" class="btn btn-danger">취소</a>
    </div>
</form>

<script>
document.title="게시글 수정";
</script>
<%@ include file="../includes/footer.jsp" %>

