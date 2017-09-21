package com.home.controller;

import com.home.model.Post;
import com.home.service.PostService;
import com.home.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
public class PostController {

    @Autowired
    private PostService postService;

    private UserService userService;
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String listPosts(Model model){
        List<Post> posts = postService.getAll();
        for (Post post : posts){
            post.getUser().getUsername();
        }
        model.addAttribute("listPost", postService.getAll());
        return "main";
    }

}
