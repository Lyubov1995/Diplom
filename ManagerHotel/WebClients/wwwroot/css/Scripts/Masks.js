function show_hide_password(target) {
    var input = document.getElementById('password-input');
    if (input.getAttribute('type') == 'password') {
        target.classList.add('view');
        input.setAttribute('type', 'text');
    } else {
        target.classList.remove('view');
        input.setAttribute('type', 'password');
    }
    return false;
}
function show_hide_password1(target) {
    var input = document.getElementById('password-input1');
    if (input.getAttribute('type') == 'password') {
        target.classList.add('view');
        input.setAttribute('type', 'text');
    } else {
        target.classList.remove('view');
        input.setAttribute('type', 'password');
    }
    return false;
}
$('body').on('input', '#register', function () {
    let val = this.value.trim();
    let index = this.selectionStart;
    this.value = (val[0].toUpperCase() + val.slice(1).toLowerCase()).replace(/[^а-яё\s]/gi, '');
    this.selectionStart = this.selectionEnd = index;
});

window.addEventListener("DOMContentLoaded", function () {
    [].forEach.call(document.querySelectorAll('.tel'), function (input) {
        var keyCode;
        function mask(event) {
            event.keyCode && (keyCode = event.keyCode);
            var pos = this.selectionStart;
            if (pos < 3) event.preventDefault();
            var matrix = "+7 (___) ___ __ __",
                i = 0,
                def = matrix.replace(/\D/g, ""),
                val = this.value.replace(/\D/g, ""),
                new_value = matrix.replace(/[_\d]/g, function (a) {
                    return i < val.length ? val.charAt(i++) : a
                });
            i = new_value.indexOf("_");
            if (i != -1) {
                i < 5 && (i = 3);
                new_value = new_value.slice(0, i)
            }
            var reg = matrix.substr(0, this.value.length).replace(/_+/g,
                function (a) {
                    return "\\d{1," + a.length + "}"
                }).replace(/[+()]/g, "\\$&");
            reg = new RegExp("^" + reg + "$");
            if (!reg.test(this.value) || this.value.length < 5 || keyCode > 47 && keyCode < 58) {
                this.value = new_value;
            }
            if (event.type == "blur" && this.value.length < 5) {
                this.value = "";
            }
        }
        input.addEventListener("input", mask, false);
        input.addEventListener("focus", mask, false);
        input.addEventListener("blur", mask, false);
        input.addEventListener("keydown", mask, false);
    });
});
$(document).ready(function () {
    $("#Email").inputmask("email")
});
$('body').on('click', '.password-control3', function () {
    if ($('#password-input3').attr('type') == 'password') {
        $(this).html('Скрыть пароль');
        $('#password-input3').attr('type', 'text');
    } else {
        $(this).html('Показать пароль');
        $('#password-input3').attr('type', 'password');
    }
    return false;
});
$('body').on('click', '.password-control4', function () {
    if ($('#password-input4').attr('type') == 'password') {
        $(this).html('Скрыть пароль');
        $('#password-input4').attr('type', 'text');
    } else {
        $(this).html('Показать пароль');
        $('#password-input4').attr('type', 'password');
    }
    return false;
});



