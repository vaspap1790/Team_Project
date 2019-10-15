 $(document).ready(function () {
                $(".autocomplete").on("keyup", callRest);
            });

            function callRest() {
                var userinput = $(".autocomplete").val();
                
                $.ajax({
                    url: "city/" + userinput
                }).then(function (data) {
                    
                    $.each(data, function (i,json) {
                       let name= json.name;
                       let code=json.code;
                       console.log(name+" "+code)
                    });
                });
            }

