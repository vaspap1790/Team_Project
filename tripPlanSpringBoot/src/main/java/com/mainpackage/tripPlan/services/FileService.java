package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.model.User;
import java.io.IOException;
import java.sql.Blob;
import java.sql.SQLException;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Service
public class FileService {

    public void setUserPhoto(MultipartFile file, User user) throws IOException, SQLException {

        if (!(file.isEmpty()) && (file.getSize() < 104857600)) {

            String filename = file.getOriginalFilename();

            if (filename.length() > 30) {
                filename = filename.substring(0, 29);
            }
            byte[] bytes = file.getBytes();
            Blob blob = new javax.sql.rowset.serial.SerialBlob(bytes);
            user.setProfilePhoto(blob);
        }
    }

}
