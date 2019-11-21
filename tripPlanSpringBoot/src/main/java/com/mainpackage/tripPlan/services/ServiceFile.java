package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.dto.UploadFileResponse;
import com.mainpackage.tripPlan.model.File;
import com.mainpackage.tripPlan.model.Photo;
import org.springframework.web.multipart.MultipartFile;

public interface ServiceFile {

    File storeFile(MultipartFile file, long iduser);
    
    Photo storePhoto(MultipartFile file, Integer tripId);

    File getFile(long id);

    String getStringImage(byte[] i);

    File getFileByName(String fileName);

    File checkForFile(String username);
    
    void deleteFile(int id);
    
    public  UploadFileResponse uploadPhoto(MultipartFile file, Integer tripId);
}
