package com.mainpackage.tripPlan.webServices;

import com.mainpackage.tripPlan.model.Flight;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Component;

@Component
public class SkyApi {

    public HttpResponse<String> cities(String city) throws UnirestException {

        HttpResponse<String> response = Unirest.get("https://cometari-airportsfinder-v1.p.rapidapi.com/api/airports/by-text?text=" + city)
                .header("x-rapidapi-host", "cometari-airportsfinder-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .asString();

        return response;
    }

    public void createSession(Flight f, HttpSession hs, @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate inboundDate) throws IOException, UnirestException {
        String sessionKey = null;
        HttpResponse<String> response = Unirest.post("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0")
                .header("X-RapidAPI-Host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com")
                .header("X-RapidAPI-Key", "7b289bfc4emsh8f06189af10e8a3p1ef94cjsnd2fffd899a1b")
                .header("Content-Type", "application/x-www-form-urlencoded")
                .field("inboundDate", inboundDate)
                .field("cabinClass", "economy")
                .field("children", 0)
                .field("infants", 0)
                .field("country", "GR")
                .field("currency", "USD")
                .field("locale", "en-US")
                .field("originPlace", f.getOriginPlace() + "-sky")
                .field("destinationPlace", f.getDestinationPlace() + "-sky")
                .field("outboundDate", f.getOutboundDate())
                .field("adults", 1)
                .asString();
        try {
            List session = response.getHeaders().get("Location");

            String[] ar = session.get(0).toString().split("/");
            sessionKey = ar[ar.length - 1];
            System.out.println("------"+sessionKey);
            hs.setAttribute("sessionKey", sessionKey);

        } catch (Exception e) {
            System.out.println("session key is null");
            e.printStackTrace();
        }
    }

    public HttpResponse<String> sessionResults(String sessionKey) throws UnirestException {
        HttpResponse<String> response = Unirest.get("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/uk2/v1.0/" + sessionKey + "?pageIndex=0&pageSize=10")
                .header("X-RapidAPI-Host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com")
                .header("X-RapidAPI-Key", "7b289bfc4emsh8f06189af10e8a3p1ef94cjsnd2fffd899a1b")
                .asString();

        return response;
    }
}
