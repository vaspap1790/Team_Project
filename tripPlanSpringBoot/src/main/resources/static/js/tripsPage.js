

$(document).ready(function () {

const username="dimitris";
const trip_location="athina";

    const URL = "http://localhost:8080/tripPlan/accommodation/"+username+"/"+trip_location;

    async function init() {
        const datesAcco = await fetch(URL);
        const dates = await datesAcco.json();
        return dates;
    }
    init().then(function (data) {
        const checkin = new Date(data[0].checkin);
        const checkout =new Date( data[0].checkout);

        console.log(checkin);
        console.log(checkout);
        
    });
});

