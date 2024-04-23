<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="/resources/js/login/login.js" defer></script>
    <link rel="stylesheet" href="/resources/css/login/login.css">

    <script>
        // URL에서 error 및 message 파라미터 읽기
        const urlParams = new URLSearchParams(window.location.search);
        const error = urlParams.get('error');
        const message = urlParams.get('message');

        // 실패 메시지가 있는 경우에만 표시
        if (error === 'true' && message) {
            const errorMessage = decodeURIComponent(message);
            alert(errorMessage); // 또는 다른 방식으로 메시지 표시
        }
    </script>

</head>
<body>
<header class="head">
    <img src="/resources/img/mainlogo/mainLogo.png">
</header>
<div class="container">
    <form id="loginform" method="POST" action="/member/login">
    <c:if test="${not empty rememberCookie.getValue()}">
        <c:set value="checked" var="checked" />
    </c:if>
        <div class="input-box">
            <input id="username" type="text" name="username" placeholder="아이디">
            <label for="username">아이디</label>
        </div>
        <div class="input-box">
            <input id="password" type="password" name="password" placeholder="비밀번호">
            <label for="password">비밀번호</label>
        </div>

        <div class="custom-control custom-checkbox small">
            <input type="checkbox" class="custom-control" id="customCheck" name="customCheck" value="true" ${checked} />
            <span class="custom-control-la" for="customCheck">아이디 저장</span>
        </div>

        <div class="buttons">
            <button class="btn-hover color-11" onclick="return frmCheck();">로그인</button><br><br>
            <button class="btn-hover color-9" type="button" onclick="location.href='/member/join'">회원가입</button>
        </div>

        <div class="api_signup">
            <a href="/oauth2/authorization/naver"><img src="/resources/img/login/n_bt2.png"></a><br>
            <a href="/oauth2/authorization/kakao"><img src="/resources/img/login/k_bt1.png"></a>
        </div>
    </form>
</div>
</body>
</html>