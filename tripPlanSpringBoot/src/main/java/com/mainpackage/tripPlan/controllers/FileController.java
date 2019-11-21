/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.File;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.model.UserPrincipal;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.ServiceFile;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class FileController {

    private static final Logger logger = LoggerFactory.getLogger(FileController.class);

    @Autowired
    private ServiceFile DBFileStorageService;
    @Autowired
    UserRepo userRepo;

    @PostMapping(value = "/uploadFile")
    public ModelAndView uploadFile(@RequestParam("file") MultipartFile file) {

        UserPrincipal userPrince = (UserPrincipal) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        User user = userRepo.findByUsername(userPrince.getUsername());

        DBFileStorageService.storeFile(file, user.getUserId());
        return new ModelAndView("redirect:/user/profile");
    }

    @GetMapping(value = "/deleteFile/{id}")
    public ModelAndView deletedFile(@PathVariable("id") Integer id) {

        DBFileStorageService.deleteFile(id);
        return new ModelAndView("redirect:/user/profile");
    }

//    @PostMapping("/uploadMultipleFiles")
//    public List<UploadFileResponse> uploadMultipleFiles(@RequestParam("files") MultipartFile[] files,
//            @RequestParam("userId") long userId) {
//
//        return Arrays.stream(files)
//                .map(file -> uploadFile(file, userId))
//                .collect(Collectors.toList());
//    }
//    @GetMapping("/downloadFile/{fileId}")
//    @ResponseBody
//    public ResponseEntity<Resource> downloadFile(@PathVariable String fileId) {
//        File dbFile = DBFileStorageService.getFile(Long.parseLong(fileId));
//
//        return ResponseEntity.ok()
//                .contentType(MediaType.parseMediaType(dbFile.getFileType()))
//                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=\"" + dbFile.getFileName() + "\"")
//                .body(new ByteArrayResource(dbFile.getFileData()));
//    }
//
//    @GetMapping(value = "/getFileByName/{fileName}", produces = MediaType.APPLICATION_JSON_VALUE)
//    @ResponseBody
//    public String getFileByName(@PathVariable String fileName) {
//        File file = DBFileStorageService.getFileByName(fileName);
//
//        return DBFileStorageService.getStringImage(file.getFileData());
//    }
}
