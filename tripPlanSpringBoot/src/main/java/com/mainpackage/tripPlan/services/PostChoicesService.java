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
    public Trip tripPostChoices(Trip trip,Transportation transportation,Accommodation accommodation,
            Rental rental, User user) {

        transportation.setTypeId(transService.findTransportationByType(transportation.getTypeId().getType()));
        transportation.setTripId(trip);
        
        accommodation.setTypeId(accomoService.findAccommoByType(accommodation.getTypeId().getType()));
        accommodation.setTripId(trip);
        
        rental.setTypeId(rentalService.findRentalByType(rental.getTypeId().getType()));
        rental.setTripId(trip);
        
        trip.setAccommodationCollection(Arrays.asList(accommodation));
        trip.setTransportationCollection(Arrays.asList(transportation));
        trip.setRentalCollection(Arrays.asList(rental));

        user.setTripCollection(Arrays.asList(trip));
        trip.setUserId(user);

        return trip;
    }
}
