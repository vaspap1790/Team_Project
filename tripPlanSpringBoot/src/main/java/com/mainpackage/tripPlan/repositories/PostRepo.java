
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.dto.PostCommentsDto;
import com.mainpackage.tripPlan.dto.PostDTO;
import com.mainpackage.tripPlan.dto.PostLikesDTO;
import com.mainpackage.tripPlan.dto.PostPhotosDto;

import com.mainpackage.tripPlan.model.Post;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.*;

public interface PostRepo extends CrudRepository<Post, Integer>{
    
     @Query("SELECT p FROM Post p inner join p.tripId tr  WHERE tr.tripId= :tripId")
    Post findByTripId(@Param("tripId") Integer tripId);
    
    @Query("select new com.mainpackage.tripPlan.dto.PostDTO(tr.tripId,p.id,f.fileData,u.username,p.title,p.text,p.timestamp) FROM Post p INNER JOIN p.tripId tr  "
            + "inner join tr.userId u inner join u.file f ")
    List<PostDTO> getAllPosts();
    
    @Query("select new com.mainpackage.tripPlan.dto.PostLikesDTO"
            + "(p.id,l) FROM Likes l INNER JOIN l.postId p where p.id=:postId")
    List<PostLikesDTO> getLikesOfPosts(@Param("postId") Integer postId);
    
    @Query("select new com.mainpackage.tripPlan.dto.PostCommentsDto"
            + "(p.id,c) FROM Comment c INNER JOIN c.postId p where p.id=:postId")
    List<PostCommentsDto> getCommentsOfPosts(@Param("postId") Integer postId);
    
    @Query("select new com.mainpackage.tripPlan.dto.PostPhotosDto"
            + "(tr.tripId,ph) FROM Photo ph INNER JOIN ph.tripId tr  WHERE tr.tripId= :tripId")
    List<PostPhotosDto> getPhotosOfPosts(@Param("tripId") Integer tripId);
}
