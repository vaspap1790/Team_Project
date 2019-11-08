package com.mainpackage.tripPlan.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "rental/")
public class RentalController {
   
      @GetMapping(value = "car")
    public String flight() {

        return "notAvailable/rental";
    }
    @GetMapping(value = "motocycle")
    public String train() {

        return "notAvailable/rental";
    }

    @GetMapping(value = "none")
    public String none() {

        return "main/userTripsPage";
    }
}
