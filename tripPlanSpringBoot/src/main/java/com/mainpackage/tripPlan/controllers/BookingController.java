package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.utilities.CreateJson;
import com.mainpackage.tripPlan.webServices.BookingApi;
import com.mashape.unirest.http.HttpResponse;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.time.LocalDate;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.mainpackage.tripPlan.model.Rental;
import com.mainpackage.tripPlan.model.RentalType;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;

@Controller
@RequestMapping(value = "hotel/")
public class BookingController {

    @Autowired
    BookingApi booking;
    @Autowired
    CreateJson jsonUtil;

    @GetMapping(value = "hotelForm")
    public String hotelForm() {

        return "forms/hotelForm";

    }

    @PostMapping(value = "postHotelForm")
    public ModelAndView postHotelForm(@RequestParam(name = "guests") String guests, Model m,
            @RequestParam(name = "dest_id") String dest_id,
            @RequestParam(name = "checkin") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkin,
            @RequestParam(name = "checkout") @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate checkout) throws UnirestException, ParseException, JsonProcessingException {

        HttpResponse<String> bookingResults = booking.propertiesList(dest_id, checkin, checkout, guests);
        JSONObject obj = jsonUtil.createJson(bookingResults.getBody());
        int count;
        try {
            count = Integer.parseInt(obj.get("count").toString());
            if (bookingResults.getStatus() == 200 && count > 0) {
                Map<String, Object> booking = new HashMap<String, Object>();
                booking.put("bookingJson", jsonUtil.createJson(bookingResults.getBody()));
                booking.put("checkin", checkin);
                booking.put("checkout", checkout);
                return new ModelAndView("responses/hotelResults", "booking", booking);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return new ModelAndView("redirect:/hotel/hotelForm");

    }

    @GetMapping(value = "postHotelResults")
    public ModelAndView hotelResults(ModelMap m, HttpSession session) {

        RentalType getRentalTypeFromSess = (RentalType) session.getAttribute("rentalType");
        
        if (getRentalTypeFromSess.getType()==null) {
            return new ModelAndView("redirect:/");
        }

            return new ModelAndView("redirect:/rental/" +getRentalTypeFromSess.getType());
        }
    }


