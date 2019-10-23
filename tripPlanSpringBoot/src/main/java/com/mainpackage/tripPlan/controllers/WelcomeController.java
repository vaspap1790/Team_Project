package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {

    @GetMapping(value = "/")
    public String welcome(ModelMap m, HttpSession session) {

        User user = (User) session.getAttribute("user");

        if (user == null) {
            User unLoggedUser = new User();
            session.setAttribute("user", unLoggedUser);
            session.setAttribute("unloggedUser", "unloggedUser");
        }

        return "index";
    }

    @GetMapping(value = "/choices")
    public String choices() {
        return "choices";
    }

    @GetMapping(value = "/postChoices")
    public String postChoices(
            HttpSession session,
            HttpServletRequest request,
            @RequestParam(name = "transportation") String transportation,
            @RequestParam(name = "accomodation") String accomodation,
            @RequestParam(name = "rental") String rental) {


        session.setAttribute("transportation", transportation);
        session.setAttribute("accomodation", accomodation);
        session.setAttribute("rental", rental);

        return transportation + "Form";
    }

}
