<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link rel="stylesheet" href="/resources/css/login/signupform.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
    <script src="/resources/js/login/email.js" defer></script>
    <script src="/resources/js/login/Validation.js" defer></script>
    <script src="/resources/js/login/checkID.js" defer></script>
</head>
<body>
<div class="container">
    <div class="header">
        <h4>회원가입</h4>
            <P>환영합니다!</P>
    </div>
    <form id="joinForm" action="/member/joinProc" method="post" onsubmit="return Validation()">
        <div class="InputId">
            <input type="text" id="username" name="username" placeholder="아이디 입력 (6~20자)"/>
            <button type="button" id="checkID">중복확인</button><br>
            <span id="olmessage"></span>
        </div>
        <div class="Profile">
            <input type="password" id="password" name="password" placeholder="비밀번호 입력 (문자, 숫자, 특수문자 포함 8~20자)"/><br>
            <input type="password" id="confirmPassword" placeholder="비밀번호 재입력"/><br>
            <input type="text" id="korName" name="korName" placeholder="이름"/><br>
            <input type="text" id="phone" name="phone" placeholder="전화번호(010 시작하는 - 포함하여 입력해주세요)"/><br>
            <input type="text" id="email-prefix" name="email" placeholder="이메일주소"/>
            <select id="email-domain" name="email-domain">
                <option value="">직접입력</option>
                <option value="@gmail.com">@gmail.com</option>
                <option value="@naver.com">@naver.com</option>
                <option value="@daum.net">@daum.net</option>
            </select>
            <br>
            <div class="authoritybox">
                <label>권한:</label>
                <select id="authority-domain" name="role">
                    <option value="ROLE_PURCHASE">구매관리자</option>
                    <option value="ROLE_MANUFACTURING">제조관리자</option>
                    <option value="ROLE_SALES">판매관리자</option>
                    <option value="ROLE_MASTER">마스터관리자</option>
                </select>
            </div>
        </div>
        <div class="signupbutton">
            <button type="submit" id="button1">가입하기</button>
            <button type="button" id="button2" onclick="location.href='/member/login'">가입취소</button>
        </div>
    </form>
</div>
</body>
</html>