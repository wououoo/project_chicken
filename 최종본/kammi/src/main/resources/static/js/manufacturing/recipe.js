console.log(' Module...');

var recipeService = (function() {

    // 레시피 등록 ajax 호출함수
    function recipeInsert(recipe, callback, error) {
        console.log("add recipe...............");

        $.ajax({
            // request처리
            type : 'post',                                      // form의 method속성 값
            url : '/recipe/rest/add',                               // form의 action값
            data : JSON.stringify(recipe),                       // json으로 string처리하면서 파라미터 전달, json으로 보내야함
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

    function recipeStandardInsert(recipe, callback, error) {
        console.log("add recipeStandard...............");

        $.ajax({
            // request처리
            type : 'post',                                      // form의 method속성 값
            url : '/recipe/rest/recipe-standard',               // form의 action값
            data : JSON.stringify(recipe),                      // json으로 string처리하면서 파라미터 전달, json으로 보내야함
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

    // 레시피 삭제
    function recipeDelete(recipe_Id, callback, error) {
        $.ajax({
            type : 'delete',
            url : '/recipe/' + recipe_Id,
            success : function(deleteResult, status, xhr) {
                if (callback) {
                    callback(deleteResult);
                }
            },
            error : function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }





    // 수정
    function recipeUpdate(recipe, callback, error) {
        $.ajax({
            type : 'put',
            url : '/recipe/' + recipe.recipe_Id,
            data : JSON.stringify(recipe),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

    // 레시피 상세조회
    function recipeInfoGet(recipe_Id, callback, error) {
        $.ajax({
            type : 'post',
            url : '/recipe/rest/getPhoto',
            data : JSON.stringify(recipe_Id),
            contentType : "application/json; charset=utf-8",
            success : function(result, status, xhr) {
                if (callback) {
                    callback(result);
                }
            },
            error : function(xhr, status, er) {
                if (error) {
                    error(er);
                }
            }
        });
    }

        function recipeInfoGetForUpdate(recipe_Id, callback, error) {
            $.ajax({
                type : 'post',
                url : '/recipe/rest/selectAllRecipeInfoForUpdate',
                data : JSON.stringify(recipe_Id),
                contentType : "application/json; charset=utf-8",
                success : function(result, status, xhr) {
                    if (callback) {
                        callback(result);
                    }
                },
                error : function(xhr, status, er) {
                    if (error) {
                        error(er);
                    }
                }
            });
        }

    function displayTime(timeValue) {
        var today = new Date();
        var replyDate =  new Date(timeValue);
        var replyDateTime = replyDate.getTime();        // 단위는 밀리세컨드

        var gap = today.getTime() - replyDateTime;
		var dateObj = new Date(replyDateTime);
		var str = "";
		if (gap < (1000 * 60 * 60 * 24)) {          // 24시간이 지나지 않은 날짜는 시분초로 표시
			var hh = dateObj.getHours();
			var mi = dateObj.getMinutes();
			var ss = dateObj.getSeconds();

			return [ (hh > 9 ? '' : '0') + hh, ':', (mi > 9 ? '' : '0') + mi,
					':', (ss > 9 ? '' : '0') + ss ].join('');
		} else {                                    // 24시간이 지난 날짜는 년월일로 표시
			var yy = dateObj.getFullYear();
			var mm = dateObj.getMonth() + 1; // getMonth() is zero-based
			var dd = dateObj.getDate();

			return [ yy, '-', (mm > 9 ? '' : '0') + mm, '-',
					(dd > 9 ? '' : '0') + dd ].join('');
		}
    }

    return {
        recipeInsert: recipeInsert,
        recipeStandardInsert: recipeStandardInsert,
        recipeDelete: recipeDelete,
        recipeUpdate: recipeUpdate,
        recipeInfoGet: recipeInfoGet,
        recipeInfoGetForUpdate : recipeInfoGetForUpdate,
        displayTime: displayTime
    };       // replyAdd function의 내용이 나옴
})();