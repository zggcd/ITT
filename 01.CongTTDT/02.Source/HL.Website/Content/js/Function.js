function getNodeValue(o) {
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
