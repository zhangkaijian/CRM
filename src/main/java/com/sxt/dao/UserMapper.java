package com.sxt.dao;

import com.sxt.bean.User;

import java.util.List;

public interface UserMapper {

    User getUser(String username);

    List<User> getAllUser();

    int addUser(User user);
}
