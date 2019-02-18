package com.sxt.service.Impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sxt.bean.Customer;
import com.sxt.dao.CustomerMapper;
import com.sxt.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class CustomerServiceImpl implements CustomerService {

    @Autowired
    CustomerMapper customerMapper;

    //用插件分页查询
    public Map<String,Object> getAllCustomer(String  field, String key, Integer page, Integer rows){
        //调用插件
        PageHelper.startPage(page,rows);
        //调用mapper查询所有用户
        List<Customer> allCustomer = customerMapper.getAllCustomer(field, key);
        //用插件分页
        PageInfo<Customer>pageInfo = new PageInfo<Customer>(allCustomer);
        //得到分页后的集合
        List<Customer> customers = pageInfo.getList();
        //总页数
        long total = pageInfo.getTotal();

        Map<String,Object> map = new HashMap<String, Object>();
        map.put("total",total);
        map.put("rows",customers);
        return map;
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
