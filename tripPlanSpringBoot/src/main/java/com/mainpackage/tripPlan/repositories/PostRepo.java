package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.dto.PostCommentsDto;
import com.mainpackage.tripPlan.dto.PostDTO;
import com.mainpackage.tripPlan.dto.PostLikesDTO;
import com.mainpackage.tripPlan.dto.PostPhotosDto;
import com.mainpackage.tripPlan.model.Likes;

import com.mainpackage.tripPlan.model.Post;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.*;

public interface PostRepo extends CrudRepository<Post, Integer> {

    @Query("SELECT p FROM Post p inner join p.tripId tr  WHERE tr.tripId= :tripId")
    Post findByTripId(@Param("tripId") Integer tripId);

    @Query("select new com.mainpackage.tripPlan.dto.PostDTO(tr.tripId,p.id,f.fileData,u.username,p.title,p.text,p.timestamp)"
            + " FROM Post p INNER JOIN p.tripId tr  "
            + "inner join tr.userId u inner join u.file f ")
    List<PostDTO> getAllPosts();

    @Query("select new com.mainpackage.tripPlan.dto.PostLikesDTO"
            + "(p.id,l.value,l.userId.username) FROM Likes l INNER JOIN l.postId p")
    List<PostLikesDTO> getLikesOfPosts();

    @Query("select new com.mainpackage.tripPlan.dto.PostCommentsDto"
            + "(c.commentId,p.id,tr.tripId,c.text,c.userId.username) FROM Comment c "
            + "INNER JOIN c.postId p inner join p.tripId tr inner join tr.userId u")
    List<PostCommentsDto> getCommentsOfPosts();

    @Query("select new com.mainpackage.tripPlan.dto.PostPhotosDto"
            + "(tr.tripId,ph.filedata) FROM Photo ph INNER JOIN ph.tripId tr")
    List<PostPhotosDto> getPhotosOfPosts();

    @Query("select l FROM Likes l  INNER JOIN l.postId p where p.id=:postId and l.userId.username=:username")
    Likes findLikeByUsernameAndPostId(@Param("postId") Integer postId, @Param("username") String username);

    Post findById(int id);

    @Query("select l FROM Likes l INNER JOIN l.postId p WHERE p.id=:postId")
    Likes findLikeByPostId(int postId);

    @Query("SELECT COUNT(l)  FROM Likes l inner join l.postId p where p.id=:postId")
    Integer findCountByPostId(@Param("postId") Integer postId);

}
