/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "rental/")
public class RentalController {
   
      @GetMapping(value = "car")
    public String flight() {

        return "notAvailable";
    }
    @GetMapping(value = "motocycle")
    @ResponseBody
    public String train() {

        return "notAvailable";
    }

    @GetMapping(value = "none")
    public String none() {

        return "main/userTripsPage";
    }
}
