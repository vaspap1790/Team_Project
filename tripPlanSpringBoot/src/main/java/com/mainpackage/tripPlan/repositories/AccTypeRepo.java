
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.AccommodationType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface AccTypeRepo extends CrudRepository<AccommodationType, Integer>{
    
    @Query("SELECT a FROM AccommodationType a WHERE a.type = :type")
    AccommodationType findByType(@Param("type") String type);
    
}
