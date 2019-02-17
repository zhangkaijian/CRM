package com.sxt.service;

import com.sxt.bean.User;

import java.util.List;

public interface UserService {

    User getUser(String username);

    List<User> getAllUser();

    int addUser(User user);
}
