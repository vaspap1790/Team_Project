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
import javax.servlet.http.HttpSession;
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
import org.springframework.web.servlet.ModelAndView;
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
    public ModelAndView postFlight(@ModelAttribute("flight") Flight flight, HttpSession hs,
            @RequestParam(name = "inboundDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate inboundDate) throws IOException, UnirestException {

        HttpResponse<String> skyReport = sky.browseFlights(flight, inboundDate);
        if (skyReport.getStatus() == 200) {
            hs.setAttribute("jsonFlights", skyReport);
            return new ModelAndView("result");
        }

        return new ModelAndView("redirect:/flight/register");
    }

    ///////////////////// return flights with sesssion
    @GetMapping(value = "returnFlights", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Object> returnFlights(HttpSession hp) throws UnirestException, UnsupportedEncodingException, ParseException {

        HttpResponse flights = (HttpResponse) hp.getAttribute("jsonFlights");

        return new ResponseEntity<>(flights.getBody(), HttpStatus.OK);
    }

    @GetMapping(value = "city/{city}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Object> citiesI(ModelMap m, @PathVariable("city") String city) throws UnirestException, UnsupportedEncodingException {

        HttpResponse<String> response = Unirest.get("https://cometari-airportsfinder-v1.p.rapidapi.com/api/airports/by-text?text=" + city)
                .header("x-rapidapi-host", "cometari-airportsfinder-v1.p.rapidapi.com")
                .header("x-rapidapi-key", "2f7c656e8emsh52fa210fd1c2272p1016dbjsn00574276a26e")
                .asString();

        String cities = response.getBody();

        return new ResponseEntity<>(cities, HttpStatus.OK);
    }

}
