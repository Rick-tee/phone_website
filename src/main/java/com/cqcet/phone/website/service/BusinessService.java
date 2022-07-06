package com.cqcet.phone.website.service;

import com.cqcet.phone.website.pojo.Business;

import java.util.List;

public interface BusinessService {
    List<Business> findBusinessByBKId(String bKid);

    Business findBusinessByBId(String bid);

    List<Business> findBusinessByAll();

    List<Business> findBusinessBySelective(String bid, String bName);

    int addBusinessBySelect(Business business);
}
