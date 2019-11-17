let clickedBtn = null;

$(document).on("click", ".add", function (e) {
    console.log("click");
    clickedBtn = e;
});
//$(document).ready(function () {
//
//    $(".add").click(function (e) {
//        console.log("dsaads");
//    clickedBtn=e;
//    });
//
//});

//Handle photos
$('#formPhotos').click(function () {

    $(clickedBtn.currentTarget.parentElement).next().append("<a href='#'><i class='fas fa-camera-retro'></i></a>");
    var postData = new FormData($("#formPhotos")[0]);
    const URL = '';
    // $.ajax({
    //         type:'POST',
    //         url:URL,
    //         processData: false,
    //         contentType: false,
    //         data : postData,
    //         success:function(data){
    //           console.log("File Uploaded");
    //         },
    //         error: function(error){
    //             console.log(error); 
    //         }
    //      });
});

//Handle total Budget
$(".budget").change(function (e) {
    console.log(e);
    // let previous = parseInt($("#totalBudget").innerText);
    // previous.innerText = (previous + parseInt(this.innerText));

});

//Angular

const App = angular.module("App", []);
App.controller("MainCtrl", function ($scope, $http) {

    const username = document.getElementById("username").innerText.trim();
    const tripId = document.getElementById("tripId").innerText.trim();
    const dateArray = [];//dates
    const dummyDates = [];
    const flightDateArray = [];
    const flightDates = [];
    const notesArray = []; //array of notes
    const URL = "http://localhost:8080/tripPlan/tripPage/" + username + "/" + tripId;
    ///ean den exei accommodation ,petaei error...


    $http.get(URL)
            .then((response) => {
                const data = response.data;
                const accommodation = data.accommodation[0];
                const transportation = data.transportation;
                const notes = data.notes;
                $scope.location = data.location;

                const checkin = new Date(accommodation.checkin);
                const checkout = new Date(accommodation.checkout);
                const dates = getDates(checkin, checkout);

                //////////////////////////////
                dates.forEach(function (date) {
                    let formatedDate = formatDate(date.getFullYear() + "-" + (date.getMonth() + 1) + "-" + date.getDate());
                    dummyDates.push(date.getDate() + "/" + (date.getMonth() + 1));
                    dateArray.push(formatedDate);
                });
                //////////////////////////
                transportation.forEach(function (item, index) {
                    let date = new Date(transportation[index].departure.substring(0, 10));
                    flightDates.push(formatDate(date));
                });
                flightDates.forEach(function (date) {
                    flightDateArray.push(date);
                });
                ////////////////////////////
                notes.forEach(function (item, index) {
                    notesArray.push(item);//array of notes                 
                });
                console.log(dateArray);
                ////////////////
            }).catch((error) => {
        console.log(error);
    });


    $scope.dummyDates = dummyDates;
    $scope.dates = dateArray;
    $scope.totalBudget = 0;
    $scope.show = function (date) {

        return flightDateArray.includes(date);
    };
    $scope.currencyShow = function (index) {
        return !(document.querySelectorAll(".dayBudget")[index].innerText === '');
    };
    $scope.addPost = function () {

        const title = $("#postModal #postTitle").val().trim();
        const body = $("#postModal #postBody").val().trim();
        let object = {title: title, body: body, username: username, tripId: tripId};
        let jsonObject = JSON.stringify(object);
        console.log(jsonObject);
        const URL = "";
        // $http.post(URL,jsonObject)
        //     .then(()=>{
        //         console.log("Successfully sent the post");
        //     })
        //     .catch((error)=>{
        //         console.log(error);
        //     });
    };
    $scope.addNote = function (date,index) {
    console.log(date+" "+index);
//        $(clickedBtn.target.parentElement).next().append("<a href='#'><img id='notePhoto' src='https://icon-library.net/images/icon-note/icon-note-0.jpg'></a>");
        const title = $(`#notesModal${index} #noteTitle${index}`).val().trim();
        const body = $(`#notesModal${index} #noteBody${index}`).val().trim();
//        let unformatedDate = $(clickedBtn.target.previousElementSibling).text();
//        let finalDate = formatDate(unformatedDate);

        let object = {title: title, body: body, tripId: tripId, date: date};
        let jsonObject = JSON.stringify(object);
//        console.log(jsonObject);
        const URL = "http://localhost:8080/tripPlan/tripPage/saveNote";
        var req = {
            method: 'POST',
            url: URL,
            headers: {
                'Content-Type': 'application/json'
            },
            data: jsonObject
        };
        $http(req).then(function () {
            console.log("success");
        }).catch(() => {
            console.log("error");
        });
    };
    $scope.addBudget = function () {

        const budget = $("#budgetModal #budget").val().trim();
        $(clickedBtn.target.parentElement).next().children(":first").append(budget);
        $scope.totalBudget += parseInt(budget);
        let object = {dayBudget: budget, tripId: tripId, date: "2019-11-21"};
        let jsonObject = JSON.stringify(object);
        console.log(jsonObject);
        const URL = "http://localhost:8080/tripPlan/tripPage/saveBudget";
        var req = {
            method: 'POST',
            url: URL,
            headers: {
                'Content-Type': 'application/json'
            },
            data: jsonObject
        };
        $http(req).then(function () {
            console.log("success");
        }).catch(() => {
            console.log("error");
        });
    };

//    $scope.showNotes = function () {
//        dateArray.forEach(function (date, i1) {
//            let date1 = new Date(date);
//            notesArray.forEach(function (note, i2) {
//                let date2 = new Date(note.date);
//                if (date1.getTime() === date2.getTime()) {
//                    console.log("true");
//                    $("#note" + i1).append(`<a href='#' data-toggle="modal" data-target="#notesModal${note.id}"
//                     id='${note.id}'><img id='notePhoto' src='https://icon-library.net/images/icon-note/icon-note-0.jpg'> </a>`);
//                }
//            });
//        });
//    };
    $scope.showNoteBetta = function (date,index) {
        console.log(date+" "+index);
        console.log("aaa"+date);
    };



});








var getDates = function (startDate, endDate) {
    var dates = [],
            currentDate = startDate,
            addDays = function (days) {
                var date = new Date(this.valueOf());
                date.setDate(date.getDate() + days);
                return date;
            };
    while (currentDate <= endDate) {
        dates.push(currentDate);
        currentDate = addDays.call(currentDate, 1);
    }
    return dates;
};
function formatDate(date) {
    var d = new Date(date),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

    if (month.length < 2)
        month = '0' + month;
    if (day.length < 2)
        day = '0' + day;

    return [year, month, day].join('-');
}