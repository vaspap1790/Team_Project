package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.dto.TransportationDTO;
import com.mainpackage.tripPlan.model.Transportation;
import com.mainpackage.tripPlan.model.TransportationType;
import com.mainpackage.tripPlan.repositories.TranspTypeRepo;
import com.mainpackage.tripPlan.repositories.TransportationRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class TransportationService {

    @Autowired
    GenericJpaDao<Transportation> transportationDao;
    @Autowired
    TranspTypeRepo transTypeRepo;
    @Autowired
    TransportationRepo transRepo;
   
    public TransportationType findTransportationTypeByType(String type) {
        TransportationType transType = transTypeRepo.findByType(type);
        
        return transType;
    }
    
    public List<TransportationDTO> findTransportationByUsernameAndTripId(String username,String tripId){
        List<TransportationDTO> list=transRepo.findTransportationByUsernameAndLocation(username,Integer.parseInt(tripId));
        return list;
    }
}
