$(function () {

    $("#Date1").datepicker({
        dateFormat: 'dd.mm.yy',
        minDate: 0,
        maxDate: "+3m"
    })
        .get(0).setAttribute("type", "text");

    $("#Date2").datepicker({
        dateFormat: 'dd.mm.yy',
        minDate: "+1d",
        maxDate: "+3m"
    })
        .get(0).setAttribute("type", "text");

    $.datepicker.regional['ru'] = {
        closeText: 'Закрыть',
        prevText: 'Предыдущий',
        nextText: 'Следующий',
        currentText: 'Сегодня',
        monthNames: ['Январь', 'Февраль', 'Март', 'Апрель', 'Май', 'Июнь', 'Июль', 'Август', 'Сентябрь', 'Октябрь', 'Ноябрь', 'Декабрь'],
        monthNamesShort: ['Янв', 'Фев', 'Мар', 'Апр', 'Май', 'Июн', 'Июл', 'Авг', 'Сен', 'Окт', 'Ноя', 'Дек'],
        dayNames: ['воскресенье', 'понедельник', 'вторник', 'среда', 'четверг', 'пятница', 'суббота'],
        dayNamesShort: ['вс', 'пн', 'вт', 'ср', 'чт', 'пт', 'сб'],
        dayNamesMin: ['Вс', 'Пн', 'Вт', 'Ср', 'Чт', 'Пт', 'Сб'],
        weekHeader: 'Не',
        dateFormat: 'dd.mm.yy',
        firstDay: 1,
        isRTL: false,
        showMonthAfterYear: false,
        yearSuffix: ''
    };
    $.datepicker.setDefaults($.datepicker.regional['ru']);
});

function updateDate2() {
    var date1 = document.getElementById("Date1").value;
    var date2 = document.getElementById("Date2").value;

    let arr = date1.split('.');
    let arr1 = date2.split('.');

    var currentDate = new Date(arr[2], arr[1], arr[0]);
    var currentDate1 = new Date(arr1[2], arr1[1], arr1[0]);

    if (currentDate.getDate() == 30 && currentDate.setDate(currentDate.getDate() + 1) != 31) {

    }

    currentDate.setDate(currentDate.getDate() + 1);
    if (currentDate.getMonth() < 10) {
        var str1 = currentDate.getDate() + '.0' + currentDate.getMonth() + '.' + currentDate.getFullYear();
    }
    if (currentDate.getDate() < 10)
        var str1 = '0' + currentDate.getDate() + '.' + currentDate.getMonth() + '.' + currentDate.getFullYear();
    if (currentDate.getMonth() < 10 && currentDate.getDate() < 10) {
        var str1 = '0' + currentDate.getDate() + '.0' + currentDate.getMonth() + '.' + currentDate.getFullYear();
    }

    if (currentDate > currentDate1) {
        document.getElementById("Date2").value = str1;

        var minDate = $("#Date2").datepicker("option", "minDate", str1);

        $("#Date2").datepicker({
            dateFormat: 'dd.mm.yy',
            minDate: str1
        })
            .get(0).setAttribute("type", "text");
    }
    else {
        var minDate = $("#Date2").datepicker("option", "minDate", str1);
        $("#Date2").datepicker({
            dateFormat: 'dd.mm.yy',
            minDate: str1
        })
            .get(0).setAttribute("type", "text");
    }

}

