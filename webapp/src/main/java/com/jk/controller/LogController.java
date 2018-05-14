package com.jk.controller;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.MongoLog;
import com.jk.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 创建人：张飞虎 1518786490@qq.com
 * 创建时间：2018/5/14 11:10
 * 修改人：张飞虎 1518786490@qq.com
 * 修改人电话：17611610795
 * 修改时间：2018/5/14 11:10
 * 修改备注：
 */
@Controller
@RequestMapping("log")
public class LogController {

    @Autowired
    private LogService logService;

    @RequestMapping("queryLog")
    @ResponseBody
    public JSONObject queryLog(MongoLog mongoLog,Integer limit,Integer offset){
        JSONObject json  = logService.queryLog(mongoLog,limit,offset);
        return json;
    }
}
