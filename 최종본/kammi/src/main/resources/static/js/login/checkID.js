
    $(document).ready(function() {

        let isIdChecked = false;

        // 중복 체크 버튼 클릭 시

    $("#checkID").click(function() {
        const id = $("#username").val().trim(); // 입력된 아이디 값
        const idRegex = /^[a-zA-Z0-9]{6,20}$/;

        // 아이디가 비어있는지 검사

        if (id === "") {
            $("#olmessage").text("아이디를 입력하세요.");
            $("#olmessage").addClass("olmessagef").removeClass("olmessaget");
            return;
        } else if (!idRegex.test(id)) {
            $("#olmessage").text("아이디는 영문 대소문자와 숫자만 사용하여 6~20자로 입력하세요.");
            $("#olmessage").addClass("olmessagef").removeClass("olmessaget");
            return;
        }

        $.ajax({
            type: "GET",
            url: "/member/idCheck",
            data: { id: id },
            success: function(data) {
                if(data == 1) {
                    $("#olmessage").text("이미 사용 중인 ID입니다.");
                    $("#olmessage").addClass("olmessagef").removeClass("olmessaget");
                    isIdChecked = false;
                } else {
                    $("#olmessage").text("사용 가능한 ID입니다.");
                    $("#olmessage").addClass("olmessaget").removeClass("olmessagef");
                    isIdChecked = true;
                }
            },
            error: function() {
                console.error("Error while checking ID.");
            }
        });
    });
        $("#button1").click(function(event) {
            if (!isIdChecked) {
                $("#olmessage").text("아이디 중복을 확인하세요.");
                $("#olmessage").addClass("olmessagef").removeClass("olmessaget");
                event.preventDefault();
                return;
            }
    });
});