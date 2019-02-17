package com.sxt.service;

import com.sxt.bean.Customer;

import java.util.List;

public interface CustomerService  {

    List<Customer> getAllCustomer(String  field, String key);

    int addcustomer(Customer customer);

    int updatecustomer(Customer customer);

    int deletecustomer(Integer id);
}
