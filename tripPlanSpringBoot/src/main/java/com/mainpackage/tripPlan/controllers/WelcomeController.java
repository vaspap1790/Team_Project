package com.mainpackage.tripPlan.controllers;

import com.mainpackage.tripPlan.daos.GenericJpaDao;
import com.mainpackage.tripPlan.model.User;
import com.mainpackage.tripPlan.repositories.UserRepo;
import com.mainpackage.tripPlan.services.UserService;
import com.mainpackage.tripPlan.utilities.Check;
import com.mainpackage.tripPlan.utilities.Encryption;
import java.io.IOException;
import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class WelcomeController {

    @Autowired
    UserService userService;
    @Autowired
    GenericJpaDao<User> userDao;
    @Autowired
    Encryption encrypt;
    @Autowired
    UserRepo userRepo;
    @Autowired
    Check check;

    @GetMapping(value = "/login")
    public String login() {
        return "forms/logIn";
    }

    @GetMapping(value = "/")
    public String home() {
        return "index";
    }

    @GetMapping(value = "/register")
    public String form(ModelMap m) {
        m.addAttribute("user", new User());
        return "forms/register";
    }

    @PostMapping(value = "/postRegister")
    public ModelAndView post(HttpServletRequest request, @Valid @ModelAttribute("user") User user,
            BindingResult br, ModelMap m, HttpSession session,RedirectAttributes redirectAttrs) throws IOException, SQLException {

        if (br.hasErrors()) {
            return new ModelAndView("redirect:/register");
        }

        if (check.isNotNull(userRepo.findByUsername(user.getUsername()))) {
            redirectAttrs.addFlashAttribute("error","This username is already in use");
            return new ModelAndView("redirect:/register");
        }
        String originalPass = user.getPassword();
        if (check.isUser(user)) {
            userService.insert(user);
        }
        session.setAttribute("pass", originalPass);

        session.setAttribute("user", user);
        return new ModelAndView("redirect:/login");
    }

    @GetMapping(value = "contact")
    public String contact(ModelMap m) {

        return "main/contact";
    }

}
