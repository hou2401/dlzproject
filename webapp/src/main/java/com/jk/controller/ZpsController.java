package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.pojo.MyShipCarid;
import com.jk.pojo.yonghu;
import com.jk.service.HuiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.ui.Model;

import javax.servlet.http.HttpServletRequest;
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

    //删除
    @RequestMapping("/deleteUser")
    @ResponseBody
    public String deleteUser(Integer customerid){
        Integer count = service.deleteUser(customerid);
        return "delSuccess";
    }
    //回显
    @RequestMapping("findComById")
    public String findComById(Model model,String customerid){
        yonghu recom = service.findComById(customerid);
        model.addAttribute("com",recom);
        return "add";
    }
    //修改
    @RequestMapping("updateCom")
    @ResponseBody
    public String updateCom(yonghu com){
        service.updateCom(com);
        return "updateSuccess";
    }


    // 查询所有的折扣
    @ResponseBody
    @RequestMapping(value = "/queryAllZheKou")
    public String queryAllZheKou(HttpServletRequest request){
        MyShipCarid myshipcard = service.queryAllZheKou(request);
        return JSON.toJSONString(myshipcard);
    }

    // 修改会员卡的折扣
    @ResponseBody
    @RequestMapping(value = "/updateZheKou")
    public String updateZheKou(Integer zheKouId,Double zheKou){
        Integer num = service.updateZheKou(zheKouId, zheKou);
        if(num > 0){
            return "success";
        }
        return "fail";
    }

    // 查询验证码是否正确
    @ResponseBody
    @RequestMapping(value = "/yanZhengMa")
    public String yanZhengMa(String nowimageCode, HttpServletRequest request){
        Map<String, Object> map = service.yanZhengMa(nowimageCode, request);
        return JSON.toJSONString(map);
    }

    // 修改优惠包状态
    @ResponseBody
    @RequestMapping(value = "/queRenYouHui")
    public String queRenYouHui(String nowDate ,Integer uid){
        Integer num = service.queRenYouHui(nowDate, uid);
        if(num > 0){
            return "success";
        }
        return "fail";
    }
    // 查询所有的普通会员
    @ResponseBody
    @RequestMapping(value = "/queryAllPuTong")
    public String queryAllPuTong(Integer rows, Integer page, Integer queryMoney){
        Map<String, Object> map = service.queryAllPuTong(page, rows, queryMoney);
        return JSON.toJSONStringWithDateFormat(map, "yyyy-MM-dd");
    }



}
