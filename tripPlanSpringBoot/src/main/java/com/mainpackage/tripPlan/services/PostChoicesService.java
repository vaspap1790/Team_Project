package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.Accommodation;
import com.mainpackage.tripPlan.model.Rental;
import com.mainpackage.tripPlan.model.Transportation;
import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.model.User;
import java.util.Arrays;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PostChoicesService {
    
    @Autowired
    TransportationService transService;
    @Autowired
    AccommodationService accomoService;
    @Autowired
    RentalService rentalService;
    @Autowired
    GenericJpaDao<User> userDao;
    @Autowired
    GenericJpaDao<Trip> tripDao;
    
    @Transactional
    public Trip tripPostChoices(Trip trip, String transportationType, String accommodationType, String rentalType,User user) {
        
        Transportation transp = new Transportation();
        transp.setTypeId(transService.findTransportationByType(transportationType));
        
        Accommodation acco = new Accommodation();
        acco.setTypeId(accomoService.findTransportationByType(accommodationType));
        
        Rental rental = new Rental();
        rental.setTypeId(rentalService.findTransportationByType(rentalType));
        
        trip.setAccommodationCollection(Arrays.asList(acco));
        trip.setTransportationCollection(Arrays.asList(transp));
        trip.setRentalCollection(Arrays.asList(rental));
        
        user.setTripCollection(Arrays.asList(trip));
        trip.setUserId(user);
//        userDao.update(user);
        tripDao.save(trip);
        return trip;
    }
}
