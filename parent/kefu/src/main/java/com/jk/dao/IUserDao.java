package com.jk.dao;

import com.jk.pojo.User;

/**
 * Created by 再难遇 on 2018/5/17.
 */
public interface IUserDao {

    User selectUserForLogin(User record);

    User selectByPrimaryKey(int uid);
}
