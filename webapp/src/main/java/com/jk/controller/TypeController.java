package com.jk.controller;/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TypeController
 * Author:   ${韩苏雨}
 * Date:     2018/5/15 15:32
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
import com.alibaba.fastjson.JSON;
import com.jk.pojo.Type;
import com.jk.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author ${韩苏雨}
 * @create 2018/5/15
 * @since 1.0.0
 */
@Controller
@RequestMapping("type")
public class TypeController {

    @Resource
    private TypeService service;

    //商品新增
    @RequestMapping("addType")
    @ResponseBody
    public String addType(Type type){

        service.addType(type);
        return "addSuccess";

    }


    @RequestMapping("deleteType")
    @ResponseBody
    public String deleteType(Integer typeid){

        service.deleteType(typeid);

        return "deleteSuccess";

    }
    @RequestMapping("queryById")
    public String queryById(Integer typeid,HttpServletRequest request){
        Type type=service.queryById(typeid);
        request.setAttribute("type",type);
        return "han/typeupdate";
    }


    @RequestMapping("updateType")
    @ResponseBody
    public String updateType(Type type){
      service.updateType(type);
        return "success";
    }

}