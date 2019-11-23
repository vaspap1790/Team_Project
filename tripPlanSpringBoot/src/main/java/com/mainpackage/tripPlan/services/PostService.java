/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.DummyModels.DummyPost;
import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.dto.PostCommentsDto;
import com.mainpackage.tripPlan.dto.PostDTO;
import com.mainpackage.tripPlan.dto.PostLikesDTO;
import com.mainpackage.tripPlan.dto.PostPhotosDto;
import com.mainpackage.tripPlan.dto.SuperPostDto;
import com.mainpackage.tripPlan.model.Likes;
import com.mainpackage.tripPlan.model.Post;
import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.repositories.PostRepo;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.*;
import javax.transaction.Transactional;

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
    @Autowired
    ServiceFile serviceFile;

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

    @Transactional
    public List<SuperPostDto> buildSuperPost() {
        
        List<SuperPostDto> superPosts = new ArrayList<>();

        List<PostDTO> posts = postRepo.getAllPosts();
        List<PostLikesDTO> likes = postRepo.getLikesOfPosts();
        List<PostCommentsDto> comments = postRepo.getCommentsOfPosts();
        List<PostPhotosDto> photos = postRepo.getPhotosOfPosts();

        posts.forEach((post) -> superPosts.add(new SuperPostDto(post.getTripId(), post.getPostId(), post.getUsername(),
                post.getTitle(), post.getBody(), post.getTimeStamp(),
                serviceFile.getStringImage(post.getProfilePhoto()))));

        superPosts.forEach((superPost) -> {

            likes.forEach((like) -> {
                if (like.getPostId() == superPost.getPostId()) {
                    superPost.getLikes().add(like);
                }
            });
            comments.forEach((comment) -> {
                if (comment.getPostId() == superPost.getPostId()) {
                    superPost.getComments().add(comment);
                }
            });
            photos.forEach((photo) -> {
                if (photo.getTripId() == superPost.getTripId()) {
                    photo.setFinalPhoto(serviceFile.getStringImage(photo.getPhotos()));
                    superPost.getPhotos().add(photo);                
                }
            });

        });
        return superPosts;
    }
}
