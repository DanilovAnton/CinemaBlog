package com.home.service;

import com.home.model.Post;

import java.util.List;

public interface PostService {
    List<Post> getAll();

    Post findPostById(Long id);

}
