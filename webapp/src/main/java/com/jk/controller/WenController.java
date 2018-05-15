/**
 * Copyright (C), 2018-2018,
 * FileName: WenController
 * Author:   温少
 * Date:     2018/5/14 14:51
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.pojo.Role;
import com.jk.pojo.User;
import com.jk.pojo.User_role;
import com.jk.service.WenService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author 温少
 * @create 2018/5/14
 * @since 1.0.0
 */
@Controller
@RequestMapping("wen")
public class WenController {
    @Autowired
    private WenService service;

    @RequestMapping("queryuser")
    @ResponseBody
    public List queryuser(){
      List list= service.queryuser();
        return list;
    }

    @RequestMapping("updateflag")
    @ResponseBody
    public Map<String, Object> updateflag(Model model, Integer uid){
        Map<String,Object> map = new HashMap<String, Object>();
        try {
            service.updateflag(uid);
            map.put("success", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success", false);
        }
        return map;
    }
    @RequestMapping("tojue")
    public ModelAndView tojue(Integer id){
        ModelAndView mv=new ModelAndView("wen/jue");
        mv.addObject("id", id);

        return mv;
    }
    @RequestMapping("getrole")
    @ResponseBody
    public Map<String, List<Object>> getrole(Integer id){
        Map<String, List<Object>> rol =new HashMap<String,  List<Object>>();
        List<Object> role=service.getrole();
        List<Object> ur=service.getUserRole(id);

        rol.put("roles", role);
        rol.put("list", ur);


        return rol;
    }
    @RequestMapping("addrole")
    @ResponseBody
    public Map<String,Object> addrole(Integer uid,@RequestParam(value="rid") Integer[] rid){
        Map<String,Object> map = new HashMap<String, Object>();
        try {

            service.addrole(uid,rid);
            map.put("success",true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("success",false);
        }
        return map;
    }
    /*@RequestMapping("queryrole")
    @ResponseBody
    public List queryrole(){
        List list= service.queryrole();
        return list;
    }*/
}
