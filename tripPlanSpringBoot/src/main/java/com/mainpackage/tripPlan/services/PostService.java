/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.DummyModels.DummyPost;
import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.Likes;
import com.mainpackage.tripPlan.model.Post;
import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.repositories.PostRepo;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;

@Service
public class PostService {

    @Autowired
    GenericJpaDao<Post> postDao;
    @Autowired
    PostRepo postRepo;
    @Autowired
    TripService tripService;
    @Autowired
    GenericJpaDao<Likes> likesDao;

    public void savePost(DummyPost dummy) throws ParseException {
        try {
            Post post = postRepo.findByTripId(dummy.getTripId());
            if (post != null) {
                post.setText(dummy.getBody());
                post.setTitle(dummy.getTitle());
                postDao.update(post);
            } else {
                Trip trip = tripService.findTripById(dummy.getTripId());
                Post postSave = new Post(dummy.getTitle(), dummy.getBody(), trip, new Date());
                Likes likes = new Likes(0, postSave);
                likes.setPostId(postSave);
                postDao.save(postSave);
                likesDao.save(likes);

            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
