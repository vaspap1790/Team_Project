package com.mainpackage.tripPlan.controllers;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.mainpackage.tripPlan.utilities.CreateJson;
import com.mainpackage.tripPlan.webServices.BookingApi;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.time.LocalDate;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
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

    @PostMapping(value = "postHotelForm")
    public ModelAndView postHotelForm(@RequestParam(name = "guests") String guests,
            @RequestParam(name = "dest_id") String dest_id,
            @RequestParam(name = "checkin") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkin,
            @RequestParam(name = "checkout") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkout) throws UnirestException, ParseException, JsonProcessingException {

        HttpResponse<String> bookingResults = booking.propertiesList(dest_id, checkin, checkout, guests);
        JSONObject obj = jsonUtil.createJson(bookingResults.getBody());
        int count;
        try {
            count = Integer.parseInt(obj.get("count").toString());
            if (bookingResults.getStatus() == 200 && count > 0) {
                return new ModelAndView("responses/hotelResults", "bookingJson", jsonUtil.createJson(bookingResults.getBody()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("redirect:/hotel/hotelForm");

    }

    @GetMapping(value = "postHotelResults")
    public ModelAndView hotelResults(ModelMap m, HttpSession session) {

        String getRentalFromSess = (String) session.getAttribute("rental");
        if (getRentalFromSess.equals("None")) {

            return new ModelAndView("/userTripsPage");

        } else {
            String rental = getRentalFromSess + "/" + getRentalFromSess + "Form";
      

            return new ModelAndView("redirect:/" + rental);
        }
    }

}
