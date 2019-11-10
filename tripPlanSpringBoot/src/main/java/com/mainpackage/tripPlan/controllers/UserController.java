package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.model.RentalType;
import com.mainpackage.tripPlan.model.TransportationType;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.UserService;
import com.mainpackage.tripPlan.utilities.Check;
import com.mainpackage.tripPlan.utilities.Encryption;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
    public String choices(HttpSession session) {

        return "forms/choices";
    }

    @GetMapping(value = "/postChoices")
    public ModelAndView postChoices(HttpSession session, @RequestParam(name = "transportation") String trans,
            @RequestParam(name = "accomodation") String accom,
            @RequestParam(name = "rental") String rent) {

        TransportationType transType = new TransportationType(trans);
        AccommodationType accomType = new AccommodationType(accom);
        RentalType rentalType = new RentalType(rent);

        session.setAttribute("transportationType", transType);
        session.setAttribute("accommodationType", accomType);
        session.setAttribute("rentalType", rentalType);

        return new ModelAndView("redirect:/transportation/" + transType.getType());
    }

    @GetMapping(value = "/userTripsPage")
    public String userTripsPage() {

        return "main/userTripsPage";
    }

    @GetMapping(value = "/profile")
    public String userProfilePage() {

        return "userProfile";
    }

}
