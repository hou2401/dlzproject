/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: HouController
 * Author:   HOU
 * Date:     2018/5/13 21:07
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.controller;

import com.jk.pojo.Power;
import com.jk.service.TreeService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author HOU
 * @create 2018/5/13
 * @since 1.0.0
 */
@Controller
@RequestMapping("tree")
public class HouController {

    @Resource
    private TreeService treeService;

    @RequestMapping("getTree")
    @ResponseBody
    public List<Map<String,Object>> getTree(Integer id){
        List<Power> list = treeService.getTree(id);
        return treeStr(list, 0);
    }
    public List<Map<String,Object>> treeStr(List<Power> list, Integer pid){

        //定义返回变量
        List<Map<String,Object>> newlist = new ArrayList<Map<String,Object>>();
        //循环所有数据
        for (int i = 0; i < list.size(); i++) {
            //定义以个map集合  用来存放 单个节点数据
            Map<String,Object> map = null;
            //获取单个对象数据
            Power m = list.get(i);
            //判断当前节点是否存在父节点
            if(m.getPid().equals(pid)){
                map = new HashMap<String, Object>();
                map.put("id", m.getId());
                map.put("text", m.getText());
                map.put("url", m.getUrl());
                map.put("nodes",treeStr(list,m.getId()));
            }
            if(map!=null){
                //获取子节点数据
                List<Map<String,Object>>  l = (List<Map<String,Object>>)map.get("nodes");
                //如果没有子节点数据 移除 nodes
                if(l.size() == 0){
                    map.remove("nodes");
                }
                newlist.add(map);
            }
        }

        return newlist;
    }

}
