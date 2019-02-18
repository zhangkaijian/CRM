package com.sxt.service;

import com.sxt.bean.User;

import java.util.List;
import java.util.Map;

public interface UserService {

    User getUser(String username);

    Map<String,Object> getAllUser(Integer page, Integer rows);

    int addUser(User user);
}
