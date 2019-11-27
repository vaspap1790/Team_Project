package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.DummyModels.TransportationDummy;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.model.Flight;
import com.mainpackage.tripPlan.utilities.CreateJson;
import com.mainpackage.tripPlan.webServices.SkyApi;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.time.LocalDate;
import javax.servlet.http.HttpServletResponse;
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
    SkyApi sky1;
    @Autowired
    CreateJson createJ;

    @GetMapping(value = "register")
    public String preFlightForm(ModelMap m) {
        m.addAttribute("flight", new Flight());
        return "forms/flightForm";
    }

    @GetMapping(value = "postRegister")
    public ModelAndView postFlight(@ModelAttribute("flight") Flight flight,
            HttpSession session, ModelMap m,
            @RequestParam(name = "inboundDate") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate inboundDate) throws IOException, UnirestException, ParseException {

        sky.createSession(flight, session, inboundDate);
        String sessionKey=(String) session.getAttribute("sessionKey");
        
        HttpResponse<String> skyReport = sky1.sessionResults(sessionKey);

        if (skyReport.getStatus() == 200 && sessionKey != null) {

            m.addAttribute("transportation", new TransportationDummy());
            JSONObject skyJson = createJ.createJson(skyReport.getBody());
            
            return new ModelAndView("responses/flightResults", "flights", skyJson);
        }
        session.setAttribute("errorFlight", "No available Flights");
        return new ModelAndView("redirect:/flight/register");
    }

    @PostMapping(value = "postFlightResults")
    public ModelAndView flightResultForm(ModelMap m, HttpSession session,
            @ModelAttribute("transportation") TransportationDummy tr) {

        session.setAttribute("transportation", tr);

        AccommodationType getAccomTypeFromSess = (AccommodationType) session.getAttribute("accommodationType");
        if (getAccomTypeFromSess == null) {
            return new ModelAndView("redirect:/");
        }
        return new ModelAndView("redirect:/accommodation/" + getAccomTypeFromSess.getType());
    }

    @GetMapping(value = "city/{city}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Object> citiesI(ModelMap m, @PathVariable("city") String city) throws UnirestException, UnsupportedEncodingException {

        HttpResponse<String> cities = sky.cities(city);

        return new ResponseEntity<>(cities.getBody(), HttpStatus.OK);
    }
}
