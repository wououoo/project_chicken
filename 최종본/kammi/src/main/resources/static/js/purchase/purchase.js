console.log('구매.js 호출');

function materialInsert(material, callback, error) {
    $.ajax({
        // request처리
        type : 'post',                                      // form의 method속성 값
        url : '/purchase/materialInsert',                               // form의 action값
        data : JSON.stringify(material),                       // json으로 string처리하면서 파라미터 전달
        contentType : "application/json; charset=utf-8",    // content-type지정
        // response처리
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

function supplierRead(part, callback, error) {
    $.ajax({
        type: 'get',
        url: '/purchase/supplierRead?part=' + part,
        contentType: "application/json; charset=utf-8",
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (error) {
                error(er);
            }
        }
    });
}

function materialRead(part, callback, error) { // 제품등록시
    $.ajax({
        type: 'get',
        url: '/purchase/materialRead?part=' + part,
        contentType: "application/json; charset=utf-8",
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (error) {
                error(er);
            }
        }
    });
}

function materialsRead(part, callback, error) { //제품들을 불러올때
    $.ajax({
        type: 'get',
        url: '/purchase/materialsRead?part=' + part,
        contentType: "application/json; charset=utf-8",
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (error) {
                error(er);
            }
        }
    });
}

function purchaseListInsert(purchaseList, callback, error) {
    $.ajax({
        // request처리
        type : 'post',                                      // form의 method속성 값
        url : '/purchase/purchaseListInsert',                               // form의 action값
        data : JSON.stringify(purchaseList),                       // json으로 string처리하면서 파라미터 전달
        contentType : "application/json; charset=utf-8",    // content-type지정
        // response처리
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

function materialPurchaseInsert(materialPurchase, callback, error) {
    $.ajax({
        // request처리
        type : 'post',                                      // form의 method속성 값
        url : '/purchase/materialPurchaseInsert',                               // form의 action값
        data : JSON.stringify(materialPurchase),                       // json으로 string처리하면서 파라미터 전달
        contentType : "application/json; charset=utf-8",    // content-type지정
        // response처리
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

function materialPurchaseRead(purchaseid, callback, error) {
    $.ajax({
        type: 'get',
        url: '/purchase/materialPurchaseRead?purchaseid=' + purchaseid,
        contentType: "application/json; charset=utf-8",
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (error) {
                error(er);
            }
        }
    });
}

function materialDelete(materialid, callback, error) {
    $.ajax({
        type: 'delete',
        url: '/purchase/materialDelete?materialid=' + materialid,
        contentType: "application/json; charset=utf-8",
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (error) {
                error(er);
            }
        }
    });
}

function materialDelete(materialid, callback, error) {
    $.ajax({
        type: 'delete',
        url: '/purchase/materialDelete?materialid=' + materialid,
        contentType: "application/json; charset=utf-8",
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (error) {
                error(er);
            }
        }
    });
}

function categoryRead(category, callback, error) {
    $.ajax({
        type: 'get',
        url: '/purchase/categoryRead?category=' + category,
        contentType: "application/json; charset=utf-8",
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (error) {
                error(er);
            }
        }
    });
}

function getPage(pageNum, callback, error) {
    $.ajax({
        type: 'get',
        url: '/purchase/getPage?pageNum=' + pageNum,
        contentType: "application/json; charset=utf-8",
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (error) {
                error(er);
            }
        }
    });
}


function createPagination(totalPages, currentPage) {
    // 페이지네이션 컨테이너와 페이지네이션 목록을 선택합니다
    var $paginationWrapper = $(".pagination__wrapper");
    var $paginationList = $paginationWrapper.find(".pagination");

    // 이전 페이지 버튼을 생성합니다
    var $prevButton = $("<button>", {
        class: "pagebtn prev",
        text: "<"
    });
    var $prevListItem = $("<li>", {
        class: "pagelist"
    }).append($prevButton);

    // 다음 페이지 버튼을 생성합니다
    var $nextButton = $("<button>", {
        class: "pagebtn next",
        text: ">"
    });
    var $nextListItem = $("<li>", {
        class: "pagelist"
    }).append($nextButton);

    // 페이지네이션 목록을 비웁니다
    $paginationList.empty();

    // 이전 페이지 버튼을 추가합니다
    $paginationList.append($prevListItem);

    // 페이지 번호 버튼을 생성하고 추가합니다
    for (var i = 1; i <= totalPages; i++) {
        var $pageButton = $("<button>", {
            class: "pagebtn pagenum",
            text: i
        });
        if (i === currentPage) {
            $pageButton.addClass("active");
        }
        var $pageListItem = $("<li>", {
            class: "pagelist"
        }).append($pageButton);
        $paginationList.append($pageListItem);
    }

    // 다음 페이지 버튼을 추가합니다
    $paginationList.append($nextListItem);

    $paginationList.on("click", ".pagenum", function() {
        // 현재 활성화된 페이지 버튼의 active 클래스를 제거합니다
        $paginationList.find(".pagenum.active").removeClass("active");
        console.log($(this).text());
        // 클릭한 페이지 버튼에 active 클래스를 추가합니다
        getPage($(this).text(),
            function(list){
                // 테이블의 tbody를 선택합니다
                var $tbody = $(".rwd-table tbody");

                // 테이블 내용을 비웁니다
                $tbody.empty();
                $tbody.append("<tr><th>번호</th><th>원자재명</th><th>수량</th><th>단위</th><th>가격</th><th>분류</th></tr>");
                // 받은 데이터를 이용하여 테이블에 새로운 내용을 추가합니다
                for (var i = 0; i < list.length; i++) {
                    var mater = list[i];
                    var $row = $("<tr>", { class: "clickable-row" });
                    $row.append("<td>" + mater.material_id + "</td>");
                    $row.append("<td>" + mater.material_name + "</td>");
                    $row.append("<td>" + mater.material_quantity + "</td>");
                    $row.append("<td>" + mater.material_units + "</td>");
                    $row.append("<td>" + mater.material_price + "</td>");
                    $row.append("<td>" + mater.material_category + "</td>");
                    $tbody.append($row);
                }
            }
        );
        $(this).addClass("active");
    });
}

