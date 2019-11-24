package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.DummyModels.TransportationDummy;
import com.mainpackage.tripPlan.dto.TripDTO;
import com.mainpackage.tripPlan.model.Accommodation;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.model.Transportation;
import com.mainpackage.tripPlan.model.TransportationType;
import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.model.UserPrincipal;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.TripService;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import java.util.List;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping(value = "trip/")
public class TripController {

    @Autowired
    UserRepo userRepo;
    @Autowired
    TripService tripService;
    @Autowired
    TripService tripService1;

    @GetMapping(value = "submit")
    public String preSubmitTrip() {

        return "forms/submitTrip";
    }

    @GetMapping(value = "saveTrip")
    public ModelAndView saveTrip(HttpSession session) {

        UserPrincipal userPrince = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepo.findByUsername(userPrince.getUsername());

        Trip trip = (Trip) session.getAttribute("trip");
        TransportationType transType = (TransportationType) session.getAttribute("transportationType");
        AccommodationType accomType = (AccommodationType) session.getAttribute("accommodationType");
        Accommodation accommo = (Accommodation) session.getAttribute("accommodation");
        TransportationDummy trans = (TransportationDummy) session.getAttribute("transportation");
        Transportation oneWay = trans.getOneWay();
        Transportation roundTrip = trans.getRoundTrip();

        if ((accommo == null && trans == null) || trip == null) {
            return new ModelAndView("redirect:/");
        }
        try {
            tripService.saveTripUser(trip, user);
            if (accommo != null && !accomType.getType().equals("none")) {
                tripService.saveTripAccommodation(trip, accommo, accomType);
            }
            if (trans != null && !transType.getType().equals("none") && oneWay != null) {
                tripService.saveTripTransportation(trip, oneWay, transType);
                if (roundTrip != null) {
                    tripService1.saveTripTransportation(trip, roundTrip, transType);
                }
            }
            return new ModelAndView("redirect:/user/profile");

        } catch (Exception e) {
            e.printStackTrace();
            return new ModelAndView("redirect:/");
        }
    }

    @GetMapping(value = "/{username}", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public List<TripDTO> returnTripsLocation(@PathVariable("username") String username) {
        return tripService.findUserTripsByUsername(username);

    }

    @PostMapping(value = "delete/{tripId}/{username}")
    @ResponseBody
    public void deleteTrip(@PathVariable("tripId") int tripId,@PathVariable("username") String username) {
        tripService.deleteTrip(tripId,username);
    }
}
