/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.dto.TransportationDTO;
import com.mainpackage.tripPlan.model.Transportation;
import org.springframework.data.repository.CrudRepository;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;


public interface TransportationRepo extends CrudRepository<Transportation, Integer> {

    @Query("select new com.mainpackage.tripPlan.dto.TransportationDTO("
            + "t.startingPoint,t.destination,t.price,t.this1,t.departure,t.arrival)  "
            + "from Transportation t inner join t.tripId tr inner join tr.userId u "
            + " where u.username= :username and tr.location= :location")
    List<TransportationDTO> findTransportationByUsernameAndLocation(@Param("username") String username, @Param("location") String location);
}
