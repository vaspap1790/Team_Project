
package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.services.UserService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping(value = "user/")
public class UserController {

    @Autowired
    UserService userService;

    @GetMapping(value = "logIn")
    public String logIn(ModelMap m) {
        return "logIn";
    }

    @PostMapping(value = "postLogIn")
    public String postlogIn(ModelMap m, @RequestParam(name = "username") String username, @RequestParam(name = "password") String password) {

        String role = userService.postLogIn(username, password);
        m.addAttribute("role", role);
        
        return "result";
    }

    @GetMapping(value = "register")
    public String form(ModelMap m) {
        User user = new User();
        m.addAttribute("user", user);
        return "register";
    }

    @PostMapping(value = "postRegister")
    public String post(@Valid @ModelAttribute("user") User user, BindingResult br) {
        
        if (br.hasErrors()) {
            return "register";
        }
        userService.insert(user);

        return "redirect:/";
    }

}
