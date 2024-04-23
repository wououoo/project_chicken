<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
<link href="/resources/css/main/mainpage.css" rel="stylesheet" />
<!--화살표 아이콘-->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<!--SwiperJS-->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>


    <div>
        <div id="main-title">
            <div id="selec" class="title-text">감칠맛을 더하는 미식의 세계</div>
            <img class="title-img" src="/resources/img/mainlogo/mainLogo2.png"></img>
        </div>
        <div id="bg-video">
            <video id="bg-video-content" autoplay muted loop>
                <source src="/resources/img/mainimg/mainBackGround.mp4" type="video/mp4">
            </video>
        </div>

        <div id="product-list">
            <div class="product-menu">
                <div class="product-sub">
                    <div class="product-title">MENU</div>
                    <div class="product-subtitle">감사함을 담아 만드는 메뉴들</div>
                </div>
                <div class="product-arrow">
                    <span class="material-symbols-outlined arrow prev-arrow">arrow_left_alt</span>
                    <span class="material-symbols-outlined arrow next-arrow">arrow_right_alt</span>
                </div>
            </div>

            <div class="swiper mySwiper">
                <div class="swiper-wrapper product-content">
                    <div class="swiper-slide product-box">
                        <div class="product-img"><img class="test-img" src="/resources/img/mainimg/chicken1.jpg"></div>
                        <div class="product-name">텍스트</div>
                    </div>
                    <div class="swiper-slide product-box">
                        <div class="product-img"><img class="test-img" src="/resources/img/mainimg/chicken1.jpg"></div>
                        <div class="product-name">텍스트</div>
                    </div>
                    <div class="swiper-slide product-box">
                        <div class="product-img"><img class="test-img" src="/resources/img/mainimg/chicken1.jpg"></div>
                        <div class="product-name">텍스트</div>
                    </div>
                    <div class="swiper-slide product-box">
                        <div class="product-img"><img class="test-img" src="/resources/img/mainimg/chicken1.jpg"></div>
                        <div class="product-name">텍스트</div>
                    </div>
                    <div class="swiper-slide product-box">
                        <div class="product-img"><img class="test-img" src="/resources/img/mainimg/chicken1.jpg"></div>
                        <div class="product-name">텍스트</div>
                    </div>
                </div>
                <div class="swiper-pagination"></div>
            </div>

        </div>
    </div>

<script>
    document.title="감미 치킨";
    let observer = new IntersectionObserver((e)=>{
        e.forEach((box1)=>{
            if(box1.isIntersecting){
                box1.target.style.opacity=1;
            } else{
                box1.target.style.opacity=0;
            }

        });
    });
    let tx = document.getElementById('selec');
    observer.observe(tx);

    let tx2 = document.getElementById('product-list');
    observer.observe(tx2);

    var swiper = new Swiper(".mySwiper", {
      slidesPerView: 3,
      spaceBetween: 20,
      navigation: {
          nextEl: ".next-arrow",
          prevEl: ".prev-arrow",
      },
      autoplay: {
          delay: 2500,
          disableOnInteraction: false
      },
      pagination: {
          el: ".swiper-pagination",
          type: "fraction",
      },
    });

</script>

<%@ include file="../includes/footer.jsp" %>