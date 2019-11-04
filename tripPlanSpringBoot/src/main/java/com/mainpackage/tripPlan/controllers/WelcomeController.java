package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.User;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {

//    @GetMapping(value = "/")
//    public String welcome(ModelMap m, HttpSession session) {
//
//        User user = (User) session.getAttribute("user");
//
//        if (user == null) {
//            User unLoggedUser = new User();
//            session.setAttribute("user", unLoggedUser);
//            session.setAttribute("unloggedUser", "unloggedUser");
//        }
//
//        return "index";
//    }
    
    @GetMapping(value = "/login")
    public String login(Model model, String error, String logout) {
        if (error != null) {
            model.addAttribute("errorMsg", "Your username and password are invalid.");
        }

        if (logout != null) {
            model.addAttribute("msg", "You have been logged out successfully.");
        }

        return "forms/logIn";
    }


    @GetMapping(value = "/")
    public String home() {
        return "index";
    }

    @GetMapping(value = "user/choices")
    public String choices() {
        return "forms/choices";
    }

    @GetMapping(value = "/postChoices")
    public ModelAndView postChoices(
            HttpSession session,
            HttpServletRequest request,
            @RequestParam(name = "transportation") String transportation,
            @RequestParam(name = "accomodation") String accomodation,
            @RequestParam(name = "rental") String rental) {

        session.setAttribute("transportation", transportation);
        session.setAttribute("accomodation", accomodation);
        session.setAttribute("rental", rental);

        return new ModelAndView("redirect:/" + transportation + "/register");
    }
    
    @GetMapping (value = "admin/userTripsPage")
    public  String userTripsPage(){
        
        return "userTripsPage";
    }

}
