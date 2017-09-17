package com.home.service;


import com.home.model.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
