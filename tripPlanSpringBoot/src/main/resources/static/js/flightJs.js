
$(".autocomplete").keyup(function () {

    const city = $(this).val();
    $(this).autocomplete({
        source: function (request, response) {
            $.ajax({
                url: "city/" + city,
                data: {query: request.term},
                success: function (data) {

                    var transformed = $.map(data, function (el) {

                        return {
                            value: el.city + "," + el.countryCode + "(" + el.code + ")"
                            
                        };
                    });
                    response(transformed);
                }
            });
        },
        select: function (event, ui) {
            $(this).text(ui.value);
            const regExp = /\(([^)]+)\)/;
            const matches = regExp.exec(ui.item.value);
                    const iata=matches[1];

            return false;
        }, 
        minLength: 2
    });
});






// // $(document).ready(function () {
//                $(".autocomplete").on("keyup", callRest);
//            });
//
//            function callRest() {
//                var userinput = $(this).val();  //skasei sto k e n o
//              let city=  $.trim(userinput);  
//                
//                $.ajax({
//                    url: "city/" + city
//                }).then(function (data) {
//                    
//                    $.each(data, function (i,json) {
//                       let name= json.name;
//                       let code=json.code;
//                       console.log(name+" "+code);
//                    });
//                });
//            }

