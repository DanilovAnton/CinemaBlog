package com.home.dao;

import com.home.model.Post;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;


public interface PostDao extends JpaRepository<Post, Long> {

    @Query("select t from Post t where t.id = ?1")
    Post findPostById(Long id);

}
