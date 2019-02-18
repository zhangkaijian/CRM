package com.sxt.dao;

import com.sxt.bean.User;

import java.util.List;

public interface UserMapper {

    User getUser(String username);

    List<User> getAllUser(Integer page, Integer rows);

    int addUser(User user);
}
