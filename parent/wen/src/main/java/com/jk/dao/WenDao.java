package com.jk.dao;

import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface WenDao {
    List queryuser();

    void updateflag(Integer uid);



    List<Object> getUserRole(Integer uid);

    List<Object> getrole();

    void deleteuser_role(Integer uid);

    void addrole(@Param("uid")Integer uid, @Param("rids")Integer[] rid);

    /*List queryrole();*/
}
