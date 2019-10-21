package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.User;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WelcomeController {

    @GetMapping(value = "/")
    public String welcome(ModelMap m, HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            User unLoggedUser = new User();
            session.setAttribute("user", unLoggedUser);
        }
        
        return "index";
    }

    @GetMapping(value = "/choices")
    public String choices() {
        return "choices";
    }

}
