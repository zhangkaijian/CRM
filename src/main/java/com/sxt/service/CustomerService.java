package com.sxt.service;

import com.github.pagehelper.PageInfo;
import com.sxt.bean.Customer;

import java.util.List;
import java.util.Map;

public interface CustomerService  {

    Map<String,Object> getAllCustomer(String  field, String key, Integer page, Integer rows);

    int addcustomer(Customer customer);

    int updatecustomer(Customer customer);

    int deletecustomer(Integer id);
}
