/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.DummyModels.DummyComment;
import com.mainpackage.tripPlan.DummyModels.DummyPost;
import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.dto.SuperPostDto;
import com.mainpackage.tripPlan.model.Comment;
import com.mainpackage.tripPlan.model.Likes;
import com.mainpackage.tripPlan.model.Post;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.repositories.PostRepo;
import com.mainpackage.tripPlan.services.PostService;
import com.mainpackage.tripPlan.services.ServiceFile;
import com.mainpackage.tripPlan.services.UserService;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import java.util.*;
import org.springframework.http.MediaType;
import org.springframework.web.bind.annotation.PathVariable;

@Controller
@RequestMapping(value = "post/")
public class PostController {

    @Autowired
    PostService postService;
    @Autowired
    PostRepo postRepo;
    @Autowired
    PostRepo postRepo1;
    @Autowired
    ServiceFile serviceFile;
    @Autowired
    GenericJpaDao<Likes> likesDao;
    @Autowired
    UserService userService;

    @PostMapping(value = "create")
    @ResponseBody
    public void createPost(@RequestBody DummyPost dummy) throws ParseException {

        postService.savePost(dummy);
    }

    @GetMapping(value = "/build", produces = MediaType.APPLICATION_JSON_VALUE)
    @ResponseBody
    public Map<String, List<SuperPostDto>> returnTripsLocation() {
        Map<String, List<SuperPostDto>> map = new HashMap<>();
        map.put("Posts", postService.buildSuperPost());
        return map;

    }

    @GetMapping(value = "likes/{postId}/{username}")
    @ResponseBody
    public Map postLike(@PathVariable("postId") Integer postId, @PathVariable("username") String username) {
        Map<String, Object> map = new HashMap<>();
        try {
            User user = userService.findByUsername(username);
            Post post = postService.findPostById(postId);
            Likes userLike = postRepo.findLikeByUsernameAndPostId(postId, username);

            map = postService.likesConfig(user, post, userLike, postId);

            return map;

        } catch (Exception e) {
            e.printStackTrace();
            map.put("error", e.getMessage());
        }
        return map;
    }

    @PostMapping(value = "save/comment")
    @ResponseBody
    public void postComment(@RequestBody DummyComment dummy) throws ParseException {

        postService.saveComment(dummy);

    }
    
}
