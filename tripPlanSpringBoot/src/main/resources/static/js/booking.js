$(document).ready(function () {

    $(".autocomplete").keyup(function () {

        const city = $(this).val().trim();

        $(this).autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "http://api.geonames.org/search?name_startsWith=" + city + "&username=dimitris&type=json&cities='cities15000'",
                    data: {query: request.term},
                    success: function (data) {
                        
                       const geo= data.geonames;
                 
                        var transformed = $.map(geo, function (el) {
                            return {
                                label: el.toponymName+","+el.countryName,
                                value: el.toponymName+","+el.countryName
                            };
                        });
                        response(transformed.slice(0, 7));
                    }
                });
            }
            ,
            select: function (event, ui) {
                final_city = $(this).val();

            },
            minLength: 2
        });
    });





});