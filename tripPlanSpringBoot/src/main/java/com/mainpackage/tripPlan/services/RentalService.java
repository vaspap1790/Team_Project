package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.Rental;
import com.mainpackage.tripPlan.model.RentalType;
import com.mainpackage.tripPlan.repositories.RentTypeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class RentalService {

    @Autowired
    GenericJpaDao<Rental> rentalDao;
    @Autowired
    RentTypeRepo rentTypeRepo;
    
      public RentalType findTransportationByType(String type) {
        RentalType rentalType = rentTypeRepo.findByType(type);
        
        return rentalType;
    }
      
}
