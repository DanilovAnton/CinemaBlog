package com.home.controller;

import com.home.model.Post;
import com.home.service.PostService;
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

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String listPosts(Model model){
        List<Post> posts = postService.getAll();
        for (Post p : posts){
            System.out.println(p.getTitle());
        }

        model.addAttribute("listPost", postService.getAll());
        return "main";
    }

}
