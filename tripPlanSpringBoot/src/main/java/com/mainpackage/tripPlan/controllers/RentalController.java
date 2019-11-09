package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Accommodation;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.model.RentalType;
import com.mainpackage.tripPlan.model.Transportation;
import com.mainpackage.tripPlan.model.TransportationType;
import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.model.UserPrincipal;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.TripService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "rental/")
public class RentalController {

    @Autowired
    UserRepo userRepo;
    @Autowired
    TripService tripService;

    @GetMapping(value = "car")
    public String flight() {

        return "notAvailable/rental";
    }

    @GetMapping(value = "motocycle")
    public String train() {

        return "notAvailable/rental";
    }

    @GetMapping(value = "none")
    public String none(HttpSession session) {

        return "redirect:/trip/submit";
    }
}
