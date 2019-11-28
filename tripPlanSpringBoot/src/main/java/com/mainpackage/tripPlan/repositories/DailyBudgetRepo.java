/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.dto.DailyBudgetDTO;
import com.mainpackage.tripPlan.model.DailyBudget;
import java.util.Date;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import java.util.List;
import org.springframework.data.repository.query.Param;

public interface DailyBudgetRepo extends CrudRepository<DailyBudget, Integer> {
    
    @Query("select new com.mainpackage.tripPlan.dto.DailyBudgetDTO("
            + "db.id,db.dayBudget,db.date)  "
            + " from DailyBudget db inner join db.tripId tr  "
            + " where  tr.tripId= :tripId ORDER BY db.date ASC")
    List<DailyBudgetDTO> findDailyBudgetByTripId(@Param("tripId") Integer tripId);
    
     @Query("select new com.mainpackage.tripPlan.dto.DailyBudgetDTO("
            + "db.id,db.dayBudget,db.date)  "
            + " from DailyBudget db inner join db.tripId tr  "
            + " where  tr.tripId= :tripId and db.date=:date")
        List<DailyBudgetDTO> findDailyBudgetByTripIdAndDate(@Param("tripId") Integer tripId,@Param("date") Date date);

          @Query("select db "
            + " from DailyBudget db inner join db.tripId tr  "
            + " where  tr.tripId= :tripId and db.date=:date")
        DailyBudget findDailyBudgetEntityByTripIdAndDate(@Param("tripId") Integer tripId,@Param("date") Date date);

}
