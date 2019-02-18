package com.sxt.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sxt.bean.User;
import com.sxt.dao.UserMapper;
import com.sxt.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    UserMapper userMapper;

    public User getUser(String username){
        return userMapper.getUser(username);
    }

    //用插件分页
    public Map<String,Object> getAllUser(Integer page, Integer rows){
        //调用插件
        PageHelper.startPage(page,rows);
        //调用mapper查询所有用户
        List<User> allUser = userMapper.getAllUser(page, rows);
        //用插件分页
        PageInfo<User> pageInfo = new PageInfo<User>(allUser);
        //得到分页后的集合
        List<User> users = pageInfo.getList();
        //得到总页数
        long total = pageInfo.getTotal();

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("total",total);
        map.put("rows",users);
        return map;
    }

    public int addUser(User user){
        return userMapper.addUser(user);
    }

}
