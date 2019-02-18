package com.sxt.controller;

import com.sxt.bean.Customer;
import com.sxt.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
public class CustomerController {

    @Autowired
    CustomerService customerServiceImpl;

    //分页+条件查询所有客户
    @PostMapping("/getAllCustomer")
    @ResponseBody
    public Map<String,Object> getAllCustomer(String field, String key, Integer page, Integer rows){
        Map<String, Object> Customer = customerServiceImpl.getAllCustomer(field, key, page, rows);
        return Customer;
    }

    //添加客户
    @PostMapping("/addcustomer")
    @ResponseBody
    public int addcustomer(Customer customer){
        System.out.println(customer);
        int num = customerServiceImpl.addcustomer(customer);
        System.out.println(num);
        return num;
    }

    //修改客户
    @PostMapping("updatecustomer")
    @ResponseBody
    public int updatecustomer(Customer customer){
        System.out.println(customer);
        int num = customerServiceImpl.updatecustomer(customer);
        System.out.println(num);
        return num;
    }

    //删除客户
    @PostMapping("deletecustomer")
    @ResponseBody
    public int deletecustomer(Integer id){
        System.out.println(id);
        int num = customerServiceImpl.deletecustomer(id);
        System.out.println(num);
        return num;
    }

}
