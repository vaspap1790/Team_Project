package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Flight;
import com.mainpackage.tripPlan.model.Transportation;
import com.mainpackage.tripPlan.utilities.CreateJson;
import com.mainpackage.tripPlan.webServices.SkyApi;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
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
        return "forms/flightForm";
    }

    @PostMapping(value = "postRegister")
    public ModelAndView postFlight(@ModelAttribute("flight") Flight flight,
            HttpSession session,ModelMap m,
            @RequestParam(name = "inboundDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate inboundDate) throws IOException, UnirestException, ParseException {

        String sessionKey = sky.CreateSession(flight, inboundDate);
        HttpResponse<String> skyReport = sky.SessionResults(sessionKey);

        if (skyReport.getStatus() == 200 && sessionKey != null) {
            
            m.addAttribute("transportation",new Transportation());
            JSONObject skyJson = createJ.createJson(skyReport.getBody());
            return new ModelAndView("responses/flightResults", "flights", skyJson);
        }
        return new ModelAndView("redirect:/flight/register");
    }

    @GetMapping(value = "postFlightResults")
    public ModelAndView flightResultForm(ModelMap m, HttpSession session,@ModelAttribute("transportation") Transportation tr) {
        System.out.println(m.get("transportation"));
        String getAccomFromSess = (String) session.getAttribute("accomodation");
        String accomodation = getAccomFromSess + "Form";

        return new ModelAndView("redirect:/" + getAccomFromSess + "/" + accomodation);
    }

//    @GetMapping(value = "returnFlights", produces = MediaType.APPLICATION_JSON_VALUE)
//    @ResponseBody
//    public ResponseEntity<Object> returnFlights(HttpSession hp) throws UnirestException, UnsupportedEncodingException, ParseException {
//
//        HttpResponse flights = (HttpResponse) hp.getAttribute("jsonFlights");
//
//        return new ResponseEntity<>(flights.getBody(), HttpStatus.OK);
//    }

    @GetMapping(value = "city/{city}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Object> citiesI(ModelMap m, @PathVariable("city") String city) throws UnirestException, UnsupportedEncodingException {

        HttpResponse<String> cities = sky.cities(city);

        return new ResponseEntity<>(cities.getBody(), HttpStatus.OK);
    }

}
