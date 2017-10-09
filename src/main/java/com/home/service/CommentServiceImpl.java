package com.home.service;

import com.home.dao.CommentDao;
import com.home.model.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@Transactional(readOnly = true)
public class CommentServiceImpl implements CommentService {

    @Autowired
    private CommentDao commentDao;

    @Override
    public List<Comment> getAll() {
        return commentDao.findAll(sortByDateAsc());
    }

    @Override
    public Comment getComment(Long id) {
        return this.commentDao.getOne(id);
    }


    @Override
    @Transactional
    public void deleteComment(Long id) {
        this.commentDao.delete(id);
    }

    @Override
    @Transactional
    public void saveComment(Comment comment) {
        this.commentDao.save(comment);
    }

    private Sort sortByDateAsc() {
        return new Sort(Sort.Direction.DESC, "datetime");
    }
}
