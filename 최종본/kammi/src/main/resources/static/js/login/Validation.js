function Validation() {
    //변수에 저장
    var uid = document.getElementById("username")
    var pw = document.getElementById("password")
    var cpw = document.getElementById("confirmPassword")
    var phon = document.getElementById("phone")
    var mail = document.getElementById("email-prefix")
    var name = document.getElementById("korName")

    // id, pw
    var regIdPw = /^[a-zA-Z0-9]{6,20}$/;
    var regPassword = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#$%^&*])[a-zA-Z\d!@#$%^&*]{8,20}$/;
    // 이름
    var regName = /^[가-힣a-zA-Z]{2,15}$/;
    // 번호
    var regPhon = /^01([0|1|6|7|8|9])-?([0-9]{3,4})-?([0-9]{4})$/;
    // 이메일
    var regMail = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;

    //아이디 확인
    if(uid.value == ""){
    alert("아이디 입력하세요.")
    uid.focus();
    return false;
}
    //아이디 영어 대소문자 확인
    else if(!regIdPw.test(uid.value)){
    alert("6~20자 영문 대소문자, 숫자만 입력하세요.")
    uid.focus();
    return false;
}

    //비밀번호 확인
    if(pw.value == ""){
    alert("비밀번호 입력하세요.")
    pw.focus();
    return false;
}
    //비밀번호 영어 대소문자 확인
    else if(!regPassword.test(pw.value)){
    alert("비밀번호는 문자, 숫자, 특수문자를 포함하여 8~20자여야 합니다.")
    pw.focus();
    return false;
}

    //비밀번호 확인
    if(cpw.value !== pw.value){
    alert("비밀번호 동일하지 않습니다.")
    cpw.focus();
    return false;
}

    //이름 확인 = 한글과 영어만 가능하도록
    if(name.value == ""){
        alert("이름을 입력하세요.")
        name.focus();
        return false;
    }

    else if(!regName.test(name.value)){
        alert("최소 2글자 이상, 한글과 영어만 입력하세요.")
        name.focus();
        return false;
    }

    //전화번호 확인
    if(phon.value == ""){
        alert("번호를 입력하세요.")
        phon.focus();
        return false;
    }

    else if(!regPhon.test(phon.value)){
        alert("전화번호 형식에 맞게 입력해주세요")
        phon.focus();
        return false;
    }

    //메일주소 확인
    if(mail.value.length == 0){
    alert("메일주소 입력하세요.")
    mail.focus();
    return false;
}

    else if(!regMail.test(mail.value)){
    alert("잘못된 이메일 형식입니다.")
    mail.focus();
    return false;
}

    alert("환영합니다! 가입 완료되었습니다.");

    // 유효성 문제 없을 시 폼에 submit
    document.getElementById("joinForm").submit();
}