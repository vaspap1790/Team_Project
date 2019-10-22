package com.mainpackage.tripPlan.controllers;


import com.mainpackage.tripPlan.utilities.CreateJson;
import com.mainpackage.tripPlan.webServices.BookingApi;
import com.mashape.unirest.http.HttpResponse;
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
import org.json.simple.JSONArray;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequestMapping(value = "booking/")
public class BookingController {

    @Autowired
    BookingApi booking;
    @Autowired 
    CreateJson jsonUtil;
    
    
     @GetMapping(value = "searchForCity")
    public String searchCity(ModelMap m) {

        return "booking";
    }
    
    @GetMapping(value = "city/{city}", produces = MediaType.APPLICATION_JSON_VALUE)
    public String location(ModelMap m, @PathVariable("city") String city) throws UnirestException, ParseException {

        System.out.println(city);

        return "result"; 
    }

    
}
