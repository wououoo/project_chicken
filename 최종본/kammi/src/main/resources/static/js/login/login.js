function frmCheck() {
    if ($("#username").val() == "") {
        alert("아이디를 입력해주세요.")
        $("#username").focus();
    return false;
    }
    if ($("#password").val() == "") {
        alert("비밀번호를 입력해주세요.");
        $("#password").focus();
    return false;
    }
    $("#loginform").submit();
}

$(document).ready(function (){
    var rememberedUsername = getCookie("rememberedUsername");
    if (rememberedUsername !== "") {
        $("#username").val(rememberedUsername);
    }

    $("#loginform").submit(function (){
        var isChecked = $("#customCheck").is(":checked");
        if (isChecked) {
            var username = $("#username").val();
            setCookie("rememberedUsername", username, 30);
        } else {
            deleteCookie("rememberedUsername");
        }
    });
});

// 쿠키 설정 함수
function setCookie(cookieName, cookieValue, daysToExpire) {
    var date = new Date();
    date.setTime(date.getTime() + (daysToExpire * 24 * 60 * 60 * 1000));
    var expires = "expires=" + date.toUTCString();
    document.cookie = cookieName + "=" + cookieValue + ";" + expires + ";path=/";
}

// 쿠키 가져오기 함수
function getCookie(cookieName) {
    var name = cookieName + "=";
    var decodedCookie = decodeURIComponent(document.cookie);
    var cookieArray = decodedCookie.split(';');
    for(var i = 0; i < cookieArray.length; i++) {
        var cookie = cookieArray[i];
        while (cookie.charAt(0) == ' ') {
            cookie = cookie.substring(1);
        }
        if (cookie.indexOf(name) == 0) {
            return cookie.substring(name.length, cookie.length);
        }
    }
    return "";
}

// 쿠키 삭제 함수
function deleteCookie(cookieName) {

    var now = new Date();

    now.setSeconds(now.getSeconds() - 1);

    document.cookie = cookieName + "=; expires=" + now.toUTCString() + "; path=/;";
}