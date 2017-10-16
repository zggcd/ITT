$(document).ready(function () {
});

function validSendContact(name, email, title, content) {
    var itemFocus = "", resultMess = "";

    if (name.value.trim() === "") {
        name.className += " inValidInput";
        if (itemFocus === "") {
            itemFocus = name;
            resultMess = "Bạn vui lòng nhập đầy đủ thông tin bắt buộc!";
        }
    } else {
        name.classList.remove("inValidInput");
    }

    if (email.value.trim() === "") {
        email.className += " inValidInput";
        if (itemFocus === "") {
            itemFocus = email;
            resultMess = "Bạn vui lòng nhập đầy đủ thông tin bắt buộc!";
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

    if (title.value.trim() === "") {
        title.className += " inValidInput";
        if (itemFocus === "") {
            itemFocus = title;
            resultMess = "Bạn vui lòng nhập đầy đủ thông tin bắt buộc!";
        }
    } else {
        title.classList.remove("inValidInput");
    }

    var s = CKEDITOR.instances.Content.getData();
    if (s.trim() === "") {
        content.className += " inValidInput";
        if (itemFocus === "") {
            itemFocus = content;
            resultMess = "Bạn vui lòng nhập nội dung góp ý!";
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

function fnOnchangeFiles(evt) {
    var nBytes = 0,
        oFiles = evt.target.files,
        nFiles = oFiles.length;
    var fileCurr = $(".thumb");
    if ((nFiles + fileCurr.length) > 3) {
        alert('Có quá nhiều file được chọn (Tối đa: 3)');
        return;
    }

    for (var nFileId = 0; nFileId < nFiles; nFileId++) {
        nBytes += oFiles[nFileId].size;
    }

    for (var i = 0; i < fileCurr.length; i++) {
        var size = $(fileCurr[i]).attr('data-size');
        nBytes += size*1;
    }

    var sOutput = (nBytes / 1024 / 1024).toFixed(2);
    if (sOutput > 20) {
        alert('Các file được chọn đã vượt quá dung lượng cho phép (' + sOutput + 'MB > 20.0MB');
        return;
    }

    for (var i = 0, f; f = oFiles[i]; i++) {
        var reader = new FileReader();

        reader.onload = (function (theFile) {
            return function (e) {
                var span = document.createElement('p');
                span.className = "thumb-block";
                span.innerHTML = ['<span class="del-img" title="Xóa file" onclick="javascript: $(this).parent().remove();">x</span><span class="thumb" data="', e.target.result, '" data-size="', theFile.size, '" title="', theFile.name, '" style="width: auto;">', theFile.name, '</span><br />'].join('');
                document.getElementById('listFile').appendChild(span, null);
            };
        })(f);

        reader.readAsDataURL(f);
    }
}

function updateSize() {
    var nBytes = 0,
        oFiles = document.getElementById("uploadInput").files,
        nFiles = oFiles.length;
    for (var nFileId = 0; nFileId < nFiles; nFileId++) {
        nBytes += oFiles[nFileId].size;
    }
    var sOutput = nBytes + " bytes";
    // optional code for multiples approximation
    for (var aMultiples = ["KiB", "MiB", "GiB", "TiB", "PiB", "EiB", "ZiB", "YiB"], nMultiple = 0, nApprox = nBytes / 1024; nApprox > 1; nApprox /= 1024, nMultiple++) {
        sOutput = nApprox.toFixed(3) + " " + aMultiples[nMultiple] + " (" + nBytes + " bytes)";
    }
    // end of optional code
    document.getElementById("fileNum").innerHTML = nFiles;
    document.getElementById("fileSize").innerHTML = sOutput;
}

function sendFile(file) {
    var uri = "/index.php";
    var xhr = new XMLHttpRequest();
    var fd = new FormData();

    xhr.open("POST", uri, true);
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4 && xhr.status == 200) {
            alert(xhr.responseText); // handle response.
        }
    };
    fd.append('myFile', file);
    // Initiate a multipart/form-data upload
    xhr.send(fd);
}
