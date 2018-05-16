/**
 * Copyright (C), 2018-2018, 金科教育有限公司
 * FileName: NcyController
 * Author:   ${牛春云}
 * Date:     2018-5-14 8:47
 * Description: 登录
 * History:
 * <author>          <time>          <version>          <desc>
 * ${牛春云}           2018-5-14 8:47           版本号              描述
 */
package com.jk.controller;

import com.alibaba.fastjson.JSON;
import com.jk.pojo.User;
import com.jk.service.NcyService;
import com.jk.util.ValidateCodeUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br> 
 * 〈登录〉
 *
 * @author ${牛春云}
 * @create 2018-5-14
 * @since 1.0.0
 */
@Controller
@RequestMapping("ncyController")
public class NcyController {

    @Autowired
    private NcyService ncyService;


    //验证码
    /**
     * 获取验证码图片以及验证码code值
     */
    @RequestMapping("/validateCode")
    public void validateCode(HttpServletRequest request, HttpServletResponse response){

        // 设置响应的类型格式为图片格式
        response.setContentType("image/jpeg");
        //禁止图像缓存。
        response.setHeader("Pragma", "no-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);

        //获取session对象
        HttpSession session = request.getSession();

        //获取验证码图片以及验证码code值
        ValidateCodeUtil vCode = new ValidateCodeUtil(100,35,4,100);

        //将验证码code值存入session当中
        session.setAttribute("code", vCode.getCode());

        try {
            //将验证码图片写入到jsp页面
            vCode.write(response.getOutputStream());
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 获取验证码图片以及验证码code值，退出登录用

	@RequestMapping("/loginOut")
	public String loginOut(HttpSession session){

		//移除session中用户信息
		session.removeAttribute("sessionUser");

		return "index";
	}*/

    //=========================================================================================

    //登陆
    @RequestMapping("login")
    @ResponseBody
    public String login(String validataCode, HttpSession session, User user, HttpServletRequest request, HttpServletResponse response){
        Map<String,Object> map=new HashMap<String,Object>();
        //String sessionCode = ServletActionContext.getRequest().getSession().getAttribute("code").toString();
        String sessionCode = session.getAttribute("code").toString();

        return JSON.toJSONString(ncyService.login(validataCode,session,sessionCode,user,request,response)) ;
    }


}
