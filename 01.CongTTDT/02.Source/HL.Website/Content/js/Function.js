﻿function getNodeValue(o) {
    try {
        return o.item(0).firstChild.nodeValue;
    }
    catch (err) {
        return '';
    }
}

function fnGuiGopY(duthaoid, name, email, title, content, sFile) {
    var num = Math.floor(Math.random() * 999999);
    var s = CKEDITOR.instances.Content.getData();
    console.log(s);
    sLink = '/Tools/Ajax.aspx?cmd=GuiGopY&duthaoid=' + duthaoid + '&name=' + name.value.trim() + '&email=' + email.value.trim() + '&title=' + title.value.trim() + '&content=' + escape(s) + '&sFile=' + escape(sFile) + '&rnd=' + num;
    showLoading('&nbsp;Đang gửi góp ý...', 'lblLoad');

    AjaxRequest.get({
        'url': sLink,
        'onSuccess': function (req) {
            with (req.responseXML.getElementsByTagName("I").item(0)) {
                var sHtml = getNodeValue(getElementsByTagName("Content"));
                if (sHtml !== "") {
                    name.value = "";
                    email.value = "";
                    //phone.value = "";
                    title.value = "";
                    content.value = "";
                    name.focus();
                    hideLoading();
                    alertSuccess(sHtml);
                }
            }
            $("#closeAlert").click();
        },
        'onError': function (req) { }
    });
}

function getParameterByName(name, url) {
    if (!url) {
        url = window.location.href;
    }
    name = name.replace(/[\[\]]/g, "\\$&");
    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
        results = regex.exec(url);
    if (!results) return null;
    if (!results[2]) return '';
    return decodeURIComponent(results[2].replace(/\+/g, " "));
}

function refreshSafeCode() {
    var ranNum = Math.floor(Math.random() * 999999);
    sLink = '/Tools/Ajax.aspx?cmd=refresh&rnd=' + ranNum;

    AjaxRequest.get(
        {
            'url': sLink,
            'onSuccess': function (req) {
                with (req.responseXML.getElementsByTagName('S').item(0)) {
                    var content = getNodeValue(getElementsByTagName('Content'));
                    document.getElementById("safeCode").innerHTML = content;
                    document.getElementById("sVY").value = content;
                }
            },
            'onError': function (req) { }
        }
    )

}

function checkdk(tentl, hoten, email, dienthoai, mk, golaimk, mabaove, sVY) {
    var obj = $('#Waiting,.hidediv');
    obj.show();
    var ranNum = Math.floor(Math.random() * 999999);
    var sLink = '/Tools/Ajax.aspx?cmd=checkdk&tentl=' + tentl + '&hoten=' + hoten + '&email=' + email + '&dienthoai=' + dienthoai + '&mk=' + mk + '&golaimk=' + golaimk + '&mabaove=' + mabaove + '&sVY=' + sVY + '&rnd=' + ranNum;
    AjaxRequest.get({
        'url': sLink,
        'onSuccess': function (req) {
            with (req.responseXML.getElementsByTagName('I').item(0)) {
                var check = getNodeValue(getElementsByTagName('Content'));
                if (check == '')
                    $('#dk').click();
                else {
                    obj.hide();
                    alert(check);
                }
            }
        },
        'onError': function (req) { }
    });
}

function checkdn(LoginName, pass) {
    var obj = $('#Waiting,.hidediv');
    obj.show();
    var ranNum = Math.floor(Math.random() * 999999);
    var sLink = '/Tools/Ajax.aspx?cmd=checkdn&LoginName=' + LoginName + '&pass=' + pass + '&rnd=' + ranNum;
    AjaxRequest.get({
        'url': sLink,
        'onSuccess': function (req) {
            with (req.responseXML.getElementsByTagName('I').item(0)) {
                var check = getNodeValue(getElementsByTagName('Content'));
                if (check == '1') {
                    window.location = window.location.href;
                    //$('#dn').click();
                } else {
                    obj.hide();
                    alert('Tên đăng nhập hoặc mật khẩu không đúng!');
                }
            }
        },
        'onError': function (req) { }
    });
}

function dx(LoginName, pass) {
    var obj = $('#Waiting,.hidediv');
    obj.show();
    var ranNum = Math.floor(Math.random() * 999999);
    var sLink = '/Tools/Ajax.aspx?cmd=dx&rnd=' + ranNum;
    AjaxRequest.get({
        'url': sLink,
        'onSuccess': function (req) {
            with (req.responseXML.getElementsByTagName('I').item(0)) {
                var check = getNodeValue(getElementsByTagName('Content'));
                if (check == '1') {
                    window.location = window.location.href;
                } else {
                    obj.hide();
                }
            }
        },
        'onError': function (req) { }
    });
}

function pkeypress(e) {
    if (e.which != 8 && e.which != 0 && (e.which < 48 || e.which > 57)) {
        return false;
    }
}

function getrss() {
    var num = Math.floor(Math.random() * 999999);
    sLink = '/Tools/Ajax.aspx?cmd=getrss&rnd=' + num;

    AjaxRequest.get({
        'url': sLink,
        'onSuccess': function (req) {
            window.location.reload();
        },
        'onError': function (req) { }
    });
}

function updateMenuID(type, recordid, menuidup) {
    var obj = $('#Waiting,.hide');
    obj.show();
    var num = Math.floor(Math.random() * 999999);
    sLink = '/Tools/Ajax.aspx?cmd=updatemenuid' + '&type=' + type + '&recordid=' + recordid + '&menuidup=' + menuidup + '&rnd=' + num;

    AjaxRequest.get({
        'url': sLink,
        'onSuccess': function (req) {
            obj.hide();
        },
        'onError': function (req) { }
    });
}

function updateStatusOff(recordid, status) {
    var obj = $('#Waiting,.hide');
    obj.show();
    var num = Math.floor(Math.random() * 999999);
    sLink = '/Tools/Ajax.aspx?cmd=updateStatusOff' + '&recordid=' + recordid + '&status=' + status + '&rnd=' + num;

    AjaxRequest.get({
        'url': sLink,
        'onSuccess': function (req) {
            obj.hide();
        },
        'onError': function (req) { }
    });
}
