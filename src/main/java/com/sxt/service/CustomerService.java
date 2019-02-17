package com.sxt.service;

import com.sxt.bean.Customer;
import com.sxt.bean.User;
import com.sxt.dao.CustomerMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.zip.ZipEntry;

@Service
public class CustomerService {

    @Autowired
    CustomerMapper customerMapper;

    public List<Customer> getAllCustomer(String  field,String key){
        return customerMapper.getAllCustomer(field,key);
    }

    public int addcustomer(Customer customer){
        return customerMapper.addcustomer(customer);
    }

    public int updatecustomer(Customer customer){
        return customerMapper.updatecustomer(customer);
    }

    public int deletecustomer(Integer id){
        return customerMapper.deletecustomer(id);
    }


}
