package com.home.service;

import com.home.dao.PostDao;
import com.home.model.Post;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PostServiceImpl implements PostService {

    @Autowired
    private PostDao postDao;

    @Override
    public List<Post> getAll() {
        return postDao.findAll();
    }

}
