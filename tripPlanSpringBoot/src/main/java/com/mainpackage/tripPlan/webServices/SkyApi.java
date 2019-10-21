package com.mainpackage.tripPlan.webServices;

import com.mainpackage.tripPlan.model.Flight;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.time.LocalDate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;

@Component
public class SkyApi {

    public HttpResponse<String> oneWay(Flight f) throws UnirestException {

        HttpResponse<String> response = Unirest.get("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsedates/v1.0/GR/USD/en-US/" + f.getDestinationPlace() + "-sky/" + f.getOriginPlace() + "-sky/" + f.getOutboundDate())
                .header("x-rapidapi-host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .asString();

        return response;
    }

    public HttpResponse<String> roundTrip(Flight f,
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate inboundDate) throws UnirestException {
        HttpResponse<String> response = Unirest.get("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsedates/v1.0/GR/USD/en-US/"+f.getOriginPlace()+"-SKY/"+f.getDestinationPlace()+"-SKY/"+f.getOutboundDate()+"/"+inboundDate)
                .header("x-rapidapi-host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .asString();

        return response;
    }

    public HttpResponse<String> cities(String city) throws UnirestException {

        HttpResponse<String> response = Unirest.get("https://cometari-airportsfinder-v1.p.rapidapi.com/api/airports/by-text?text=" + city)
                .header("x-rapidapi-host", "cometari-airportsfinder-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .asString();

        return response;
    }
}
