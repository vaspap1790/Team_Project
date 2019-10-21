/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


$("input#city").keyup(function () {

    const city = $("input#city").val();

    $("input#city").autocomplete({
    source: function (request, response) {
        $.ajax({
            url: "booking/city/"+city,
            data: { query: request.term },
            success: function (data) {
                console.log(data);
                var transformed = $.map(data, function (el) {
                    return {
                        label: el.country
                        
                        
                    };
                });
                response(transformed);
            },
            error: function () {
                response([]);
             }
        });
    } 
});
});

// $(document).ready(function () {
//
//                
//                $.ajax({
//                    url: "booking/city/athens" 
//                }).then(function (data) {
//                    
//                    $.each(data, function (i,json) {
//                     let country=json.country;
//                     let dest_id=json.dest_id;
//                     let city=json.name;
//                       console.log("country= "+country+",city= "+city,",\n\
//dest id= ",dest_id);
//                       
//                    });
//                });
//            
//            });
