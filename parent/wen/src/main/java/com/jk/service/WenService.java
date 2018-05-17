package com.jk.service;

import com.jk.pojo.User;

import java.util.List;

public interface WenService {
    List queryuser();

    void updateflag(Integer uid);


    List<Object> getrole();

    List<Object> getUserRole(Integer uid);

    void addrole(Integer uid, Integer[] rid);

    List queryrole();

    List<Object> getpower();

    List<Object> getRolePower(Integer rid);

    void addquan(Integer rid, Integer[] pid);

    Integer addUser(User user);
}
