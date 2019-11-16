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
App.controller("MainCtrl", async function ($scope, $http) {

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

    const username = await document.getElementById("username").innerText.trim();
    const tripId = await document.getElementById("tripId").innerText.trim();

    const dateArray = [];
    const flightDateArray = [];
    
    const URL = "http://localhost:8080/tripPlan/tripPage/" + username + "/" + tripId;
    ///ean den exei accommodation ,petaei error...
    $http.get(URL)
            .then((response) => {
                const data = response.data;
                const accommodation = data.accommodation[0];
                const transportation = data.transportation[0];

                const checkin = new Date(accommodation.checkin);
                const checkout = new Date(accommodation.checkout);
                const dates = getDates(checkin, checkout);
                dates.forEach(function (date) {
                    dateArray.push(date.getDate() + "/" + date.getMonth());
                });


                const departure = new Date(transportation.departure.substring(0, 10));
                const arrival = new Date(transportation.arrival.substring(0, 10));
                const flightDates = [departure, arrival];
                flightDates.forEach(function (date) {
                    flightDateArray.push(date.getDate() + "/" + date.getMonth());
                    console.log(flightDateArray);
                });


            }).catch((error) => {
        console.log(error);
    });

    $scope.dates = dateArray;
    $scope.flightDates = flightDateArray;
    $scope.commonDates = $scope.flightDates.filter(value => $scope.dates.includes(value));

    $scope.totalBudget = 0;



    $scope.show = function (date, commonDates) {
        return commonDates.includes(date);
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

    $scope.addNote = async function () {

        await $(clickedBtn.target.parentElement).next().append("<a href='#'><img id='notePhoto' src='https://icon-library.net/images/icon-note/icon-note-0.jpg'></a>");
        const title = $("#notesModal #noteTitle").val().trim();
        const body = $("#notesModal #noteBody").val().trim();
        let object = {title: title, body: body, tripId: tripId, date: "2019-11-21"};
        let jsonObject = JSON.stringify(object);
        console.log(jsonObject);
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
});










//    dates().then(function (data) {
//        const checkin = new Date(data[0].checkin);
//        const checkout = new Date(data[0].checkout);
//        console.log(checkin);
//        console.log(checkout);
//        const dates = getDates(checkin, checkout);
//        dates.forEach(function (date) {
//            dateArray.push(date.getDate() + "/" + date.getMonth() + "/" + date.getYear());
//        });
//    }).then(function () {
//        console.log(dateArray);
//    });

//    async function dates() {
//        const datesAcco = await fetch(URL);
//        const dates = await datesAcco.json();
//        return dates;
//    }