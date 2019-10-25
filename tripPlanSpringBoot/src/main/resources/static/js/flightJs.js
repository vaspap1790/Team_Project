

$(document).ready(function () {
    $(".autocomplete").keyup(function () {

        const city = $(this).val().trim();
        ///////////////////////////////////Autocomplete for skyscanner/////////
        $(this).autocomplete({
            source: function (request, response) {
                $.ajax({
                    url: "city/" + city,
                    data: {query: request.term},
                    success: function (data) {
                        var transformed = $.map(data, function (el) {
                            return {
                                label: el.city + "," + el.countryCode + "(" + el.code + ")",
                                value: el.city + "," + el.countryCode + "(" + el.code + ")"
                            };
                        });
                        response(transformed.slice(0, 10));
                    }
                });
            },
            position: { my: "left bottom", at: "left top"}
            ,
            autoFocus: true,
            select: function (event, ui) {

                const regExp = /\(([^)]+)\)/;
                const matches = regExp.exec(ui.item.value);
                const iata = matches[1];
                $(this).next().val(iata);             
            },
            minLength: 2
            
        });
    });

                            /////////disable form submit on enter
$('#flightForm').on('keyup keypress', function(e) {
  var keyCode = e.keyCode || e.which;
  if (keyCode === 13) { 
    e.preventDefault();
    return false;
  }
  });
  /////////roundtrip oneway//////////

  
  $("#butt2").change(function(){
      $("#return").removeClass("d-none");
      $("#inboundDate").prop('required',true);
  });
  
 $("#butt1").change(function(){
      $("#return").addClass("d-none");
      $("#inboundDate").removeProp("required");
 
  });



});