/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.dto.UploadFileResponse;
import com.mainpackage.tripPlan.model.File;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.model.UserPrincipal;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.ServiceFile;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.support.ServletUriComponentsBuilder;

@Controller
public class FileController {

    private static final Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    private ServiceFile DBFileStorageService;
    @Autowired
    UserRepo userRepo;

    @PostMapping(value = "/uploadFile")
    @ResponseBody
    public UploadFileResponse uploadFile(@RequestParam("file") MultipartFile file) {

        UserPrincipal userPrince = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepo.findByUsername(userPrince.getUsername());

        File dbFile = DBFileStorageService.storeFile(file, user.getUserId());
        String fileDownloadUri = ServletUriComponentsBuilder.fromCurrentContextPath()
                .path("/downloadFile/")
                .path(String.valueOf(dbFile.getId()))
                .toUriString();

        return new UploadFileResponse(dbFile.getFileName(), fileDownloadUri,
                file.getContentType(), file.getSize());
    }
    


    @GetMapping(value = "/deleteFile/{id}")
    public ModelAndView deletedFile(@PathVariable("id") Integer id) {

        DBFileStorageService.deleteFile(id);
        return new ModelAndView("redirect:/user/profile");
    }

    @GetMapping(value = "/getImage")
    @ResponseBody
    public String getImage(@RequestParam("file") MultipartFile file) throws IOException {

        String image = DBFileStorageService.getStringImage(file.getBytes());
        return image;
    }

    @PostMapping("/uploadMultiplePhotos")
    @ResponseBody
    public List<UploadFileResponse> uploadMultiplePhotos(@RequestParam("photos") MultipartFile[] photos,
            @RequestParam("tripId") Integer tripId) {

      return  Arrays.stream(photos)
                .map(photo -> DBFileStorageService.uploadPhoto(photo, tripId))
                .collect(Collectors.toList());

    }


}
