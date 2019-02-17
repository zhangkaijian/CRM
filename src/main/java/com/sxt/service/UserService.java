package com.sxt.service;

import com.sxt.bean.User;
import com.sxt.dao.UserMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserService {

    @Autowired
    UserMapper userMapper;

    public User getUser(String username){
        return userMapper.getUser(username);
    }

    public List<User> getAllUser(){
        return userMapper.getAllUser();
    }

    public int addUser(User user){
        return userMapper.addUser(user);
    }

}
