package com.jk.service;

import com.jk.pojo.Type;

public interface TypeService {

    void addType(Type type);

    void deleteType(Integer typeid);

    void updateType(Type type);

    Type queryById(Integer typeid);
}
