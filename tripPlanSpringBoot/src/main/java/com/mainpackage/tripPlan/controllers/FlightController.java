package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Esky;
import com.mainpackage.tripPlan.model.Flight;
import com.mainpackage.tripPlan.webServices.SkyApi;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URI;
import java.net.URISyntaxException;
import java.time.LocalDate;
import java.util.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "flight/")
public class FlightController {

    @Autowired
    SkyApi sky;

    @GetMapping(value = "register")
    public String preFlightForm(ModelMap m) {
        m.addAttribute("flight", new Flight());
        return "flightForm";
    }

    @PostMapping(value = "postRegister")
    public String postFlight(@ModelAttribute("flight") Flight flight, RedirectAttributes redirectAttrs,
            @RequestParam(name = "inboundDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate inboundDate) throws IOException, UnirestException {
       
        String sessionKey = sky.CreateSession(flight, inboundDate);

        if (sessionKey == null) {
            return "redirect:/flight/register";
        }

        redirectAttrs.addFlashAttribute("sessionKey", sessionKey);

        return "redirect:/flight/showFlights";
    }

    @GetMapping(value = "showFlights")
    public String showFlights(ModelMap m) throws UnirestException, ParseException {

        String JsonString = sky.SessionResults(m.get("sessionKey").toString());

        JSONParser jsonParser = new JSONParser();
        JSONObject Json = (JSONObject) jsonParser.parse(JsonString);

        m.addAttribute("Json", Json);

        return "result";
    }

    @GetMapping(value = "city/{city}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public String cities(ModelMap m, @PathVariable("city") String city) throws UnirestException, UnsupportedEncodingException {
     

        HttpResponse<String> response = Unirest.get("https://cometari-airportsfinder-v1.p.rapidapi.com/api/airports/by-text?text=" + city)
                .header("x-rapidapi-host", "cometari-airportsfinder-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .asString();

        String cities = response.getBody();

        return cities;
    }
    
    ////////
    @GetMapping(value = "register1")
    public String preFlightForm1(ModelMap m) {
        Esky esky=new Esky();
        esky.setPy("0");
        esky.setPi("0");
        esky.setPc("0");
        m.addAttribute("esky", esky);
        return "flightFormTest";
    }
    
       @PostMapping(value = "postRegister1")
    public ResponseEntity<Object> postFlight1(@ModelAttribute("esky") Esky esky, RedirectAttributes redirectAttrs
    ,@RequestParam(name = "returnDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate returnDate) throws IOException, UnirestException, URISyntaxException {
       
        String link= "https://www.esky.gr/flights/select/"+esky.getType()+"/ap/"+esky.getOriginPlace()+"/ap/"+esky.getDestinationPlace()+"?";   
      
        Map<String, String> map=new HashMap<>();
         
           map.put("departureDate", esky.getDepartureDate().toString());
           if (returnDate!=null){map.put("returnDate", returnDate.toString());}       
           map.put("pa", esky.getPa());
           map.put("py", esky.getPy());
           map.put("pc", esky.getPc());
           map.put("pi", esky.getPi());
           map.put("sc", esky.getSc());        
           
       URI yahoo = new URI(link+sky.getParamsString(map));
    HttpHeaders httpHeaders = new HttpHeaders();
    httpHeaders.setLocation(yahoo);
    return new ResponseEntity<>(httpHeaders, HttpStatus.SEE_OTHER);
    }
}
