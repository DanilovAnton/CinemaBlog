package com.home.service;


import com.home.dao.RoleDao;
import com.home.dao.UserDao;
import com.home.model.Role;
import com.home.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashSet;
import java.util.Set;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao userDao;

//    @Autowired
//    private RoleDao roleDao;
//
//    @Override
//    public void save(User user) {
//        user.setPassword(user.getPassword());
//        Set<Role> roles = new HashSet<>();
//        roles.add(roleDao.getOne(1L));
//        user.setRoles(roles);
//        userDao.save(user);
//    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }
}
