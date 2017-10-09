package com.home.service;

import com.home.model.Comment;

import java.util.List;

public interface CommentService {

    List<Comment> getAll();

    Comment getComment(Long id);

    void saveComment(Comment comment);
}
