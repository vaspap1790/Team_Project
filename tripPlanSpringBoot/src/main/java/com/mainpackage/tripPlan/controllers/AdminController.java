
package com.mainpackage.tripPlan.controllers;


import javax.servlet.http.HttpSession;
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

//    @Autowired
//    AdminService adminService;
    
    @GetMapping(value = "adminRegister")
    public String form(ModelMap m) {
        
//        Admin admin = new Admin();
//        m.addAttribute("admin", admin);
        return "forms/adminRegister";
    }

//    @PostMapping(value = "postRegister")
//    public ModelAndView post(@ModelAttribute("admin") Admin admin) {
//
//        adminService.insert(admin);
//
//        return new ModelAndView("redirect:/");
//    }

    @GetMapping(value="administration")
    public String administration (){
        return "administration/admin";
    }
    
    @GetMapping(value="users")
    public String users (){
        return "administration/users";
    }
    
    @GetMapping(value="administrators")
    public String administrators (){
        return "administration/administrators";
    }
    
    @GetMapping(value="posts")
    public String posts (){
        return "administration/posts";
    }
    
    @GetMapping(value="pages")
    public String pages (){
        return "administration/pages";
    }
    
    @GetMapping(value="logout")
    public ModelAndView logout (HttpSession session){
        session.invalidate();
        return new ModelAndView("redirect:/");
    }
}

