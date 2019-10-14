
package com.mainpackage.tripPlan.webServices;

import com.mainpackage.tripPlan.model.Flight;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import java.util.Date;
import java.util.List;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Component;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Component
public class SkyApi {
    
    final static String KEY = "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e";
    
     public String CreateSession(Flight f,@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date inboundDate) throws IOException, UnirestException {
         
       
         
        HttpResponse<JsonNode> response = Unirest.post("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/v1.0")
                .header("X-RapidAPI-Host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com")
                .header("X-RapidAPI-Key", KEY)
                .header("Content-Type", "application/x-www-form-urlencoded")
                .field("inboundDate",inboundDate)
                .field("cabinClass", f.getCabinClass())
                .field("children", 0)
                .field("infants", 0)
                .field("country",f.getCountry())
                .field("currency", f.getCurrency())
                .field("locale", f.getLocale())
                .field("originPlace", f.getOriginPlace()+"-sky")
                .field("destinationPlace",f.getDestinationPlace() +"-sky")
                .field("outboundDate",f.getOutboundDate())
                .field("adults",f.getAdults())
                .asJson();
         System.out.println(response.getHeaders());
        List session = response.getHeaders().get("Location");
        String[] ar = session.get(0).toString().split("/");
        String sessionKey = ar[ar.length - 1];

        return sessionKey;
    }
    
       public JsonNode SessionResults(String sessionKey) throws UnirestException {

        HttpResponse<JsonNode> response = Unirest.get("https://skyscanner-skyscanner-flight-search-v1.p.rapidapi.com/apiservices/pricing/uk2/v1.0/" + sessionKey + "?pageIndex=0&pageSize=10")
                .header("X-RapidAPI-Host", "skyscanner-skyscanner-flight-search-v1.p.rapidapi.com")
                .header("X-RapidAPI-Key", KEY)
                .asJson();
   
        JsonNode Json = response.getBody();

        return Json;
    }
    
}
