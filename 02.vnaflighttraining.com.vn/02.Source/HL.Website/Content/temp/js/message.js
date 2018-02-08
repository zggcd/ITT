//Ham hien thi tin nhan thong bao
function alertSuccess(mess) {
    // Get the snackbar DIV
    var x = document.getElementById("snackbar");
    x.innerHTML = mess;

    // Add the "show" class to DIV
    x.className = "show";

    // After 3 seconds, remove the show class from DIV
    setTimeout(function () { x.className = x.className.replace("show", ""); }, 6000);
}

//Ham hien thi loading
function showLoading(mes, lblLoad) {
    var x = document.getElementById("loading");
    var lblLoad = document.getElementById("lblLoad");
    lblLoad.innerHTML = mes;
    x.style.display = "inline";
}

//Ham an loading
function hideLoading() {
    var x = document.getElementById("loading");
    x.style.display = "none";
}

//Ham load alert
function loadAlert(resultMess) {
    var alert = document.getElementById("alert");
    var lblWarning = document.getElementById("lblWarning");
    lblWarning.innerHTML = resultMess;
    alert.style.display = "block";
    alert.style.opacity = "1";

    var close = document.getElementsByClassName("closebtn");
    var i;

    for (i = 0; i < close.length; i++) {
        close[i].onclick = function () {
            var div = this.parentElement;
            div.style.opacity = "0";
            setTimeout(function () { div.style.display = "none"; }, 600);
        }
    }
}
