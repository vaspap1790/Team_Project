package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.Trip;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface TripRepo extends CrudRepository<Trip, Integer> {

    @Query("select t.tripId from Trip t inner join t.userId u where "
            + "u.username= :username")
    List<Integer> findByUsername(@Param("username") String username);
}
