package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.dto.AccommodationDTO;
import com.mainpackage.tripPlan.model.Accommodation;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.repositories.AccTypeRepo;
import com.mainpackage.tripPlan.repositories.AccommodationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;
@Service
public class AccommodationService {

    @Autowired
    GenericJpaDao<Accommodation> accommodationDao;
    @Autowired
    AccTypeRepo accTypeRepo;
    @Autowired
    AccommodationRepo accommoRepo;
    
     public AccommodationType findAccommoTypeByType(String type) {
        AccommodationType accommoType = accTypeRepo.findByType(type);
        
        return accommoType;
    }
     
       public List<AccommodationDTO> findTransportationByUsernameAndTripLocation(String username,String location){
        List<AccommodationDTO> list=accommoRepo.findAccommodationtationByUsernameAndLocation(username, location);
        return list;
    }
}
