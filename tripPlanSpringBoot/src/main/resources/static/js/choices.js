$(document).ready(function () {

//    $(".autocomplete").keyup(function () {
//
//        const city = $(this).val().trim();
//
//        $(this).autocomplete({
//            source: function (request, response) {
//                $.ajax({
//                    url: "http://api.geonames.org/search?name_startsWith=" + city + "&username=dimitris&type=json&cities='cities15000'",
//                    data: {query: request.term},
//                    success: function (data) {
//                        const geo = data.geonames;
//
//                        var transformed = $.map(geo, function (el) {
//                            return {
//                                label: el.toponymName + "," + el.countryName,
//                                value: el.toponymName + "," + el.countryName
//                            };
//                        });
//                        response(transformed.slice(0, 7));
//                    }
//                });
//            },
//            position: {my: "left bottom", at: "left top"}
//            ,
//            minLength: 2,
//            autoFocus: true,
//            delay: 0
//
//        });
//    });

////////////////AJAX for booking/////////////

    /////////disable form submit on enter
    $('#location').on('keyup keypress', function (e) {
        var keyCode = e.keyCode || e.which;
        if (keyCode === 13) {
            e.preventDefault();
            return false;
        }
    });

});