package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.Accommodation;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.repositories.AccTypeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AccommodationService {

    @Autowired
    GenericJpaDao<Accommodation> accommodationDao;
    @Autowired
    AccTypeRepo accTypeRepo;
    
     public AccommodationType findTransportationByType(String type) {
        AccommodationType accommoType = accTypeRepo.findByType(type);
        
        return accommoType;
    }
}
