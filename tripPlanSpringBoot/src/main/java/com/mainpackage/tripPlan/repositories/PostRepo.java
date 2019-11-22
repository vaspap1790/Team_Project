
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.dto.PostDTO;
import com.mainpackage.tripPlan.model.Post;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import java.util.*;

public interface PostRepo extends CrudRepository<Post, Integer>{
    
     @Query("SELECT p FROM Post p inner join p.tripId tr  WHERE tr.tripId= :tripId")
    Post findByTripId(@Param("tripId") Integer tripId);
    
    @Query("select new com.mainpackage.tripPlan.dto.PostDTO(f.fileData,u.username,p.title,p.text,p.timestamp) FROM Post p INNER JOIN p.tripId tr  "
            + "inner join tr.userId u inner join u.file f ")
    List<PostDTO> getAllPosts();
}
