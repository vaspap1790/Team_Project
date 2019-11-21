/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.Photo;
import org.springframework.data.repository.CrudRepository;

/**
 *
 * @author vasil
 */
public interface DbPhotoRepo extends CrudRepository<Photo, Integer>{
    
    
}
