
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Flight;
import com.mainpackage.tripPlan.webServices.SkyApi;
import com.mashape.unirest.http.JsonNode;
import com.mashape.unirest.http.exceptions.UnirestException;
import java.io.IOException;
import java.util.Date;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String postFlight(@ModelAttribute("flight") Flight flight,RedirectAttributes redirectAttrs,
            @RequestParam(name = "inboundDate")@DateTimeFormat(iso = DateTimeFormat.ISO.DATE) Date inboundDate ) throws IOException, UnirestException {
         
         
        String sessionKey=sky.CreateSession(flight,inboundDate);
        
        if(sessionKey==null){
            return "redirect:/flight/register";
        }
        
        redirectAttrs.addFlashAttribute("sessionKey", sessionKey);
        
        return "redirect:/flight/showFlights";
    }
    
    @GetMapping(value="showFlights")
    public String showFlights(ModelMap m) throws UnirestException{
        
      JsonNode Json=sky.SessionResults(m.get("sessionKey").toString());
        
        m.addAttribute("Json",Json);
        
        return "result";
    }
    
    @GetMapping(value="city/{city}")
    public String cities(ModelMap m,@PathVariable("city") String city) throws UnirestException{
        m.addAttribute("city",sky.getIata(city));
       return "result";
    }
}
