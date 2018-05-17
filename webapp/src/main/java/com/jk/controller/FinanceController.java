package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.pojo.Finance;

import com.jk.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;
import java.util.Map;

@Controller
@RequestMapping(value="/financeController")
public class FinanceController {

    @Autowired
     private FinanceService financeService;

    /**
     * 退款查询
     */
    @RequestMapping("queryFinance")
    @ResponseBody
    public String  queryFinance(){

        List <Finance> list = financeService.queryFinance();

        return JSON.toJSONString(list);
    }

    /**
     * 修改订单状态为5 退货成功 和 财务表状态为2 已退款
     *
     */
    @RequestMapping("updateOrderState")
    @ResponseBody
    public  Integer  updateOrderState(String customernumber,Integer financeid,Integer goodsprice){

        financeService.updateOrderState(customernumber);

        financeService.updateFinanceState(financeid);

        financeService.updateSunmary(goodsprice);

        return 2;

    }
    /**
     * 财务总信息查询
     */
    @RequestMapping("querySunmary")
    @ResponseBody
    public  String querySunmary(){
        List <Finance> list = financeService.querySunmary();

        return JSON.toJSONString(list);

    }
}
