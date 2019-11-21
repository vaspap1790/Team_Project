package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.model.File;
import com.mainpackage.tripPlan.model.RentalType;
import com.mainpackage.tripPlan.model.TransportationType;
import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.model.UserPrincipal;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.ServiceFile;
import com.mainpackage.tripPlan.services.UserService;
import com.mainpackage.tripPlan.utilities.Check;
import com.mainpackage.tripPlan.utilities.Encryption;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.*;
import org.springframework.http.MediaType;

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
    private ServiceFile DBFileStorageService;

    @GetMapping(value = "/choices")
    public String choices(HttpSession session, Model m) {
        m.addAttribute("trip", new Trip());
        return "forms/choices";
    }

    @GetMapping(value = "/postChoices")
    public ModelAndView postChoices(HttpSession session, @RequestParam(name = "transportation") String trans,
            @RequestParam(name = "accomodation") String accom, @RequestParam(name = "location") String location,
            @RequestParam(name = "rental") String rent) {
        Trip trip = new Trip(location);
        TransportationType transType = new TransportationType(trans);
        AccommodationType accomType = new AccommodationType(accom);
        RentalType rentalType = new RentalType(rent);

        session.setAttribute("trip", trip);
        session.setAttribute("transportationType", transType);
        session.setAttribute("accommodationType", accomType);
        session.setAttribute("rentalType", rentalType);

        return new ModelAndView("redirect:/transportation/" + transType.getType());
    }

    @GetMapping(value = "/userTripsPage/{tripId}")
    public String userTripsPage(HttpSession session, @PathVariable(value = "tripId") String tripId) {

        session.setAttribute("tripId", tripId);

        return "main/userTripsPage";
    }

    @GetMapping(value = "/profile")
    public String userProfilePage(HttpSession session, Model m) {

        UserPrincipal userPrince = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepo.findByUsername(userPrince.getUsername());
        try {
           File  file = DBFileStorageService.checkForFile(user.getUsername());
            if (file == null) {
              return "userProfile";
            }
            String img = DBFileStorageService.getStringImage(file.getFileData());           
            m.addAttribute("file", file);
            m.addAttribute("img", img);        
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "userProfile";
    }

    @GetMapping(value = "/getUser", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, Object> getUser() {

        UserPrincipal userPrince = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepo.findByUsername(userPrince.getUsername());

        Map<String, Object> map = new HashMap<>();
        map.put("username", user.getUsername());
        map.put("userId", user.getUserId());

        return map;
    }
}
