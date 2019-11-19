let clickedBtn = null;

//$(document).on("click", ".add", function (e) {
//    console.log("click");
//    clickedBtn = e;
//});
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
App.controller("MainCtrl", function ($scope, $http,$timeout) {

    const username = document.getElementById("username").innerText.trim();
    const tripId = document.getElementById("tripId").innerText.trim();
    const dateArray = [];//dates
    const dummyDates = [];
    const flightDateArray = [];
    const flightDates = [];
    const notesArray = []; //array of notes
    const budgetArray = [];
    const URL = "http://localhost:8080/tripPlan/tripPage/" + username + "/" + tripId;
    ///ean den exei accommodation ,petaei error...
    $http.get(URL)
            .then((response) => {
                const data = response.data;
                const accommodation = data.accommodation[0];
                const transportation = data.transportation;
                const notes = data.notes;
                $scope.location = data.location;
                const dailyBudget = data.dailyBudget;

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
                ////////////////
                dailyBudget.forEach(function (budget) {
                    budgetArray.push(budget);
                });
            }).catch((error) => {
        console.log(error);
    });

    $scope.budgetArray = budgetArray;
    $scope.dummyDates = dummyDates;
    $scope.dates = dateArray;
    $scope.totalBudget = 0;

    $scope.printBudget = function () {
        budgetArray.forEach(function (bd_date, index1) {
            dateArray.forEach(function (date, index2) {
                if (bd_date.date === date) {
                    $(`#dayBudget${date}`).text(bd_date.dayBudget);
                }
            });
        });
    };
    $scope.show = function (date) {

        return flightDateArray.includes(date);
    };
    $scope.currencyShow = function (index) {
        return !(document.querySelectorAll(`.dayBudget${index}`)[index].innerText === '');
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
    $scope.addNote = function (date, index) {
        console.log(date, index);

        const title = $(`#notesModal${date} #noteTitle${date}`).val().trim();
        const body = $(`#notesModal${date} #noteBody${date}`).val().trim();

        let object = {title: title, body: body, tripId: tripId, date: date};
        let jsonObject = JSON.stringify(object);
        const URL = "http://localhost:8080/tripPlan/tripPage/saveNote";
        var req = {
            method: 'POST',
            url: URL,
            headers: {
                'Content-Type': 'application/json'
            },
            data: jsonObject
        };
        $http(req).then(function (response) {
            console.log("success");
        }).catch(() => {
            console.log("error");
        });
    };
    $scope.addBudget = function (date, index) {

        const budget = $(`#budgetModal${index} #budget${index}`).val().trim();
        $(`#dayBudget${index}`).text(budget);
        $scope.totalBudget += parseInt(budget);
        let object = {dayBudget: budget, tripId: tripId, date: date};
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
        $http(req).then(function (response) {
            console.log(response);
        }).catch(() => {
            console.log("error");       
        });
    };
    $scope.showNote = function (index, date) {

        let URL = `http://localhost:8080/tripPlan/tripPage/getNotes/${tripId}/${date}`;
        $http.get(URL)
                .then((response) => {
                    if (typeof response.data[0].date !== 'undefined') {
                        let date = response.data[0].date;
                    }
                    console.log(response.data);
                    if (typeof date !== 'undefined' && typeof response.data[0].title !== 'undefined') {
                        $(`#notesModal${date} #noteTitle${date}`).val(response.data[0].title);
                    }
                    if (typeof date !== 'undefined' && typeof response.data[0].body !== 'undefined') {
                        $(`#notesModal${date} #noteBody${date}`).val(response.data[0].body);
                    }
                }).catch(() => {
            console.log("No data");
        });
    };
    $scope.showNotes= function ( date){
        notesArray.forEach(function(note,index){           
            if (note.date===date){
                return true;
            }
        });
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