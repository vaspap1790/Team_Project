package com.mainpackage.tripPlan.controllers;


import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ContactController {

    
    @GetMapping(value = "contact")
    public String contact(ModelMap m) {

        return "contact";
    }

}
