package com.cqcet.phone.website.service.impl;

import com.cqcet.phone.website.mapper.KindMapper;
import com.cqcet.phone.website.pojo.Business;
import com.cqcet.phone.website.pojo.Kind;
import com.cqcet.phone.website.service.KindService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class KindServiceImpl implements KindService {
    @Autowired
    private KindMapper kindMapper;
    @Override
    public List<Kind> findAllKind() {
        return kindMapper.selectAllKind();
    }

    @Override
    public Kind findByBKID(String bkid) {
        return kindMapper.selectByPrimaryKey(bkid);
    }

    @Override
    public int deleteKindByBKId(String id) {
        return kindMapper.deleteByPrimaryKey(id);
    }

    @Override
    public List<Kind> findKindBySelectve(String bkid, String bkName) {
        return kindMapper.selectBySelective(bkid,bkName);
    }

    @Override
    public int addKind(Kind kind) {
        return kindMapper.insertSelective(kind);
    }
}
