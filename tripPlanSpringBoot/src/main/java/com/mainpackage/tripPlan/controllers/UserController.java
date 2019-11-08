package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.Accommodation;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.model.Rental;
import com.mainpackage.tripPlan.model.RentalType;
import com.mainpackage.tripPlan.model.Transportation;
import com.mainpackage.tripPlan.model.TransportationType;
import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.model.UserPrincipal;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.PostChoicesService;
import com.mainpackage.tripPlan.services.UserService;
import com.mainpackage.tripPlan.utilities.Check;
import com.mainpackage.tripPlan.utilities.Encryption;
import java.io.IOException;
import java.sql.SQLException;
import java.util.Arrays;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
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
    @Autowired
    PostChoicesService postChoicesService;
    @Autowired
    GenericJpaDao<Trip> tripDao;
    @Autowired
    private HttpServletRequest request;

    @GetMapping(value = "/choices")
    public String choices(HttpSession session) {

        UserPrincipal userPrince = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepo.findByUsername(userPrince.getUsername());
        session.setAttribute("user", user);

        if (session.getAttribute("trip") == null) {
            Trip trip = new Trip();
            session.setAttribute("trip", trip);
        }
        return "forms/choices";
    }

    @GetMapping(value = "/postChoices")
    public ModelAndView postChoices(HttpSession session, @RequestParam(name = "transportation") String trans,
            @RequestParam(name = "accomodation") String accom,
            @RequestParam(name = "rental") String rent) {

        TransportationType transType=new TransportationType(trans);
        AccommodationType accomType=new AccommodationType(accom);
        RentalType rentalType=new RentalType(rent);

        Trip trip = (Trip) session.getAttribute("trip");
        User user = (User) session.getAttribute("user");

//        session.setAttribute("trip", postChoicesService.tripPostChoices(trip, transportation, accomodation, rental, user));
        session.setAttribute("transportationType", transType);
        session.setAttribute("accommodationType", accomType);
        session.setAttribute("rentalType", rentalType);
        
        return new ModelAndView("redirect:/" + transType.getType() + "/register");
    }

    @GetMapping(value = "/userTripsPage")
    public String userTripsPage() {

        return "main/userTripsPage";
    }

    @GetMapping(value = "/profil")
    public String userProfilPage() {

        return "userProfil";
    }

}
