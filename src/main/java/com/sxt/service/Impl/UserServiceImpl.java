package com.sxt.service.Impl;

import com.sxt.bean.User;
import com.sxt.dao.UserMapper;
import com.sxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapperImpl;

    public User getUser(String username){
        return userMapperImpl.getUser(username);
    }

    public List<User> getAllUser(){
        return userMapperImpl.getAllUser();
    }

    public int addUser(User user){
        return userMapperImpl.addUser(user);
    }

}
