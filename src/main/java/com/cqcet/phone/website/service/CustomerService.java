package com.cqcet.phone.website.service;

import com.cqcet.phone.website.pojo.Customer;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface CustomerService {

    void insertByCus(Customer customer);

    Customer findCusInfoBySelective(@Param("id") String id, @Param("userName") String userName, @Param("tel") String tel,@Param("bid") String bid);

    List<Customer> findCusAllInfoBySelective(String id, String userName, String tel, String bid);

    List<Customer> findCusAll();

    int removeById(String id);

    int renewByBKID(String id);
}
