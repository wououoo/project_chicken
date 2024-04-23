<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- 사용방법 -->

<!-- 1. 헤더 밑에는 반드시 풋터가 있어야합니다. -->
<%@ include file="../includes/header.jsp" %>

<!-- 2. CSS와 자바스크립트는 헤더 밑에 추가해주면 적용 됩니다. -->
<link href="" rel="stylesheet" />

<!-- 3. 중간 내용은 헤더와 풋터 사이에 있어야합니다. -->
<div style="height:1000px;">
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="UTF-8">
        <title>Access Denied</title>
    </head>
    <body>
    <h1>Access Denied</h1>
    <p>권한이 없습니다. 접근이 거부되었습니다.</p>
    </body>
    </html>
</div>

<!-- 4. 자바스크립트는 화면이 그려진 뒤에 적용해야 되기에 풋터 앞쪽에 추가해야 됩니다. -->
<%@ include file="../includes/footer.jsp" %>

