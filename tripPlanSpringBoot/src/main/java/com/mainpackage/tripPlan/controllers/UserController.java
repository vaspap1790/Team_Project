package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.UserService;
import com.mainpackage.tripPlan.utilities.Check;
import com.mainpackage.tripPlan.utilities.Encryption;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "user/")
public class UserController {

    @Autowired
    UserService userService;
    @Autowired
    GenericJpaDao<User> userDao;
    @Autowired
    Encryption encrypt;
    @Autowired
    UserRepo userRepo;
    @Autowired
    Check check;

    @GetMapping(value = "/choices")
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

    @GetMapping(value = "/userTripsPage")
    public String userTripsPage() {

        return "main/userTripsPage";
    }

}
