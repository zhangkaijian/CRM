package com.sxt.controller;

import com.sxt.bean.Customer;
import com.sxt.bean.User;
import com.sxt.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
public class CustomerController {

    @Autowired
    CustomerService customerService;

    //查询所有客户
    @PostMapping("/getAllCustomer")
    @ResponseBody
    public List<Customer> getAllCustomer(String field,String key){
        List<Customer> queryAll = customerService.getAllCustomer(field,key);
        System.out.println(queryAll);
        System.out.println(field);
        System.out.println(key);
        return queryAll;
    }

    //添加客户
    @PostMapping("/addcustomer")
    @ResponseBody
    public int addcustomer(Customer customer){
        System.out.println(customer);
        int num = customerService.addcustomer(customer);
        System.out.println(num);
        return num;
    }

    //修改客户
    @PostMapping("updatecustomer")
    @ResponseBody
    public int updatecustomer(Customer customer){
        System.out.println(customer);
        int num = customerService.updatecustomer(customer);
        System.out.println(num);
        return num;
    }

    //删除客户
    @PostMapping("deletecustomer")
    @ResponseBody
    public int deletecustomer(Integer id){
        System.out.println(id);
        int num = customerService.deletecustomer(id);
        System.out.println(num);
        return num;
    }

    //查询所有用户
    @PostMapping("getAllUser")
    @ResponseBody
    public List<User> getAllUser(){
        List<User> allUser = customerService.getAllUser();

        return allUser;
    }

    @PostMapping("addUser")
    @ResponseBody
    public int addUser(User user){
        System.out.println(user);
        int num = customerService.addUser(user);
        System.out.println(num);
        return num;
    }
}
