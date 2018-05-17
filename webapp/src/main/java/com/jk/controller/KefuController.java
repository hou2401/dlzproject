package com.jk.controller;

import com.jk.service.impl.IUserService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by 再难遇 on 2018/5/17.
 */
@Controller
@RequestMapping("/user")
public class KefuController extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 95163763702302820L;

    @Resource
    private IUserService userService;

    //获取session
    HttpSession session ;
    ServletContext application;

    /**
     * 控制跳转到登录界面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value="/toLogin")
    public String toLogin(HttpServletRequest request, Model model){
        return "login";
    }

    /**
     * 执行登录操作
     * @param request
     * @param model
     * @param out
     */
    @RequestMapping(value="/login",method = RequestMethod.POST)
    public void login(HttpServletRequest request,Model model,PrintWriter out){
        String uname = request.getParameter("uname");
        String upass = request.getParameter("upass");
        String s = userService.login(uname, upass);
        session = request.getSession();
        if(s=="success"){
            session.setAttribute("uname", uname); // 保存当前登录的用户名
            //
            application = request.getSession().getServletContext();
            if(application.getAttribute("onLine")==null){
                application.setAttribute("onLine", "");
            }
            String onLine = application.getAttribute("onLine").toString();
            onLine += uname+"<br/>";
            application.setAttribute("onLine", onLine);
        }
        //写入返回结果
        out.write(s);
    }

    /**
     * 控制跳转到聊天主界面
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/toChatMain")
    public String toChatMain(HttpServletRequest request,Model model){
        return "chatMain";
    }


    /**
     * 前端发送聊天内容 
     * @param request
     * @param model
     */
    @RequestMapping("sentContent")
    public void sentContent(HttpServletRequest request,Model model,PrintWriter out){
        //存储信息的全局变量  
        application = request.getSession().getServletContext();
        session = request.getSession();
        if(application.getAttribute("message")==null){
            application.setAttribute("message", "");
        }
        //获取application中存储的聊天内容  
        String sourceMessage = application.getAttribute("message").toString();
        //获取前端发送的聊天内容  
        String content = request.getParameter("content");
        content = content.replace("<:", "<img src='/img/");
        content = content.replace(":>", ".gif'/>");
        // 获取session中的登陆者  
        String uname = session.getAttribute("uname").toString();
        sourceMessage += this.getTime()+ "<font color='blue'><strong> "+uname+"</strong></font> :"+content+"</br>";
        application.setAttribute("message", sourceMessage);
        //写入返回结果  
        out.write("success");
    }

    /**
     * 自定义日期格式
     * @return
     */
    private String getTime(){
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
        return df.format(date);
    }

    /**
     * 前端定时获取聊天信息
     * @param request
     * @param model
     * @param out
     */
    @RequestMapping("/getMassageList")
    public void getMassageList(HttpServletRequest request,Model model,PrintWriter out){
        application = request.getSession().getServletContext();
        if(application.getAttribute("message")==null){
            application.setAttribute("message", "");
        }
        //获取application中存储的聊天内容
        String sourceMessage = application.getAttribute("message").toString();
        String str = null;
        try {
            str = new String (sourceMessage.getBytes(), "utf-8");
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        out.write(str);
    }
    /**
     * 前端定时获取在线人员
     * @param request
     * @param model
     * @param out
     */
    @RequestMapping("getOnlineList")
    public void getOnlineList(HttpServletRequest request,Model model,PrintWriter out){
        application = request.getSession().getServletContext();
        if(application.getAttribute("onLine")==null){
            application.setAttribute("onLine", "");
        }
        //获取application中存储在 线人员
        String sourceOnline = application.getAttribute("onLine").toString();
        out.write(sourceOnline);
    }


}
