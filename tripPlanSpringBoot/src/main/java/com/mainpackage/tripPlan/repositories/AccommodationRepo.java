package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.dto.AccommodationDTO;
import com.mainpackage.tripPlan.model.Accommodation;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import java.util.List;
import org.springframework.data.repository.query.Param;

public interface AccommodationRepo extends CrudRepository<Accommodation, Integer>{
    
        @Query("select new com.mainpackage.tripPlan.dto.AccommodationDTO("
            + "a.location,a.this1,a.price,a.accommoName,a.checkin,a.checkout)  "
            + "from Accommodation a inner join a.tripId tr inner join tr.userId u "
            + " where u.username= :username and tr.location= :location")
    List<AccommodationDTO> findAccommodationtationByUsernameAndLocation(@Param("username") String username, @Param("location") String location);

}
