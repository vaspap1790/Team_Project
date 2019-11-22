/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.DummyModels.DummyPost;
import com.mainpackage.tripPlan.dto.PostCommentsDto;
import com.mainpackage.tripPlan.dto.PostDTO;
import com.mainpackage.tripPlan.dto.PostPhotosDto;
import com.mainpackage.tripPlan.dto.SuperPostDto;
import com.mainpackage.tripPlan.repositories.PostRepo;
import com.mainpackage.tripPlan.services.PostService;
import com.mainpackage.tripPlan.services.ServiceFile;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import org.springframework.http.MediaType;

@Controller
@RequestMapping(value = "post/")
public class PostController {

    @Autowired
    PostService postService;
    @Autowired
    PostRepo postRepo;
    @Autowired
    ServiceFile serviceFile;

    @PostMapping(value = "create")
    @ResponseBody
    public String createPost(@RequestBody DummyPost dummy) throws ParseException {

        postService.savePost(dummy);
        return "";
    }

    @GetMapping(value = "/build", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String,List<SuperPostDto>> returnTripsLocation() {
        Map<String,List<SuperPostDto>> map=new HashMap<>();
        map.put("key",postService.buildSuperPost());
        return map;

    }

}
