package com.mainpackage.tripPlan.controllers;

import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "car/")
public class CarController {

    @PostMapping(value = "carResults")
    public String hotelResults(ModelMap m, HttpSession session) {

        if (session.getAttribute("unloggedUser") == null) {
            return "userTripsPage";
        } else {
            return "register";
        }

    }

}
