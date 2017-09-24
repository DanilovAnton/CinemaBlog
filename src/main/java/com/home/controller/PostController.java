package com.home.controller;

import com.home.model.Comment;
import com.home.model.Post;
import com.home.service.CommentService;
import com.home.service.PostService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;
import java.util.Set;

@Controller
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private CommentService commentService;


    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String listPosts(Model model){
        List<Post> posts = postService.getAll();
        for (Post post : posts){
            post.getUser().getUsername();
        }
        model.addAttribute("listPost", postService.getAll());
        return "main";
    }

    @RequestMapping(value = "/post/{id}")
    public String post(@PathVariable Long id, Model model){
        Post post = postService.findPostById(id);
        model.addAttribute("post", post);
        return "post";
    }

}
