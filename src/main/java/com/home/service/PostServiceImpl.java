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
    public List<ViewPost> viewPosts(List<Post> posts, String username) {

        List<ViewPost> viewPost = new ArrayList<>();
        String deleteLink = null;
        String updateLink = null;

        for (Post post : posts){
            if (post.getUser().getUsername().equals(username)){
                deleteLink = "/remove/" + post.getId();
                updateLink = "/main/editpost/" + post.getId();
            }
            viewPost.add(new ViewPost(post.getId(), post.getTitle(), post.getText(), post.getUser().getUsername(), deleteLink, updateLink));
            deleteLink = null;
            updateLink = null;
        }


        return viewPost;
    }
}
