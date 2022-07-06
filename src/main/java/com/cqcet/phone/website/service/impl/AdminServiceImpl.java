package com.cqcet.phone.website.service.impl;

import com.cqcet.phone.website.mapper.AdminMapper;
import com.cqcet.phone.website.pojo.Admin;
import com.cqcet.phone.website.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class AdminServiceImpl implements AdminService {
    @Autowired
    private AdminMapper adminMapper;
    @Override
    public Admin login(String userName,String password) {
        return adminMapper.login(userName,password);
    }
}
