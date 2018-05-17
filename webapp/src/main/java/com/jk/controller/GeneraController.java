package com.jk.controller;/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: GeneraController
 * Author:   ${韩苏雨}
 * Date:     2018/5/17 14:39
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */

import com.alibaba.fastjson.JSON;
import com.jk.pojo.Genera;
import com.jk.service.GeneraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author ${韩苏雨}
 * @create 2018/5/17
 * @since 1.0.0
 */
@Controller
@RequestMapping("genera")
public class GeneraController {

    @Autowired
    private GeneraService service;

    //商品查询
    @RequestMapping("queryGenera")
    @ResponseBody
    public String queryGenera(){
        List list = service.queryGenera();
        System.out.println(list);
        return JSON.toJSONString(list);
    }

    //商品新增
    @RequestMapping("addGenera")
    @ResponseBody
    public String addGenera(Genera genera){
        service.addGenera(genera);
        return "success";

    }
}