package com.home.controller;

import com.home.model.Post;
import com.home.service.PostService;
import com.home.service.UserService;
import com.home.tools.ViewPost;
import javafx.geometry.Pos;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;


@Controller
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String listPosts(Model model) {
        List<Post> posts = postService.getAll();
        model.addAttribute("listPost", posts);
        return "main";
    }

    @RequestMapping(value = "main/post/{id}")
    public String post(@PathVariable Long id, Model model) {

        Post post = postService.findPostById(id);

        String username = ((UserDetails)SecurityContextHolder.getContext().getAuthentication().getPrincipal())
            .getUsername();

        model.addAttribute("postForm", post);
        model.addAttribute("change",post.getUser().getUsername().equals(username));
        return "post";
    }


    @RequestMapping(value = "/main/post/{id}", method = RequestMethod.POST)
    public String actionsPost(@ModelAttribute("postForm") Post postForm, @RequestParam String action) {
        switch (action.toLowerCase()) {
            case "update":
                this.postService.save(postForm);
                break;
            case "remove":
                this.postService.remove(postForm.getId());
        }
        return "redirect:/main";
    }

    @RequestMapping(value = "/main/create", method = RequestMethod.GET)
    public String createPost(Model model) {
        model.addAttribute("postForm", new Post());
        return "create";
    }

    @RequestMapping(value = "/main/create", method = RequestMethod.POST)
    public String createPost(@ModelAttribute("postForm") Post postForm) {

        UserDetails principal = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.getUsername();

        postForm.setUser(this.userService.findByUsername(username));

        this.postService.save(postForm);
        return "redirect:/main";
    }


}
