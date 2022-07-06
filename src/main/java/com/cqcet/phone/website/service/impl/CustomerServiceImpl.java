package com.cqcet.phone.website.service.impl;

import com.cqcet.phone.website.mapper.CustomerMapper;
import com.cqcet.phone.website.pojo.Customer;
import com.cqcet.phone.website.service.CustomerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CustomerServiceImpl implements CustomerService {
    @Autowired
    private CustomerMapper customerMapper;
    @Override
    public void insertByCus(Customer customer) {
        customerMapper.insertSelective(customer);
    }

    @Override
    public Customer findCusInfoBySelective(String id, String userName, String tel, String bid) {
        return customerMapper.selectBySelective(id,userName,tel,bid);
    }

    @Override
    public List<Customer> findCusAllInfoBySelective(String id, String userName, String tel, String bid) {
        return customerMapper.selectByAllSelective(id,userName,tel,bid);
    }

    @Override
    public List<Customer> findCusAll() {
        return customerMapper.selectAll();
    }

    @Override
    public int removeById(String id) {
        return customerMapper.deleteByPrimaryKey(Integer.valueOf(id));
    }

    @Override
    public int renewByBKID(String id) {
        return customerMapper.updateByBKId(id);
    }
}
