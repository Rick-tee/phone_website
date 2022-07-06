package com.cqcet.phone.website.service.impl;

import com.cqcet.phone.website.mapper.BusinessMapper;
import com.cqcet.phone.website.pojo.Business;
import com.cqcet.phone.website.service.BusinessService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class BusinessServiceImpl implements BusinessService {
    @Autowired
    private BusinessMapper businessMapper;
    @Override
    public List<Business> findBusinessByBKId(String bKid) {
        return businessMapper.selectByForeignKey(bKid);
    }

    @Override
    public Business findBusinessByBId(String bid) {
        return businessMapper.selectByPrimaryKey(bid);
    }

    @Override
    public List<Business> findBusinessByAll() {
        return businessMapper.selectByAll();
    }

    @Override
    public List<Business> findBusinessBySelective(String bid, String bName) {
        return businessMapper.selectBySelective(bid,bName);
    }

    @Override
    public int addBusinessBySelect(Business business) {
        return businessMapper.insertSelective(business);
    }
}
