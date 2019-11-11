package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.dto.TransportationDTO;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.services.TransportationService;
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
@RequestMapping(value = "transportation/")

public class TransportationController {
    
    @Autowired
    TransportationService transService;

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

        return "redirect:/accommodation/" + accomoType.getType();
    }

    @GetMapping(value = "/{username}/{location}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<TransportationDTO> returnTransportation(@PathVariable("username") String username,
            @PathVariable("location") String location) {
        return transService.findTransportationByUsernameAndTripLocation(username, location);

    }
}
