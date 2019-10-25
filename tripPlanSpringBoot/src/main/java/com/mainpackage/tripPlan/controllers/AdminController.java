
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.Admin;
import com.mainpackage.tripPlan.services.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "admin/")
public class AdminController {

    @Autowired
    AdminService adminService;
    
    @GetMapping(value = "adminRegister")
    public String form(ModelMap m) {
        
        Admin admin = new Admin();
        m.addAttribute("admin", admin);
        return "forms/adminRegister";
    }

    @PostMapping(value = "postRegister")
    public ModelAndView post(@ModelAttribute("admin") Admin admin) {

        adminService.insert(admin);

        return new ModelAndView("redirect:/");
    }

    @GetMapping(value="administration")
    public String administration (){
        return "administration/admin";
    }
}

