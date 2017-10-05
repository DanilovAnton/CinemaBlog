package com.home.service;

import com.home.dao.PostDao;
import com.home.model.Post;
import com.home.tools.ViewPost;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Service
@Transactional(readOnly = true)
public class PostServiceImpl implements PostService {

    @Autowired
    private PostDao postDao;

    @Override
    public List<Post> getAll() {
        return postDao.findAll();
    }

    @Override
    @Transactional
    public Post findPostById(Long id) {
        return postDao.findPostById(id);
    }

    @Override
    @Transactional
    public void remove(Long id) {
        postDao.delete(id);
    }


    @Override
    public ViewPost viewPost(Post post, String username) {
        return  new ViewPost(post.getId(), post.getTitle(), post.getText(),
                post.getUser().getUsername(), post.getUser().getUsername().equals(username));
    }

    @Override
    @Transactional
    public void save(Post post) {
        this.postDao.save(post);
    }
}
