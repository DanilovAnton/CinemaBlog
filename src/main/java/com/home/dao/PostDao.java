package com.home.dao;

import com.home.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;


public interface PostDao extends JpaRepository<Post, Integer> {

    Post findPostByTitle(String title);
}
