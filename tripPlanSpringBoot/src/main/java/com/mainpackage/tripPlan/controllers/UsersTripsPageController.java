package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Comment;
import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.services.CommentService;
import com.mainpackage.tripPlan.services.TripService;
import java.util.Arrays;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "tripPage/")
public class UsersTripsPageController {

    @Autowired
    TripService tripService;
    @Autowired
    CommentService commentService;

    @PostMapping(value = "comment")
    @ResponseBody
    public String preSubmitTrip(@RequestParam(name = "title") String title,
            @RequestParam(name = "text") String text,
            @RequestParam(name = "tripId") String id) {
        try {
            Trip trip = tripService.findTripById(Integer.parseInt(id));
            Comment comment = new Comment(text, title, trip);
            comment.setTripId(trip);
            trip.setCommentCollection(Arrays.asList(comment));
            commentService.saveComment(comment);
            return "Success";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "fail";
    }
}
