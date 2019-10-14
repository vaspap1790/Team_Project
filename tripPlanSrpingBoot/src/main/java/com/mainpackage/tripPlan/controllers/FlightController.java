
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Flight;
import com.mainpackage.tripPlan.webServices.SkyApi;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@RequestMapping(value = "flight/")
public class FlightController {
    
    @Autowired
    SkyApi sky;
    
     @GetMapping(value = "register")
    public String preFlightForm(ModelMap m) {
         m.addAttribute("flight",new Flight());
        return "flightForm";
    }
    
     @PostMapping(value = "postRegister")
    public String postFlight(@ModelAttribute("flight") Flight flight,RedirectAttributes redirectAttrs ) throws IOException, UnirestException {
         
        String sessionKey=sky.CreateSession(flight);
        redirectAttrs.addFlashAttribute("sessionKey", sessionKey);
        
        return "redirect:/flight/showFlights";
    }
    
    @GetMapping(value="showFlights")
    public String showFlights(ModelMap m) throws UnirestException{
        
      JsonNode Json=sky.SessionResults(m.get("sessionKey").toString());
        
        m.addAttribute("Json",Json);
        
        return "result";
    }
}
