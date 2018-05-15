/**
 * Copyright (C), 2018-2018,
 * FileName: WenServiceimpl
 * Author:   温少
 * Date:     2018/5/14 14:29
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.service.impl;

import com.jk.dao.WenDao;
import com.jk.service.WenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author 温少
 * @create 2018/5/14
 * @since 1.0.0
 */
@Service
public class WenServiceimpl implements WenService {
    @Autowired
    private WenDao dao;

    @Override
    public List queryuser() {
        return dao.queryuser();
    }

    @Override
    public void updateflag(Integer uid) {
        dao.updateflag(uid);
    }

    @Override
    public List<Object> getrole() {
        return dao.getrole();
    }

    @Override
    public List<Object> getUserRole(Integer uid) {

        return  dao.getUserRole(uid);
    }

    @Override
    public void addrole(Integer uid, Integer[] rid) {
        System.out.println(uid);
        System.out.println(rid);
        if(uid!=null&uid!=0){
            dao.deleteuser_role(uid);
        }

        dao.addrole(uid,rid);
    }

    /*@Override
    public List queryrole(){

        return dao.queryrole();

    }*/


}
