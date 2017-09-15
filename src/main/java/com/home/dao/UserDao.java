package com.home.dao;

import com.home.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserDao  extends JpaRepository<User, Long>{
    User findByUsername(String username);
}
