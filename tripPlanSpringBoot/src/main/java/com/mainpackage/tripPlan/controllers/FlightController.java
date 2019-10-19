package com.mainpackage.tripPlan.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.mainpackage.tripPlan.model.Flight;
import com.mainpackage.tripPlan.utilities.CreateJson;
import com.mainpackage.tripPlan.webServices.SkyApi;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.Unirest;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import java.util.*;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
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
    @Autowired
    CreateJson createJ;

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

        JSONObject Json = createJ.createJson(JsonString);

        m.addAttribute("Json", Json);

        return "result";
    }

    @GetMapping(value = "city/{city}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Object> citiesI(ModelMap m, @PathVariable("city") String city) throws UnirestException, UnsupportedEncodingException {
     

        HttpResponse<String> response = Unirest.get("https://cometari-airportsfinder-v1.p.rapidapi.com/api/airports/by-text?text=" + city)
                .header("x-rapidapi-host", "cometari-airportsfinder-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .asString();

        String cities = response.getBody();

        return new ResponseEntity<>(cities,HttpStatus.OK);
    }
 
}
