<%@ Control Language="C#" AutoEventWireup="true" Inherits="HL.Lib.MVC.ViewControl" %>

<div class="date-container">
    <span><%=Utils.DayOfWeekVN(DateTime.Now) %>, ngày <%=string.Format("{0:dd/MM/yyyy}",DateTime.Now) %></span>
    <span class="breadcrum-x"></span>
</div>
<script>
    $(document).ready(function () {

        $('.header_right .icon').click(function () {
            if ($(this).hasClass('open')) {
                $(this).removeClass('open');
            } else {
                $(".open").removeClass('open');
                $(this).addClass('open');
            }
        });

        if ($("#thoigiandemnguoc").length) {
            var d = new Date(2017, 9, 24, 9, 9, 55, 0);
            var md = $("#thoigiandemnguoc").html().trim();
            console.log(md);
            var dy = parseInt(md.split(' ')[0].split('/')[2]);
            var dm = parseInt(md.split(' ')[0].split('/')[1]);
            var dd = parseInt(md.split(' ')[0].split('/')[0]);
            var dh = parseInt(md.split(' ')[1].split(':')[0]);
            var dmi = parseInt(md.split(' ')[1].split(':')[1]);
            var d2 = new Date(dy, dm, dd, dh, dmi, 0, 0);
            var second = 0;


            setInterval(function () {
                var dif = d2.getTime() - d.getTime() - second * 1000;
                second++;
                $(".c-01").html(ngaythang(dif));
            }, 1000);
        }
    });

    function ngaythang(dif) {
        var ngay = parseInt(dif / 86400000);
        var gio = parseInt((dif % 86400000) / 3600000);
        var phut = parseInt(((dif % 86400000) % 3600000) / 60000);
        var giay = ((dif % 86400000) % 3600000) % 60000 / 1000;
        return ngay + " ngày " + gio + ":" + phut + ":" + giay;
    }
</script>
