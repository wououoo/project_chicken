<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>헤더</title>
        <!-- 스타일 시트 -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="/resources/css/default/styles.css" rel="stylesheet" />
        <link href="/resources/css/components/includes.css" rel="stylesheet" />
        <link href="/resources/css/components/components-style.css" rel="stylesheet" />
        <link href="/resources/img/mainlogo/projecticon.png" rel="icon" />

        <!--제이 쿼리-->
        <script src="/resources/vendor/jquery/jquery.min.js"></script>
        <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="/main"><img id="mainlogo" src="/resources/img/mainlogo/mainLogo.png"></a>
            <div id="top-butten-div">
                <!-- Sidebar Toggle-->
                <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
                <!-- Navbar Search-->

                <!-- Navbar-->
                <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"  margin-right = "1000px"><i class="fas fa-user fa-fw"></i></a>
                        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown"  >
                            <li><a class="dropdown-item" href="#!">설정</a></li>
                            <li><a class="dropdown-item" href="#!">회원정보</a></li>
                            <li><hr class="dropdown-divider" /></li>
                            <li><a class="dropdown-item" href="#!">로그아웃</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </nav>
<%@ include file="menu.jsp" %>