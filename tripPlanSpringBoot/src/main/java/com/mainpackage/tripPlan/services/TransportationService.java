package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.Transportation;
import com.mainpackage.tripPlan.model.TransportationType;
import com.mainpackage.tripPlan.repositories.TranspTypeRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TransportationService {

    @Autowired
    GenericJpaDao<Transportation> transportationDao;
    @Autowired
    TranspTypeRepo transTypeRepo;

   
    public TransportationType findTransportationByType(String type) {
        TransportationType transType = transTypeRepo.findByType(type);
        
        return transType;
    }
}
