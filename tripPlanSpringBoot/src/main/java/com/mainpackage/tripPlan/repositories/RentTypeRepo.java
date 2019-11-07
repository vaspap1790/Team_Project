package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.RentalType;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface RentTypeRepo extends CrudRepository<RentalType, Integer> {

    @Query("SELECT r FROM RentalType r WHERE r.type = :type")
    RentalType findByType(@Param("type") String type);
}
