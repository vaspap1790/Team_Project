
package com.mainpackage.tripPlan.controllers;


import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.repositories.UserRepo;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import java.lang.Iterable;
import java.util.*;
import javax.transaction.Transactional;

@Controller
@RequestMapping(value = "admin/")
public class AdminController {

//    @Autowired
//    AdminService adminService;
    @Autowired
    UserRepo userRepo;
    


    @GetMapping(value="administration")
    @Transactional
    public String administration (ModelMap m){
        
        List<User> users=userRepo.findAllUsers();
        m.addAttribute("users",users);
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

