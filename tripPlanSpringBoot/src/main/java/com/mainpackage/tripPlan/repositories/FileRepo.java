/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.repositories;

import com.mainpackage.tripPlan.model.File;
import java.util.List;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface FileRepo extends CrudRepository<File, Integer> {

    @Query("SELECT f FROM File f WHERE f.fileName = :fileName")
    File findByFileName(@Param("fileName") String fileName);
    
    @Query("SELECT f FROM File f inner join f.idUser u WHERE  u.username=:username")
    File findFileByUsername(@Param("username") String username);

    @Query("SELECT f FROM File f inner join f.idUser u WHERE  u.userId=:userId")
    File findFileByUserId(@Param("userId") Integer userId);
    
    @Query("SELECT f FROM File f WHERE f.id = :id")
    File findByFileId(@Param("id") Integer id);
}
