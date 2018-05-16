package com.jk.controller;/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: hanController
 * Author:   ${韩苏雨}
 * Date:     2018/5/14 11:56
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */


import com.alibaba.fastjson.JSON;
import com.jk.pojo.Goods;
import com.jk.service.HanService;
import com.jk.util.FileUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author ${韩苏雨}
 * @create 2018/5/14
 * @since 1.0.0
 */
@Controller
@RequestMapping("goods")
public class HanController {

    @Autowired
    private HanService service;


//商品查询
    @RequestMapping("queryGoods")
    @ResponseBody
    public String queryGoods(){
        List list = service.queryGoods();
        System.out.println(list);
        return JSON.toJSONString(list);
    }


    //商品类型查询
    @RequestMapping("queryType")
    @ResponseBody
    public String queryType(){
        List list = service.queryType();

        return JSON.toJSONString(list);
    }
    //商品新增
    @RequestMapping("addGoods")
    @ResponseBody
    public String addGoods(Goods goods, MultipartFile image, HttpServletRequest request){
        String url = FileUtil.upLoad(image, image.getOriginalFilename(), "image", request);
        goods.setGoodsimage(url);
       service.addGoods(goods);
        return "success";

    }
    //商品下架
    @RequestMapping("updateFlag")
    @ResponseBody
    public String updateFlag(Integer goodsid){

        service.updateFlag(goodsid);

        return "updateSuccess";

    }

    @RequestMapping("deleteGoods")
    @ResponseBody
    public String deleteGoods(Integer goodsid){

        service.deleteGoods(goodsid);

        return "deleteSuccess";

    }


    @RequestMapping("queryById")
    public String queryById(Integer goodsid,HttpServletRequest request){
        Goods goods=service.queryById(goodsid);
        request.setAttribute("goods",goods);
        return "han/update";
    }


    @RequestMapping("updateGoods")
    @ResponseBody
    public String updateGoods(Goods goods,MultipartFile image,HttpServletRequest request){
        String url = FileUtil.upLoad(image, image.getOriginalFilename(), "image", request);
        if(url=="http://localhost:8091"){
            goods.setGoodsimage("");
        }else{
            goods.setGoodsimage(url);
        }

        service.updateGoods(goods);
        return "success";
    }
}