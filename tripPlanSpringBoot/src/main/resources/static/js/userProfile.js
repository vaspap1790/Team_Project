
const username = $("#username");

//Template code
$(document).ready(function () {


    var readURL = function (input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                $('.avatar').attr('src', e.target.result);
            }

            reader.readAsDataURL(input.files[0]);
        }
    }


    $(".file-upload").on('change', function () {
        readURL(this);
    });



//    const URL1 = "http://localhost:8080/tripPlan/trip/" + username;
//
//    async function trip() {
//        const datesAcco = await fetch(URL1);
//        const dates = await datesAcco.json();
//        return dates;
//    }
//    trip().then(function (data) {
//
//        console.log(data);
//    });


    alert("Hello");

});


// Angular
const App = angular.module("App", []);

App.controller("MainCtrl", function ($scope, $http) {

//           Get Trips
    const getTripsURL = "http://localhost:8080/tripPlan/trip/" + username;

    $http.get(getTripsURL)
            .then((response)=> {
                console.log(response.data);
                $scope.items = response.data;
            })
            .catch((error)=>{
                console.log(error);
                    });


//           Delete Trip
    $scope.deleteItem = function (index,item.id) {
       
        //Delete from the list
        $scope.items.splice(index, 1);
        
        //Send to backend to delete it from db
        const deleteTripURL = "";
        
        let object = {tripId:item.id};
        let jsonObject = JSON.stringify(odject);
        
        $http.post(deleteTripURL,jsonObject)
                .then(()=>{
                     console.log("Id successfully sent to backend");
                })
                .catch((error)=>{
                     console.log(error);
                }); 
    };

});



