
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.RentalType;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "accommodation/")
public class AccommodationController {
    
    @GetMapping(value = "hotel")
    public String flight() {

        return "redirect:/hotel/hotelForm";
    }
    @GetMapping(value = "hostel")
    public String train() {

        return "notAvailable";
    }
    @GetMapping(value = "airbnb")
    public String ship() {

        return "notAvailable";
    }
    @GetMapping(value = "none")
    public String none(HttpSession session) {
        RentalType rentalType = (RentalType) session.getAttribute("rentalType");
        return "redirect:/rental/"+rentalType.getType();
    }
}
