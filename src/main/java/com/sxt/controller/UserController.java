package com.sxt.controller;

import com.sxt.bean.User;
import com.sxt.service.Impl.UserServiceImpl;
import com.sxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
public class UserController {

    @Autowired
    UserService userServiceImpl;

    //用插件分页查询所有用户
    @PostMapping("getAllUser")
    @ResponseBody
    public Map<String,Object> getAllUser(Integer page, Integer rows){
        Map<String,Object> allUser = userServiceImpl.getAllUser(page, rows);
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
