package com.home.controller;

import com.home.model.Comment;
import com.home.model.Post;
import com.home.service.CommentService;
import com.home.service.PostService;
import com.home.service.UserService;
import com.home.validator.CommentValidator;
import com.home.validator.PostValidator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;


@Controller
public class PostController {

    @Autowired
    private PostService postService;

    @Autowired
    private UserService userService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private PostValidator postValidator;

    @Autowired
    private CommentValidator commentValidator;

    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public String listPosts(Model model) {

        model.addAttribute("action", "main");
        List<Post> posts = postService.getAll();
        model.addAttribute("listPost", posts);
        return "main";
    }

    @RequestMapping(value = "main/post/{id}")
    public String post(@PathVariable Long id, Model model) {

        Post post = postService.findPostById(id);

        String username = ((UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal())
                .getUsername();

        model.addAttribute("postForm", post);
        model.addAttribute("comment", new Comment());
        model.addAttribute("change", post.getUser().getUsername().equals(username));
        return "post";
    }


    @RequestMapping(path = "/main/comment/add/{post_id}", method = RequestMethod.POST)
    public String addComment(@PathVariable("post_id") Long post_id, @ModelAttribute @Valid Comment commentForm,
                             BindingResult bindingResult, Principal principal) {

        if (bindingResult.hasErrors()) {
            return "post";
        }

        DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:SS");
        LocalDateTime localDate = LocalDateTime.now();
        commentForm.setDateTime(localDate);

        commentForm.setPost(this.postService.findPostById(post_id));
        commentForm.setUser(this.userService.findByUsername(principal.getName()));
        this.commentService.saveComment(commentForm);

        return "redirect:/main/post/" + post_id.toString();
    }


    @RequestMapping(value = "/main/post/{post_id}", method = RequestMethod.POST)
    public String detailsPost(@PathVariable("post_id") Long post_id,
                              @ModelAttribute("comment") Comment commentForm,
                              Principal principal) {
        if (principal.getName() != null) {
            this.commentService.deleteComment(commentForm.getId());
        }
        return "redirect:/main/post/" + post_id.toString();
    }


    @RequestMapping(value = "/main/post/{post_id}/edit", method = RequestMethod.GET)
    public String getPost(@PathVariable Long post_id, Model model) {

        model.addAttribute("post", this.postService.findPostById(post_id));
        return "edit";
    }

    @RequestMapping(value = "/main/post/{post_id}/edit", method = RequestMethod.POST)
    public String editPost(@PathVariable Long post_id, @ModelAttribute("postForm") Post postForm, @RequestParam String action) {

        switch (action.toLowerCase()) {
            case "remove":
                this.postService.remove(postForm.getId());
                return "redirect:/main";
            case "update":
                Post post = this.postService.findPostById(postForm.getId());
                post.setTitle(postForm.getTitle());
                post.setText(postForm.getText());
                post.setTags(postForm.getTags());

                this.postService.save(post);
        }

        return "redirect:/main/post/" + post_id.toString();
    }

    @RequestMapping(value = "/main/create", method = RequestMethod.GET)
    public String createPost(Model model) {
        model.addAttribute("postForm", new Post());
        return "create";
    }


    @RequestMapping(value = "/main/create", method = RequestMethod.POST)
    public String createPost(@ModelAttribute("postForm") Post postForm, BindingResult bindingResult, Principal principal) {

        this.postValidator.validate(postForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "create";
        }

        postForm.setUser(this.userService.findByUsername(principal.getName()));

        this.postService.save(postForm);
        return "redirect:/main";
    }

}
