package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.dto.AccommodationDTO;
import com.mainpackage.tripPlan.dto.DailyBudgetDTO;
import com.mainpackage.tripPlan.dto.NotesDTO;
import com.mainpackage.tripPlan.dto.TransportationDTO;
import com.mainpackage.tripPlan.dto.TripDTO;
import com.mainpackage.tripPlan.model.Accommodation;
import com.mainpackage.tripPlan.model.AccommodationType;
import com.mainpackage.tripPlan.model.Transportation;
import com.mainpackage.tripPlan.model.TransportationType;
import com.mainpackage.tripPlan.model.Trip;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.repositories.TripRepo;
import com.mainpackage.tripPlan.utilities.Check;
import java.util.Arrays;
import java.util.List;
import java.util.*;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
//@Transactional
public class TripService {

    @Autowired
    GenericJpaDao<Trip> tripDao;
    @Autowired
    GenericJpaDao<Accommodation> accoDao;
    @Autowired
    AccommodationService accomoService;
    @Autowired
    GenericJpaDao<Transportation> transDao;
    @Autowired
    TransportationService transService;
    @Autowired
    Check check;
    @Autowired
    TripRepo tripRepo;
    @Autowired
    TripPageService tripPageService;

    public void saveTripUser(Trip trip, User user) {
        trip.setUserId(user);
        user.setTripCollection(Arrays.asList(trip));
        tripDao.save(trip);

    }

    public void saveTripAccommodation(Trip trip, Accommodation acco, AccommodationType accoType) {
        check.checkAccommoName(acco);
        acco.setTypeId(accomoService.findAccommoTypeByType(accoType.getType()));
        acco.setTripId(trip);
        trip.setAccommodationCollection(Arrays.asList(acco));

        accoDao.save(acco);
    }

    public void saveTripTransportation(Trip trip, Transportation trans, TransportationType transType) {

        trans.setTypeId(transService.findTransportationTypeByType(transType.getType()));
        trans.setTripId(trip);
        trip.setTransportationCollection(Arrays.asList(trans));

        transDao.save(trans);
    }

    public List<TripDTO> findUserTripsByUsername(String username) {

        return tripRepo.findTripsByUsername(username);
    }

    public Trip findTripById(Integer id) {
        return tripRepo.findTripById(id);
    }

    public void saveTrip(Trip trip) {
        tripDao.save(trip);
    }

    public Map<String, Object> getTripsPageDataByUsernameAndTripId(String username, String id) {
        
        List<TransportationDTO> transp = transService.findTransportationByUsernameAndTripId(username, id);
        List<AccommodationDTO> accommo = accomoService.findTransportationByUsernameAndTripId(username, id);
        List<NotesDTO> notes = tripPageService.getNotesById(Integer.parseInt(id));
        List<DailyBudgetDTO> db = tripPageService.getDailyBudgetById(Integer.parseInt(id));
        Trip tr=findTripById(Integer.parseInt(id));
        
        Map<String, Object> trip = new HashMap<>();
        trip.put("username",username);
        trip.put("location", tr.getLocation());
        trip.put("accommodation", accommo);
        trip.put("transportation", transp);
        trip.put("notes",notes);
        trip.put("dailyBudget",db);
    
        return trip;
    }
}
