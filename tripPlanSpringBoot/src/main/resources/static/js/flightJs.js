 $(document).ready(function () {
                $(".autocomplete").on("keyup", callRest);
            });

            function callRest() {
                var userinput = $(this).val();  //skasei sto k e n o
              let city=  $.trim(userinput);  
                
                $.ajax({
                    url: "city/" + city
                }).then(function (data) {
                    
                    $.each(data, function (i,json) {
                       let name= json.name;
                       let code=json.code;
                       console.log(name+" "+code);
                    });
                });
            }

