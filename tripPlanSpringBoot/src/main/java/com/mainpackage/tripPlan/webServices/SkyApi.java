package com.mainpackage.tripPlan.webServices;

import com.mainpackage.tripPlan.model.Flight;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.util.*;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

@Component
public class SkyApi {

    final static String KEY = "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e";

//    public String CreateSession(String originPlace, String destinationPlace, String cabinClass,
//            int adults, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate inboundDate, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate outboundDate) throws IOException, UnirestException {
//
//        HttpResponse<JsonNode> response = Unirest.post("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0")
//                .header("X-RapidAPI-Host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com")
//                .header("X-RapidAPI-Key", KEY)
//                .header("Content-Type", "application/x-www-form-urlencoded")
//                .field("inboundDate", inboundDate)///
//                .field("cabinClass", cabinClass)///
//                .field("children", 0)
//                .field("infants", 0)
//                .field("country", "GR")
//                .field("currency", "USD")
//                .field("locale", "en-US")
//                .field("originPlace", originPlace + "-sky")//
//                .field("destinationPlace", destinationPlace + "-sky")//
//                .field("outboundDate", outboundDate)
//                .field("adults", adults)
//                .asJson();
//
//        List session = response.getHeaders().get("Location");
//
//        if (session == null) {
//            return null;
//        }
//
//        String[] ar = session.get(0).toString().split("/");
//        String sessionKey = ar[ar.length - 1];
//
//        return sessionKey;
//    }

    public String SessionResults(String sessionKey) throws UnirestException {

        HttpResponse<String> response = Unirest.get("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/uk2/v1.0/" + sessionKey + "?pageIndex=0&pageSize=10")
                .header("X-RapidAPI-Host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com")
                .header("X-RapidAPI-Key", KEY)
                .asString();

        String flightsJson = response.getBody();

        return flightsJson;
    }

    public HttpResponse<String> browseFlights(Flight f,
            @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate inboundDate) throws UnirestException {

        HttpResponse<String> response = Unirest.get("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/browsedates/v1.0/GR/USD/en-US/" + f.getDestinationPlace() + "-sky/" + f.getOriginPlace() + "-sky/" + f.getOutboundDate())
                .header("x-rapidapi-host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .queryString("inboundpartialdate",inboundDate)
                .asString();
        
//        String result = response.getBody();
  

        return response;
    }


}
