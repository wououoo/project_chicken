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


        <!--메인 화면 영상 처리-->
        <div id="bg-video">
            <video id="bg-video-content" autoplay muted loop><!--자동 재생, 음속어, 무한 반복-->
                <source src="/resources/img/mainimg/mainBackGround.mp4" type="video/mp4">
            </video>
        </div>


        <div id="product-list" style="margin-bottom:100px;">
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
                <div class="swiper-wrapper product-content main-img">

                </div>
                <div class="swiper-pagination"></div>
            </div>

        </div>
    </div>

<script>
document.title="감미 치킨";
var mainService = (function() {

    function getImg(rno, callback,error){
        $.get("/goodsrest/goods/img",function(result){
            if(callback){
                callback(result);
            }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    return {
        getImg: getImg
    };
})();

var mainimgUL = $(".main-img");
function showMainImgList() {
    mainService.getImg(
        {},
        function(list) {                      // ajax 함수 콜 성공시 처리

            if(list == null || list.length == 0){
                mainimgUL.html("");
                return;
            }
            var str = "";

            for(var i = 0, len = list.length || 0; i < len; i++) {
                str += "<div class='swiper-slide product-box'>";
                str += "<div class='product-img'><img class='test-img' src='/resources/upload/chickenPhoto/"+list[i].fileName+"'></div>";
                str += "<div class='product-name'>"+list[i].recipe_Name+"</div>";
                str += "</div>";
            }
            for(var i = 0, len = list.length || 0; i < len; i++) {
                str += "<div class='swiper-slide product-box'>";
                str += "<div class='product-img'><img class='test-img' src='/resources/upload/chickenPhoto/"+list[i].fileName+"'></div>";
                str += "<div class='product-name'>"+list[i].recipe_Name+"</div>";
                str += "</div>";
            }
            mainimgUL.html(str);
        }
    );
}
showMainImgList();

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

//스위퍼 라이브러리 사용
var swiper = new Swiper(".mySwiper", {
  slidesPerView: 3, //한번에 보여줄 슬라이드량
  spaceBetween: 20, //슬라이드 간의 여백
  navigation: {
      nextEl: ".next-arrow", //다음 버튼
      prevEl: ".prev-arrow", //이전 버튼
  },
  autoplay: {
      delay: 2500,  //2.5초 마다 전환
      disableOnInteraction: false //한번 끝까지 가도 자동재생
  },
  pagination: { //페이징 처리
      el: ".swiper-pagination",
      type: "fraction",
  },
});



</script>

<%@ include file="../includes/footer.jsp" %>