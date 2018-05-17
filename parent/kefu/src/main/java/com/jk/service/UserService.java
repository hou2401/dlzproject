package com.jk.service;

import com.jk.dao.IUserDao;
import com.jk.pojo.User;
import com.jk.service.impl.IUserService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 再难遇 on 2018/5/17.
 */
@Service
public class UserService implements IUserService {

    @Resource
    private IUserDao userDao;


    @Override
    public User getUserById(int uid) {
        return userDao.selectByPrimaryKey(uid);
    }

    @Override
    public void insertUser(List<User> users) {
        // TODO Auto-generated method stub

    }

    @Override
    public String login(String uname, String upass) {
        User record = new User();
        record.setUname(uname);
        record.setUpass(upass);
        User user = userDao.selectUserForLogin(record);
        if(user==null){
            return "fail";
        }else{
            return "success";
        }
    }




}
