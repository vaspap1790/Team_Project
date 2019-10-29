$(document).ready(function () {

    $(".autocomplete").keyup(function () {

        const city = $(this).val().trim();

        $(this).autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "http://api.geonames.org/search?name_startsWith=" + city + "&username=dimitris&type=json&cities='cities15000'",
                    data: {query: request.term},
                    success: function (data) {
                        const geo = data.geonames;

                        var transformed = $.map(geo, function (el) {
                            return {
                                label: el.toponymName + "," + el.countryName,
                                value: el.toponymName + "," + el.countryName
                            };
                        });
                        response(transformed.slice(0, 7));
                    }
                });
            },
            position: {my: "left bottom", at: "left top"}
            ,
            select: function (event, ui) {

                const regex = /^(.+?),/;
                const result = regex.exec(ui.item.value);
                const result_city = result[1];
                var settings = {
                    "async": true,
                    "crossDomain": true,
                    "url": "https://apidojo-booking-v1.p.rapidapi.com/locations/auto-complete?languagecode=en-us&text=" + result_city,
                    "method": "GET",
                    "headers": {
                        "x-rapidapi-host": "apidojo-booking-v1.p.rapidapi.com",
                        "x-rapidapi-key": "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e"
                    }
                };

                $.ajax(settings).done(function (response) {

                    console.log(response);
                    const img_city = response[0].image_url;
                    const dest_id = response[0].dest_id;
                    $("#dest_id").val(dest_id);
                    $("#cityImg").html(`<img src="${img_city}">`);

                });

            },
            minLength: 2,
            autoFocus: true,
            delay: 0

        });
    });

////////////////AJAX for booking/////////////




    /////////disable form submit on enter
    $('#city1').on('keyup keypress', function (e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
    });

});