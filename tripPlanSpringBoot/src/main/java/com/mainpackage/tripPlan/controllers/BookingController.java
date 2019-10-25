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
import javax.servlet.http.HttpSession;
import org.json.simple.JSONArray;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "hotel/")
public class BookingController {

    @Autowired
    BookingApi booking;
    @Autowired
    CreateJson jsonUtil;

    @GetMapping(value="hotelForm")
    public String hotelForm(){
        
        return "forms/hotelForm";
        
    }
    @GetMapping(value="postHotelForm")
    public String postHotelForm(){
        
        return "responses/hotelResults";
        
    }
    

    @GetMapping(value = "postHotelResults")
    public ModelAndView hotelResults(ModelMap m, HttpSession session) {

        String getRentalFromSess = (String) session.getAttribute("rental");
        if (getRentalFromSess.equals("None")) {
            
                return new ModelAndView("/userTripsPage") ;

        } else {
            String rental = getRentalFromSess + "/" + getRentalFromSess + "Form";
            System.out.println(rental);

            return new ModelAndView("redirect:/"+rental) ;
        }
    }
    
}
