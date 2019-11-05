package com.mainpackage.tripPlan.webServices;


import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.time.LocalDate;
import org.springframework.stereotype.Component;


@Component
public class BookingApi {



    public HttpResponse<String>propertiesList(String dest_id,LocalDate checkin,LocalDate checkout,String guests) throws UnirestException {
        HttpResponse<String> response = Unirest.get("https://apidojo-booking-v1.p.rapidapi.com/properties/list?price_filter_currencycode=USD&travel_purpose=leisure&categories_filter=price%3A%3A9-40%2Cfree_cancellation%3A%3A1%2Cclass%3A%3A1%2Cclass%3A%3A0%2Cclass%3A%3A2&search_id=none&order_by=popularity&children_qty=2&languagecode=en-us&children_age=5%2C7&search_type=city&offset=30&dest_ids="+dest_id+"&guest_qty="+guests+"&arrival_date="+checkin+"&departure_date="+checkout+"&room_qty=1")
                .header("x-rapidapi-host", "apidojo-booking-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "755b00a104msh85506be4fa8861dp10f6abjsn986404c91cd5")
                .asString();
        return response;
        
    }
    
}
