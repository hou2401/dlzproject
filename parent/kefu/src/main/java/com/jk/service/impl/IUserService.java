package com.jk.service.impl;

import com.jk.pojo.User;

import java.util.List;

/**
 * Created by 再难遇 on 2018/5/17.
 */
public interface IUserService {

    public User getUserById(int uid);
    public void insertUser(List<User> users);
    /**
     * 登陆处理
     * @param uname
     * @param upass
     * @return
     */
    public String login(String uname, String upass);


}
