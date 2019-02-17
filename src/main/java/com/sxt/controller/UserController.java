package com.sxt.controller;

import com.sxt.bean.User;
import com.sxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class UserController {

    @Autowired
    UserService userService;

    //查询所有用户
    @PostMapping("getAllUser")
    @ResponseBody
    public List<User> getAllUser(){
        List<User> allUser = userService.getAllUser();

        return allUser;
    }

    @PostMapping("addUser")
    @ResponseBody
    public int addUser(User user){
        System.out.println(user);
        int num = userService.addUser(user);
        System.out.println(num);
        return num;
    }
}
