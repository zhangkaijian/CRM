package com.sxt.service.Impl;

import com.sxt.bean.Customer;
import com.sxt.bean.User;
import com.sxt.dao.CustomerMapper;
import com.sxt.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.zip.ZipEntry;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerMapper customerMapperImpl;

    public List<Customer> getAllCustomer(String  field,String key){
        return customerMapperImpl.getAllCustomer(field,key);
    }

    public int addcustomer(Customer customer){
        return customerMapperImpl.addcustomer(customer);
    }

    public int updatecustomer(Customer customer){
        return customerMapperImpl.updatecustomer(customer);
    }

    public int deletecustomer(Integer id){
        return customerMapperImpl.deletecustomer(id);
    }


}
