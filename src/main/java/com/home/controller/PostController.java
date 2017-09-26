package com.home.controller;

import com.home.model.Post;
import com.home.service.UserService;
import com.home.tools.ViewPost;
import com.home.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;


@Controller
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String listPosts(Model model){
        List<Post> posts = postService.getAll();

        UserDetails principal =(UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.getUsername();

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

    @RequestMapping(value = "/main/post/edit/{id}")
    public String updatePost(@PathVariable Long id, Model model){
        Post post = this.postService.findPostById(id);
        model.addAttribute("post", post);
        return "edit";
    }

    @RequestMapping(value = "/main/post/remove/{id}")
    public String removePost(@PathVariable Long id){
        this.postService.remove(id);
        return "redirect:/main";
    }

    @RequestMapping(value = "/main/create", method = RequestMethod.GET)
    public String createPost(Model model){
        model.addAttribute("postForm", new Post());
        return "create";
    }

    @RequestMapping(value = "/main/create", method = RequestMethod.POST)
    public String createPost(@ModelAttribute("postForm") Post postForm){

        UserDetails principal =(UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String username = principal.getUsername();

        postForm.setUser(this.userService.findByUsername(username));

        postForm.setComments(null);
        this.postService.save(postForm);
        return "create";
    }


}
