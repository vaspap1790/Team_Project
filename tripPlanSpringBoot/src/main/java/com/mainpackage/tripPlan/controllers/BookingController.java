package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Flight;
import com.mainpackage.tripPlan.utilities.CreateJson;
import com.mainpackage.tripPlan.webServices.BookingApi;
import com.mashape.unirest.http.exceptions.UnirestException;
import org.json.simple.JSONObject;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping(value = "hotel/")
public class BookingController {

    @Autowired
    BookingApi booking;
    @Autowired
    CreateJson jsonUtil;

    @GetMapping(value = "city/{city}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public ResponseEntity<Object> location(ModelMap m, @PathVariable("city") String city) throws UnirestException, ParseException {

        String j = booking.locations(city);

        JSONArray array = jsonUtil.createJsonArray(j);

        return new ResponseEntity<>(array, HttpStatus.OK);
    }

    @PostMapping(value = "hotelResults")
    public String hotelResults(ModelMap m, HttpSession session) {

        String getRentalFromSess = (String) session.getAttribute("rental");
        if (getRentalFromSess.equals("None")) {
            if (session.getAttribute("unloggedUser") == null) {
                return "userTripsPage";
            }else {
                return "register";
            }
        } else {
            String rental = getRentalFromSess + "Form";

            return rental;
        }
    }

}
