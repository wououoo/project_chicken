<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link href="/resources/css/default/fullpage/jquery.fullpage.css" rel="stylesheet" />

<!--모든 세션의 css-->
<style>
    .rwd-table{
        margin:0;
        padding:0;
        text-align:left;
        user-select:none;
        width:100%;
    }

    .rwd-table td{
        cursor:pointer;
    }

    .containerGoods{
        display:flex;
        justify-content:center;
        margin:10px;
        margin-bottom:100px;
        height:auto;
    }

    .containerdiv{
        display:flex;
        flex-direction:column;
        justify-content:center;
        align-items:center;
        padding:30px;
        border:1px solid rgba(0,0,0,0.18);
        background-color:white;
        border-radius:10px;
        width:80%;
        height:auto;
    }

    .title-name{
        display:flex;
        justify-content:center;
        align-items:center;
        width:100%;
    }

    .title-name, .modal-header, .float-right{
        font-family: 'PuradakGentleGothicR';
    }

    .goodstitle{
        display:flex;
        justify-content:space-between;
        align-items:center;
        width:100%;
        margin:20px 0;
        padding:10px;
        padding-top:30px;
        border:1px solid rgba(0,0,0,0.18);
    }

    .select-div{
        display:flex;
        justify-content:space-between;
        align-items:center;
        width:100%;
    }

    .goodsfooter{
        display:flex;
        justify-content:center;
        align-items:center;
        margin-top:50px;
    }

    .table-height{
        height:auto;
    }

    .goods-btn{
        display:flex;
        justify-content:flex-end;
        align-items:center;
    }

    .inputDivBox{
        margin:0;
        padding:0;
        width:50%;
    }

    .select-box{
        display:flex;
    }

    .rwd-table, .goodsfooter, .select-div{
        font-family: 'Pretendard-Regular';
    }
</style>

<!--모든 세션 Ajax 처리 부분-->
<script>
// Ajax 값 넣는 부분
var goodsService = (function() {

    //제품 미판매에서 판매중으로 상태 변경
    function update(goodsplus,callback,error){
        $.ajax({
            type:'put',
            url:'/goodsrest/name/'+goodsplus.name+'/price/'+goodsplus.price+'/units/'+goodsplus.units+'/status/'+goodsplus.status,
            data:JSON.stringify(goodsplus),
            contentType:"application/json; charset=utf-8",
            success:function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error:function(xhr,status,er){
                if(error){
                    error(er);
                }
            }
        });
    }



    //상품 조회
    function getGoods(goodsSearch, callback, error){
        var pageSizeNum=3;
        var search = goodsSearch.search || "없음";
        var status = goodsSearch.status;
        var page = goodsSearch.page || 1;
        $.getJSON("/goodsrest/search/"+search+"/status/"+status+"/page/"+page+"/pagesize/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    function maxPage(goodsSearch, callback, error){
        var pageSizeNum=3;
        var search = goodsSearch.search || "없음";
        var status = goodsSearch.status;

        $.getJSON("/goodsrest/"+search+"/"+status+"/pageSize/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    // 창고 추가 ajax 호출 함수
    function storageAdd(storage, callback, error) {
        $.ajax({
            //request처리
            type : 'post',                                      // form의 method속성 값
            url : '/storagerest/add',                               // form의 action값
            data : JSON.stringify(storage),                       // json으로 string처리
            contentType : "application/json; charset=utf-8",    // content-type지정
            //response처리
            success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                if (error) {
                    error(er);
                }
            }
        });
    }

    //창고 조회
    function getStorage(storageSearch, callback, error){
        var pageSizeNum=3;
        var search = storageSearch.search || "없음";
        var status = storageSearch.status;
        var page = storageSearch.page || 1;
        $.getJSON("/storagerest/search/"+search+"/status/"+status+"/page/"+page+"/pagesize/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    //창고 검색 총 개수
    function maxStoragePage(storageSearch, callback, error){
        var pageSizeNum=3;
        var search = storageSearch.search || "없음";
        var status = storageSearch.status;

        $.getJSON("/storagerest/"+search+"/"+status+"/pageSize/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    //창고 선택 삭제
    function storageRemove(snum,callback,error){
        $.ajax({
            type:'delete',
            url:'/storagerest/snum/'+snum,
            success:function(deleteResult, status, xhr){
                if(callback){
                    callback(deleteResult);
                }
            },
            error:function(xhr,status,er){
                if(error){
                    error(er);
                }
            }
        });
    }

    //제품 상태 추가
    function storageUpdate(storage,callback,error){
        $.ajax({
            type:'put',
            url:'/storagerest/address/'+storage.address+'/total/'+storage.total+'/id/'+storage.id,
            data:JSON.stringify(storage),
            contentType:"application/json; charset=utf-8",
            success:function(result,status,xhr){
                if(callback){
                    callback(result);
                }
            },
            error:function(xhr,status,er){
                if(error){
                    error(er);
                }
            }
        });
    }

    //세션 2의 제품 출고 상품 목록
    function readyGoodsList(goodsSearch, callback, error){
        $.getJSON("/invenrest/goods",
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    //세션 2의 모달 안에서 사용 가능한 창고 테이블 조회
    function getAvailableStorage(invenStorage, callback, error){
        var pageSizeNum=3;
        var goodsnum = invenStorage.goodsnum || 0;
        var status = invenStorage.status;
        var page = invenStorage.page || 1;
        $.getJSON("/invenrest/storage/"+goodsnum+"/page/"+page+"/pagesize/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    //재고 검색 총 개수
    function getInvenModalCount(invenModal, callback, error){
        var pageSizeNum=3;
        var goodsNum = invenModal.goodsNum || 0;

        $.getJSON("/invenrest/"+goodsNum+"/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }


    //세션 2의 재고 테이블 조회
    function getInvenTable(inven, callback, error){
        var pageSizeNum=3;
        var goods = inven.goods || "없음";
        var division = inven.division;
        var page = inven.page || 1;
        $.getJSON("/invenrest/inven/division/"+division+"/goods/"+goods+"/page/"+page+"/pagesize/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    //재고 검색 총 개수
    function maxInvenPage(invenSearch, callback, error){
        var pageSizeNum=3;
        var goods = invenSearch.goods || "없음";
        var division = invenSearch.division;

        $.getJSON("/invenrest/"+division+"/"+goods+"/"+pageSizeNum,
            function(data){
                if(callback){
                    callback(data);
                }
        }).fail(function(xhr,status,err){
            if(error){
                error();
            }
        });
    }

    // 출고 관리 처리
    function outterSet(outter, callback, error) {
        $.ajax({
            //request처리
            type : 'post',                                      // form의 method속성 값
            url : '/invenrest/add',                               // form의 action값
            data : JSON.stringify(outter),                       // json으로 string처리
            contentType : "application/json; charset=utf-8",    // content-type지정
            //response처리
            success : function(result, status, xhr) {           // call 성공시 오는 처리되는 함수
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {                 // call 실패시 오는 처리되는 함수
                if (error) {
                    error(er);
                }
            }
        });
    }


    return {
        update: update,
        getGoods:getGoods,
        maxPage:maxPage,
        storageAdd:storageAdd,
        getStorage:getStorage,
        maxStoragePage:maxStoragePage,
        storageRemove:storageRemove,
        storageUpdate:storageUpdate,
        readyGoodsList:readyGoodsList,
        getAvailableStorage:getAvailableStorage,
        getInvenTable:getInvenTable,
        maxInvenPage:maxInvenPage,
        getInvenModalCount:getInvenModalCount,
        outterSet:outterSet
    };
})();
</script>

<!--FullPage.js 사용-->
<div class="fullpage">
    <!-- 1번째 섹션 -->
    <div class="section">
        <div>
        <%@ include file="../finishedgoods/goodssection.jsp" %>
        </div>
    </div>
    <!-- 2번째 섹션 -->
    <div class="section">
        <div>
        <%@ include file="../finishedgoods/goodsinventorysection.jsp" %>
        </div>
    </div>
    <!-- 3번째 섹션  -->
    <div class="section">
        <div>
        <%@ include file="../finishedgoods/goodsstoragesection.jsp" %>
        </div>
    </div>
</div>

<!-- 모달 창 추가 -->
<%@ include file="../finishedgoods/goodsmodal.jsp" %>


<!-- 화면 전환 라이브러리 -->
<script src="/resources/js/default/fullpage/jquery.fullpage.js"></script>
<script src="/resources/js/default/fullpage/scrolloverflow.js"></script>


<script>

//화면 위에 title 이름 변경
document.title="완제품 관리";

//페이지별 스크롤 섹션 조절
$(function() {
    var page = $('.fullpage').fullpage({
        menu:'.sb-topnav',
        anchors: ['firstPage', 'secondPage', '3rdPage'],

        // 1. 네비게이션 보이기 옆에 생기는 선택 버튼 허용
        navigation : true,

        // 2. 네비게이션 위치 지정 옆에 생기는 선택 버튼
        navigationPosition : 'right',

        // 3. 각 섹션의 배경색상 지정 (6자의 핵사코드 작성가능)
        sectionsColor : ['#E5DDC5', 'pink', 'gray'],

        // 스크롤 허용을 원하는 요소의 클래스
        scrollOverflow: true, //섹션 내용이 커지면 저절로 섹션 구간에 스크롤 생김

    });
});

//특정 구간을 넘으면 검색 바 사라지는 로직
window.addEventListener("resize", function() {
    for(let i=0;i<3;i++){
        if(document.getElementsByClassName('containerdiv')[i].getBoundingClientRect().width<463){
            document.getElementsByClassName('goodstitle')[i].style.display="none";
        } else{
            document.getElementsByClassName('goodstitle')[i].style.display="flex";
        }
    }
});

</script>

<%@ include file="../includes/footer.jsp" %>