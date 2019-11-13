

$(document).ready(function () {

    const username = "dimitris";
    const trip_id = "3";
    const dateArray = [];
    const URL = "http://localhost:8080/tripPlan/accommodation/" + username + "/" + trip_id;

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