package com.cqcet.phone.website.service;

import com.cqcet.phone.website.pojo.Kind;

import java.util.List;

public interface KindService {
    List<Kind> findAllKind();

    Kind findByBKID(String bkid);

    int deleteKindByBKId(String id);

    List<Kind> findKindBySelectve(String bkid, String bkName);

    int addKind(Kind kind);
}
