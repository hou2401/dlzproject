package com.jk.dao;

import com.jk.pojo.Type;

public interface TypeDao {

    void addType(Type type);

    void deleteType(Integer typeid);

    void updateType(Type type);

    Type queryAllType(Integer typeid);

    Type queryById(Integer typeid);
}
