/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.model.File;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author vasil
 */
public interface ServiceFile {

    File storeFile(MultipartFile file, long iduser);

    File getFile(long id);

    String getStringImage(byte[] i);
}
