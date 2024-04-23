<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- 사용방법 -->

<!-- 1. 헤더 밑에는 반드시 풋터가 있어야합니다. -->
<%@ include file="../includes/header.jsp" %>


<!-- 2. CSS와 자바스크립트는 헤더 밑에 추가해주면 적용 됩니다. -->
<link rel="stylesheet" href="/resources/css/login/mypage.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script src="/resources/js/login/email.js" defer></script>



<!-- 3. 중간 내용은 헤더와 풋터 사이에 있어야합니다. -->
<sec:authorize access="isAuthenticated()">
    <sec:authentication property="principal.memberVO.mno" var="mno" />
    <sec:authentication property="principal.memberVO.username" var="id" />
    <sec:authentication property="principal.memberVO.korName" var="koname" />
    <sec:authentication property="principal.memberVO.email" var="email" />
    <sec:authentication property="principal.memberVO.phone" var="phone" />
    <sec:authentication property="principal.memberVO.role" var="role" />
</sec:authorize>
<div style="height:1000px;">
    <div class="container">
        <form id="updateForm" action="/member/userupdate" method="post">
            <!-- <input type="hidden" value="" /> -->
            <div class="form-group">
                <h3>회원정보</h3><br>
                <label for="mno">회원번호</label><br>
                <input type="text" class="form-control" id="mno" value="<c:out value="${mno}"/>" name="mno" readonly> <br>

                <label for="username">아이디</label><br>
                <input type="text" class="form-control" id="username" value="<c:out value="${id}"/>" name="username" readonly> <br>

                <label for="password">패스워드</label><br>
                <input type="password" class="form-control" id="password" value="" name="password"> <br>

                <label for="korName">이름</label><br>
                <input type="text" class="form-control" id="korName" value="<c:out value="${koname}"/>" name="korName" required> <br>

                <label>이메일</label><br>
                <input type="text" id="email-prefix" class="form-control" name="email" value="<c:out value="${email}"/>" name="email"> <br>

                <select id="email-domain" name="email-domain">
                    <option value="">직접입력</option>
                    <option value="@gmail.com">@gmail.com</option>
                    <option value="@naver.com">@naver.com</option>
                    <option value="@daum.net">@daum.net</option>
                </select><br><br>

                <label for="phone">전화번호</label>
                <br>
                <input type="tel" class="form-control" id="phone" value="<c:out value="${phone}"/>" name="phone"> <br>

                <label for="address">권한</label><br>
                <input type="text" class="form-control" id="address" value="<c:out value="${role}"/>" name="address" readonly> <br>

                <div class="update_bt">
                    <input type="submit" class="bt_1" value="수정하기" id="updateButton">
                    <input type="button" class="bt_2" value="취소">
                </div>
            </div>
        </form>
    </div>
</div>

<!-- 4. 자바스크립트는 화면이 그려진 뒤에 적용해야 되기에 풋터 앞쪽에 추가해야 됩니다. -->

<%@ include file="../includes/footer.jsp" %>

