/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.DummyModels.DummyDailyBudget;
import com.mainpackage.tripPlan.DummyModels.DummyNotes;
import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.DailyBudget;
import com.mainpackage.tripPlan.model.Notes;
import com.mainpackage.tripPlan.model.Trip;
import java.text.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TripPageService {

    @Autowired
    GenericJpaDao<Notes> notesDAO;
    @Autowired
    TripService tripService;
    @Autowired
    GenericJpaDao<DailyBudget> budgetDAO;

    public void saveNotes(DummyNotes dummy) throws ParseException {
        try{
        Trip trip = tripService.findTripById(dummy.getTripId());
        notesDAO.save(new Notes(dummy.getTitle(), dummy.getBody(),dummy.getDate(), trip));
        }catch(Exception e){
            e.printStackTrace();
        }
    }
    
      public void saveBudget(DummyDailyBudget dummy) throws ParseException {
        try{
        Trip trip = tripService.findTripById(dummy.getTripId());
        budgetDAO.save(new DailyBudget(dummy.getDayBudget(),dummy.getDate(),trip));
        }catch(Exception e){
            e.printStackTrace();
        }
    }
}
