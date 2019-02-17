package com.sxt.controller;

import com.sxt.bean.User;
import com.sxt.service.Impl.UserServiceImpl;
import com.sxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService userServiceImpl;

    //查询所有用户
    @PostMapping("getAllUser")
    @ResponseBody
    public List<User> getAllUser(){
        List<User> allUser = userServiceImpl.getAllUser();

        return allUser;
    }

    //添加用户
    @PostMapping("addUser")
    @ResponseBody
    public int addUser(User user){
        System.out.println(user);
        int num = userServiceImpl.addUser(user);
        System.out.println(num);
        return num;
    }
}
