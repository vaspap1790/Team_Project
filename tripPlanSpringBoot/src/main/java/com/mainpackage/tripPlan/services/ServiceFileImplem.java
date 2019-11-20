/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.services;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.file_upload.exception.FileStorageException;
import com.mainpackage.tripPlan.model.File;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.repositories.DbFileRepository;
import com.mainpackage.tripPlan.repositories.FileRepo;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

@Service
@Transactional
public class ServiceFileImplem implements ServiceFile {

    @Autowired
    private DbFileRepository dbFileRepository;
    @Autowired
    GenericJpaDao<User> userDao;
    @Autowired
    UserService userService;
    @Autowired
    FileRepo fileRepo;
    
    @Override
    public File storeFile(MultipartFile file, long userId) {
        
       User user= userService.findByUserId(userId);
       
        // Normalize file name
        String fileName = StringUtils.cleanPath(file.getOriginalFilename());

        try {
            // Check if the file's name contains invalid characters
            if (fileName.contains("..")) {
                throw new FileStorageException("Sorry! Filename contains invalid path sequence " + fileName);
            }

            File dbFile = new File(fileName, file.getContentType(), file.getBytes(),user);

            return dbFileRepository.save(dbFile);
        } catch (IOException ex) {
            throw new FileStorageException("Could not store file " + fileName + ". Please try again!", ex);
        }
    }

    public File getFile(long id) {
        return dbFileRepository.findById(id).orElseThrow(() -> new RuntimeException("NO FILE FOUND"));
    }

    @Override
    public String getStringImage(byte[] i) {

//        ResultSet result = null;
//        Blob blob = null;
//        try {
//            assert false;
//            blob = result.getBlob("image");
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }

       InputStream inputStream = null;
        inputStream = new ByteArrayInputStream(i);
        ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
        byte[] buffer = new byte[4096];
        int bytesRead = -1;

        while (true) {
            try {
                if ((bytesRead = inputStream.read(buffer)) == -1) break;
            } catch (IOException e) {
                e.printStackTrace();
            }
            outputStream.write(buffer, 0, bytesRead);
        }

        byte[] imageBytes = outputStream.toByteArray();

        String base64Image = Base64.getEncoder().encodeToString(imageBytes);

        try {
            inputStream.close();
            outputStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

                return base64Image;
    }

    @Override
    public File getFileByName(String fileName) {
        
        return fileRepo.findByFileName(fileName);
    }

  
    
}
