package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.model.User;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {

    public void uploadFile(MultipartFile file, User user) {

        if (!(file.isEmpty()) && (file.getSize() < 104857600)) {

            String filename = file.getOriginalFilename();

            if (filename.length() > 30) {
                filename = filename.substring(0, 29);
            }
            
            user.setProfilePhoto(file);
        }
    }
    
}
