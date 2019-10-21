$("input#city").keyup(function () {

const city = $("input#city").val();
        $("input#city").autocomplete({
source: function (request, response) {
$.ajax({
url: "flight/city/" + city,
        data: { query: request.term },
        success: function (data) {
        console.log(data);
                var transformed = $.map(data, function (el) {
                return {
                value:el.city_name + "," + el.country
                };
                });
                response(transformed);
        }
messages: {
noResults: 'no results',
        results: function(amount) {
        return amount + 'results.'
        }
});
        }
});
});
