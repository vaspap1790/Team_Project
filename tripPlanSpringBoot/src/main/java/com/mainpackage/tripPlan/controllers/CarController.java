package com.mainpackage.tripPlan.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "car/")
public class CarController {

    
    @GetMapping(value="carForm")
    public String carForm(){
        
    return "forms/carForm";    
    }
    
    @GetMapping(value="carResults")
    public String carResults(){
        
    return "responses/carResults";    
    }
    
    @GetMapping(value = "postCarResults")
    public String hotelResults(ModelMap m, HttpSession session) {

            return "main/userTripsPage";

    }

}
