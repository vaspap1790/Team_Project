let username;
let userId;

document.addEventListener("DOMContentLoaded", function (event) {

    const URL = "http://localhost:8080/tripPlan/user/getUser";
    async function init() {
        const user = await fetch(URL);
        const userJson = await user.json();
        return userJson;
    }

    init().then((res) => {
        username = res.username;
        userId = res.userId;
    });

    function readURL(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result);
            };

            reader.readAsDataURL(input.files[0]);
        }
    }

    $("#singleFileUploadInput").change(function () {
        readURL(this);
    });
});

var singleUploadForm = document.querySelector('#singleUploadForm');
var singleFileUploadInput = document.querySelector('#singleFileUploadInput');
var singleFileUploadError = document.querySelector('#singleFileUploadError');
var singleFileUploadSuccess = document.querySelector('#singleFileUploadSuccess');


function  uploadSingleFile(file) {


    var formData = new FormData();
    formData.append("file", file);
//    formData.append("userId", userId);

    var xhr = new XMLHttpRequest();
    xhr.open("POST", "http://localhost:8080/tripPlan/uploadFile");

    xhr.onload = function () {
        console.log(xhr.responseText);
        var response = JSON.parse(xhr.responseText);
        if (xhr.status === 200) {
            singleFileUploadError.style.display = "none";
            singleFileUploadSuccess.innerHTML = "<p>File Uploaded Successfully.</p>";
            singleFileUploadSuccess.style.display = "block";
        } else {
            singleFileUploadSuccess.style.display = "none";
            singleFileUploadError.innerHTML = (response && response.message) || "Some Error Occurred";
        }
    };

    xhr.send(formData);
}




singleUploadForm.addEventListener('submit', function (event) {

    var files = singleFileUploadInput.files;
    if (files.length === 0) {
        singleFileUploadError.innerHTML = "Please select a file";
        singleFileUploadError.style.display = "block";
    }
    uploadSingleFile(files[0]);

    event.preventDefault();
}, true);




