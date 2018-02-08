function getNodeValue(o) {
    try {
        return o.item(0).firstChild.nodeValue;
    }
    catch (err) {
        return '';
    }
}

function sendContact(name, email, phone, title, content) {
    var num = Math.floor(Math.random() * 999999);
    sLink = '/Tools/Ajax.aspx?cmd=sendContact&name=' + name.value.trim() + '&email=' + email.value.trim() + '&phone=' + phone.value.trim() + '&title=' + title.value.trim() + '&content=' + content.value.trim() + '&rnd=' + num;
    showLoading('&nbsp;Đang gửi liên hệ...', 'lblLoad');

    AjaxRequest.get({
        'url': sLink,
        'onSuccess': function (req) {
            with (req.responseXML.getElementsByTagName("I").item(0)) {
                var sHtml = getNodeValue(getElementsByTagName("Content"));
                if (sHtml !== "") {
                    name.value = "";
                    email.value = "";
                    phone.value = "";
                    title.value = "";
                    content.value = "";
                    name.focus();
                    hideLoading();
                    alertSuccess(sHtml);
                    $("#closeAlert").click();
                }
            }
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
