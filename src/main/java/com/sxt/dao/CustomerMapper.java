package com.sxt.dao;

import com.sxt.bean.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerMapper {

    List<Customer> getAllCustomer(@Param("field")String field,@Param("key") String key);

    int addcustomer(Customer customer);

    int updatecustomer(Customer customer);

    int deletecustomer(Integer id);


}
