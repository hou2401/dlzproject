/**
 * Copyright (C), 2018-2018, 金科教育有限公司
 * FileName: NcyServiceImpl
 * Author:   ${牛春云}
 * Date:     2018-5-14 10:39
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * ${牛春云}           2018-5-14 10:39           版本号              描述
 */
package com.jk.service.impl;


import com.jk.dao.NcyDao;
import com.jk.pojo.User;
import com.jk.service.NcyService;
import org.apache.struts2.ServletActionContext;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author ${牛春云}
 * @create 2018-5-14
 * @since 1.0.0
 */

@Service
public class NcyServiceImpl implements NcyService {

    @Resource
    private NcyDao ncyDao;


    public Map<String, Object> login(String validataCode, HttpSession session, String sessionCode, User user, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> map = new HashMap<String, Object>();
        //String  hql = " from User where uname = '"+user.getUser()+"'";
        User u = ncyDao.login(user.getUname());
        //将用户权限查出，用于拦截。
        Integer userrolelist = ncyDao.getuserrole(u.getUid());
        System.out.print(userrolelist+"-------------");
        request.getSession().setAttribute("role", userrolelist);

        String mas="";
       /* int loginFlag=0;*/
        if(u!=null){
            if(u.getUpass().equals(user.getUpass())){
                if(validataCode.equalsIgnoreCase(sessionCode)){
                    mas="success";
                    map.put("user", u);
                   // ServletActionContext.getRequest().getSession().setAttribute("user",user);
                    request.getSession().setAttribute("user", u);
                }else {
                    mas="errorcode";
                }

            }else{
                mas="passworderror";
            }
        }else{
            //用户名不存在
            mas="usererror";
        }
        map.put("mas", mas);
        return map;
    }


   /* public Map<String, Object> login(String uname, String upass, String validataCode, String sessionCode) {

        Map<String, Object> map = new HashMap<String, Object>();
        String  hql = " from User where uname = '"+uname+"'";
        User user = ncyDao.login(hql);
        String mas="";
       *//* int loginFlag=0;*//*
        if(user!=null){
            if(upass.equals(user.getUpass())){
                if(validataCode.equalsIgnoreCase(sessionCode)){
                    mas="success";
                    map.put("user", user);
                    ServletActionContext.getRequest().getSession().setAttribute("user",user);
                }else {
                    mas="errorcode";
                }

            }else{
                mas="passworderror";
            }
        }else{
            //用户名不存在
            mas="usererror";
        }
        map.put("mas", mas);
        return map;
    }*/
}
