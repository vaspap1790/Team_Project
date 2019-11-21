package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.model.File;
import org.springframework.web.multipart.MultipartFile;

public interface ServiceFile {

    File storeFile(MultipartFile file, long iduser);

    File getFile(long id);

    String getStringImage(byte[] i);

    File getFileByName(String fileName);

    File checkForFile(String username);
    
    void deleteFile(int id);
}
