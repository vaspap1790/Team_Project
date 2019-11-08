package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.AccommodationType;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "transportation/")

public class TransportationController {

    
    @GetMapping(value = "flight")
    public String flight() {

        return "redirect:/flight/register";
    }
    @GetMapping(value = "train")
    public String train() {

        return "notAvailable/transportation";
    }
    @GetMapping(value = "ship")
    public String ship() {

        return "notAvailable/transportation";
    }
    @GetMapping(value = "none")
    public String none(HttpSession session) {
        AccommodationType accomoType = (AccommodationType) session.getAttribute("accommodationType");
        
        return "redirect:/accommodation/"+accomoType.getType();
    }
}
