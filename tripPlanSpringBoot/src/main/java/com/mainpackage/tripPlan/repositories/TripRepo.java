package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.dto.TripDTO;
import com.mainpackage.tripPlan.model.Trip;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface TripRepo extends CrudRepository<Trip, Integer> {

    @Query("select new com.mainpackage.tripPlan.dto.TripDTO(t.tripId,t.location,t.totalBudget)"
            + " from Trip t inner join t.userId u where "
            + "u.username= :username")
    List<TripDTO> findTripsByUsername(@Param("username") String username);

    @Query("SELECT t FROM Trip t WHERE t.tripId = :tripId")
    Trip findTripById(@Param("tripId") Integer id);

}
