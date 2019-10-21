package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.model.User;
import java.math.BigDecimal;
import java.util.*;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

    @GetMapping(value = "/")
    public String welcome(ModelMap m, HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            user = new User();
        }
        m.addAttribute("user", user);
        
       
        return "index";
    }
}
