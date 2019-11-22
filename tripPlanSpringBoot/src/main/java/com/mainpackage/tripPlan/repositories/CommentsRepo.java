
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.Comment;
import org.springframework.data.repository.CrudRepository;


public interface CommentsRepo extends CrudRepository<Comment, Integer>{
    
}
