package com.jk.controller;

import com.jk.pojo.yonghu;
import com.jk.service.HuiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by 再难遇 on 2018/5/14.
 */
@Controller
@RequestMapping("zpsTree")
public class ZpsController {

    @Autowired
    private HuiService service;

    //查询
    @RequestMapping("getPerson")
    @ResponseBody
    public Map<String,Object> getPerson(yonghu person, Integer limit, Integer offset, String sort, String order){
        System.out.println(person);
        System.out.println(limit);
        System.out.println(offset);
        System.out.println(order);
        System.out.println(sort);
        Map<String,Object> map = new HashMap<String, Object>();
        map.put("total", service.getPerson().size());
        map.put("rows", service.getPerson());
        return map;
    }

    //新增
    @RequestMapping("addPerson")
    @ResponseBody
    public  String addPerson(yonghu person){
        service.addPerson(person);
        return "addSuccess";

    }


}
