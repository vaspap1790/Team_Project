
const username = $("#username");
const tripId = $("#tripId");
let clickedBtn = null;

//Handle photos
$('#formPhotos').click(function () {

    $(clickedBtn.currentTarget.parentElement).next().append("<a href='#'><img id='photosPhoto' src='https://gitlab.gnome.org/uploads/-/system/project/avatar/295/gnome-photos.png'></a>");

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

})


$(document).ready(function () {

const username="dimitris";
const trip_id="3";
const dateArray = [];
    const URL = "http://localhost:8080/tripPlan/accommodation/"+username+"/"+trip_id;


    async function dates() {
        const datesAcco = await fetch(URL);
        const dates = await datesAcco.json();
        return dates;
    }
    dates().then(function (data) {
        const checkin = new Date(data[0].checkin);
        const checkout = new Date(data[0].checkout);
        console.log(checkin);
        console.log(checkout);

        var dates = getDates(checkin, checkout);
        dates.forEach(function (date) {          
            dateArray.push(date.getMonth() + "/" + date.getDate());
        });
    }).then(function(){
        console.log(dateArray);////////////////////////////
    });
        
    
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

   while (currentDate <= endDate) {
       dates.push(currentDate);
       currentDate = addDays.call(currentDate, 1);
   }
   return dates;
};
    
        $(".add").click(function (e) {
        clickedBtn = e;
    }); 
});

//Angular

const App = angular.module("App", []);

App.controller("MainCtrl", function ($scope, $http) {

    $scope.addPost = function () {

        const title = $("#postModal #postTitle").val().trim();
        const body = $("#postModal #postBody").val().trim();

        let object = { title: title, body: body, username: username, tripId: tripId };
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

    $scope.addNote = function () {

        $(clickedBtn.currentTarget.parentElement).next().append("<a href='#'><img id='notePhoto' src='https://icon-library.net/images/icon-note/icon-note-0.jpg'></a>");

        const title = $("#notesModal #noteTitle").val().trim();
        const body = $("#notesModal #noteBody").val().trim();

        let object = { title: title, body: body, username: username, tripId: tripId };
        let jsonObject = JSON.stringify(object);
        console.log(jsonObject);
        const URL = "";

        // $http.post(URL,jsonObject)
        //     .then(()=>{
        //         console.log("Successfully sent the note");
        //     })
        //     .catch((error)=>{
        //         console.log(error);
        //     });
    };

    $scope.addBudget = function () {

        const budget = $("#budgetModal #budget").val().trim();

        $(clickedBtn.currentTarget.parentElement).next().append(budget + '&euro;');

        let object = { dayBudget: budget, username: username, tripId: tripId };
        let jsonObject = JSON.stringify(object);
        console.log(jsonObject);
        const URL = "";

        // $http.post(URL,jsonObject)
        //     .then(()=>{
        //         console.log("Successfully sent the daybudget");
        //     })
        //     .catch((error)=>{
        //         console.log(error);
        //     });
    };

});
