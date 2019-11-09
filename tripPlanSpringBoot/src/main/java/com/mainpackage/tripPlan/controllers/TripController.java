/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Accommodation;
import com.mainpackage.tripPlan.model.AccommodationType;
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
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "trip/")
public class TripController {

    @Autowired
    UserRepo userRepo;
    @Autowired
    TripService tripService;

    @GetMapping(value = "submit")
    public String preSubmitTrip() {

        return "forms/submitTrip";
    }

    @GetMapping(value = "saveTrip")
    public ModelAndView saveTrip(HttpSession session) {
        UserPrincipal userPrince = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepo.findByUsername(userPrince.getUsername());
        Trip trip = new Trip();
        TransportationType transType = (TransportationType) session.getAttribute("transportationType");
        AccommodationType accomType = (AccommodationType) session.getAttribute("accommodationType");
        Accommodation accommo = (Accommodation) session.getAttribute("accommodation");
        Transportation trans = (Transportation) session.getAttribute("transportation");

        try {
            tripService.setTripUser(trip, user);
            if (accommo != null && !accomType.getType().equals("none")) {
                tripService.setTripAccommodation(trip, accommo, accomType);
            }
            if (trans != null && !transType.getType().equals("none")) {
                tripService.setTripTransportation(trip, trans, transType);
            }
            
            return new ModelAndView("redirect:/user/userTripsPage");
            
        } catch (Exception e) {
           e.printStackTrace();
            return new ModelAndView("redirect:/");
        }
    }
}
