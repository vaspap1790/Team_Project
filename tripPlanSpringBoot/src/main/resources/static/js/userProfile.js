//Template code
//
//    var readURL = function (input) {
//        if (input.files && input.files[0]) {
//            var reader = new FileReader();
//
//            reader.onload = function (e) {
//                $('.avatar').attr('src', e.target.result);
//            };
//
//            reader.readAsDataURL(input.files[0]);
//        }
//    };
//
//
//    $(".file-upload").on('change', function () {
//        readURL(this);
//    });



// Angular
const App = angular.module("App", []);

App.controller("MainCtrl", function ($scope, $http) {
    angular.element(document).ready(async function () {
        const username= await document.getElementById("username").innerText.trim();
//        console.log(username);


//           Get Trips
        const getTripsURL =  "http://localhost:8080/tripPlan/trip/"+username;

        $http.get(getTripsURL)
                .then((response) => {
//                    console.log(response.data);
                    $scope.items = response.data;
                })
                .catch((error) => {
                    console.log(error);
                });


//           Delete Trip
    $scope.deleteItem = function (index,id) {
       
        //Delete from the list
        $scope.items.splice(index, 1);
        console.log(index,id);
        //Send to backend to delete it from db
        const deleteTripURL = "http://localhost:8080/tripPlan/tripPage/delete/"+id;
        
//        let object = {tripId:id};
//        let jsonObject = JSON.stringify(odject);
//        
//        $http.post(deleteTripURL,jsonObject)
//                .then(()=>{
//                     console.log("Id successfully sent to backend");
//                })
//                .catch((error)=>{
//                     console.log(error);
//                }); 
    };
    });
});



