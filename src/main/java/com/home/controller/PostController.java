package com.home.controller;

import com.home.model.Post;
import com.home.tools.ViewPost;
import com.home.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
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

        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username;

        if (principal instanceof UserDetails) {
            username = ((UserDetails)principal).getUsername();
        } else {
            username = principal.toString();
        }

        List<ViewPost> viewPosts = postService.viewPosts(posts, username);

        model.addAttribute("listPost", viewPosts);
        return "main";
    }

    @RequestMapping(value = "/post/{id}")
    public String post(@PathVariable Long id, Model model){
        Post post = postService.findPostById(id);


        model.addAttribute("post", post);
        return "post";
    }

}
