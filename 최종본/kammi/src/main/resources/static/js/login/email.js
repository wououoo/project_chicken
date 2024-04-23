// 이메일 도메인 입력
document.getElementById('email-domain').addEventListener('change', function () {
    var selectedValue = this.value;
    var emailPrefix = document.getElementById('email-prefix').value.trim();

    var domainIndex = emailPrefix.lastIndexOf('@');
    if (domainIndex !== -1) {
        emailPrefix = emailPrefix.slice(0, domainIndex);
    }
    document.getElementById('email-prefix').value = emailPrefix + selectedValue;
});



$(document).ready(function() {
    $('#updateForm').submit(function (event) {
        if ($('#password').val() === '') {
            alert('패스워드를 입력해주세요.');
            event.preventDefault();
        }
    });
});



