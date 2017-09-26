package com.home.service;

import com.home.model.Post;
import com.home.tools.ViewPost;

import java.util.List;

public interface PostService {
    List<Post> getAll();

    Post findPostById(Long id);
    
    void remove(Long id);
    void save(Post post);

    List<ViewPost> viewPosts(List<Post> posts, String username);
}
