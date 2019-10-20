$(document).ready(function () {

    $.ajax({
        type: "GET",
        url: "returnFlights",
        dataType: "json",
        success: function (flight) {
            
            console.log(flight);
         

        }

    });


});