package com.home.dao;

import com.home.model.Comments;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CommentDao extends JpaRepository<Comments, Integer> {

}
