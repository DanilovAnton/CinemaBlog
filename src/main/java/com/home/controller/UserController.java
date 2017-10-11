package com.home.controller;

import com.home.model.User;
import com.home.service.UserService;
import com.home.validator.UserValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {

    @Autowired
    private UserService userService;

    @Autowired
    private UserValidator userValidator;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult) {

        this.userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        return "redirect:/main";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String admin(Model model) {
        return "login";
    }

    @RequestMapping(value = {"/","welcome"}, method = RequestMethod.GET)
    public String home(){
        return "welcome";
    }

    @RequestMapping(value = "main/user/{username}", method = RequestMethod.GET)
    public String user(@PathVariable String username, Model model){
        User user = userService.findByUsername(username);
        int size = user.getPosts().size();
        model.addAttribute("user", user);
        model.addAttribute("size", size);
        return "user";
    }

}
