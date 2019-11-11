package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.dto.AccommodationDTO;
import com.mainpackage.tripPlan.model.RentalType;
import com.mainpackage.tripPlan.services.AccommodationService;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "accommodation/")
public class AccommodationController {
    
    @Autowired
    AccommodationService accommoService;

    @GetMapping(value = "hotel")
    public String flight() {

        return "redirect:/hotel/hotelForm";
    }

    @GetMapping(value = "hostel")
    public String train() {

        return "notAvailable/accommodation";
    }

    @GetMapping(value = "airbnb")
    public String ship() {

        return "notAvailable/accommodation";
    }

    @GetMapping(value = "none")
    public String none(HttpSession session) {
        RentalType rentalType = (RentalType) session.getAttribute("rentalType");
        return "redirect:/rental/" + rentalType.getType();
    }

    @GetMapping(value = "/{username}/{location}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<AccommodationDTO> returnAccommodation(@PathVariable("username") String username,
            @PathVariable("location") String location) {
        return accommoService.findTransportationByUsernameAndTripLocation(username, location);

    }
}
