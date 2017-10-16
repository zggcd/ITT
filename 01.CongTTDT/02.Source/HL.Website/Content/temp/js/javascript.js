$(document).ready(function () {
    var btn = document.getElementById("btnGuiLienHe");
    if (btn) {
        btn.onclick = function () {
            var name = document.getElementById("Name");
            var email = document.getElementById("Email");
            var phone = document.getElementById("Phone");
            var title = document.getElementById("Title");
            var content = document.getElementById("Content");
            var resultMess = validSendContact(name, email, phone, title, content);
            if (resultMess === "") {
                sendContact(name, email, phone, title, content);
            } else {
                loadAlert(resultMess);
            }
        };
    }
});

function validSendContact(name, email, phone, title, content) {
    var itemFocus = "", resultMess = "";

    if (name.value.trim() === "") {
        name.className += " inValidInput";
        if (itemFocus === "") {
            itemFocus = name;
            resultMess = "Bạn vui lòng nhập đầy đủ thông tin!";
        }
    } else {
        name.classList.remove("inValidInput");
    }

    if (email.value.trim() === "") {
        email.className += " inValidInput";
        if (itemFocus === "") {
            itemFocus = email;
            resultMess = "Bạn vui lòng nhập đầy đủ thông tin!";
        }
    } else {
        if (isValidEmail(email.value.trim()) === false) {
            email.className += " inValidInput";
            if (itemFocus === "") {
                itemFocus = email;
                resultMess = "Địa chỉ Email không hợp lệ, bạn vui lòng nhập lại!";
            }
        } else {
            email.classList.remove("inValidInput");
        }
    }

    if (phone.value.trim() === "") {
        phone.className += " inValidInput";
        if (itemFocus === "") {
            itemFocus = phone;
            resultMess = "Bạn vui lòng nhập đầy đủ thông tin!";
        }
    } else {
        phone.classList.remove("inValidInput");
    }

    if (title.value.trim() === "") {
        title.className += " inValidInput";
        if (itemFocus === "") {
            itemFocus = title;
            resultMess = "Bạn vui lòng nhập đầy đủ thông tin!";
        }
    } else {
        title.classList.remove("inValidInput");
    }

    if (content.value.trim() === "") {
        content.className += " inValidInput";
        if (itemFocus === "") {
            itemFocus = content;
            resultMess = "Bạn vui lòng nhập đầy đủ thông tin!";
        }
    } else {
        content.classList.remove("inValidInput");
    }

    if (itemFocus) {
        itemFocus.focus();
        return resultMess;
    } else {
        return "";
    }
}

// Code check Email hop le
function isValidEmail(email) {
    if (email === "") {
        return true;
    }
    var regex = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;

    if (!regex.test(email)) {
        return false;
    }

    return true;
}
