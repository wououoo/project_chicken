<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div id="layoutSidenav">
    <div id="layoutSidenav_nav">
        <nav class="sb-sidenav sb-sidenav-dark" id="sidenavAccordion">
            <div class="sb-sidenav-menu">
                <div class="nav">
                    <div class="sb-sidenav-menu-heading">작업관리</div>
                    <a class="nav-link" href="main">
                        <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                        메인화면
                    </a>
                    <div class="sb-sidenav-menu-heading">구분</div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapsePurchases" aria-expanded="false" aria-controls="collapsePurchases">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        구매관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapsePurchases" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="#">원자재 관리</a>
                            <a class="nav-link" href="#">공급업체 관리</a>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseManufacturing" aria-expanded="false" aria-controls="collapseManufacturing">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        제조관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseManufacturing" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="#">BOM</a>
                            <a class="nav-link" href="#">제조지시서</a>
                            <a class="nav-link" href="#">제조수행</a>
                        </nav>
                    </div>
                    <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseSales" aria-expanded="false" aria-controls="collapseSales">
                        <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                        판매관리
                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                    </a>
                    <div class="collapse" id="collapseSales" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                        <nav class="sb-sidenav-menu-nested nav">
                            <a class="nav-link" href="/finishedgoods/goodsmanagement">완제품 관리</a>
                            <a class="nav-link" href="">판매업체 관리</a>
                        </nav>
                    </div>
                    <div class="sb-sidenav-menu-heading">기타정보</div>
                    <a class="nav-link" href="charts.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                        회계정보
                    </a>
                    <a class="nav-link" href="tables.html">
                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                        기업정보
                    </a>
                </div>
            </div>
            <div class="sb-sidenav-footer">
                <div class="small">로그인 정보:</div>
                홍길동님
            </div>
        </nav>
    </div>
    <div id="layoutSidenav_content">
        <!-- 메인 화면 구성 할 곳 -->
        <main>