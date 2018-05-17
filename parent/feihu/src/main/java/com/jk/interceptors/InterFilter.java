package com.jk.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jk.pojo.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import java.io.PrintWriter;


/**
* @author 作者 尚峰: 
* @version 创建时间：2018年3月9日 下午1:39:14 
* 类说明 
*/
public class InterFilter implements HandlerInterceptor{
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		System.out.println("执行方法为：afterCompletion");
		
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object object, ModelAndView mav)
			throws Exception {
		System.out.println("执行方法为：postHandle");
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object obj) throws Exception {
		String basePath = request.getScheme() + "://" + request.getServerName() + ":"  + request.getServerPort()+request.getContextPath();
		System.out.println("执行方法为：preHandle");
		String url=request.getRequestURI();
		System.out.println("请求路径:"+url);
		if(url.indexOf("/validateCode/login")>0){
			return true;
		}
		User loginuser=(User) request.getSession().getAttribute("user");
		if(url.equals("/wen/updateflag")){
			Integer rid = (Integer) request.getSession().getAttribute("role");
			if(rid==1){
				return true;
			}else{
				PrintWriter out = response.getWriter();
				out.print("notpower");//session失效
				out.flush();
				return false;
			}
		}
		if(loginuser != null){
			return true;
		}
		// 重定向
		String path = request.getContextPath();

		// response.sendRedirect(contextPath+"/login.jsp");
		// System.err.println("sendRedirect");
		// 转发
		if (request.getHeader("x-requested-with") != null && request.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
			//告诉ajax我是重定向
			response.setHeader("REDIRECT", "REDIRECT");
			//告诉ajax我重定向的路径
			response.setHeader("CONTEXTPATH", basePath+"/login.jsp");
			response.setStatus(HttpServletResponse.SC_FORBIDDEN);
			return false;
		} else {
			response.sendRedirect(basePath + "/login.jsp");
			return false;
		}
	}
			
}
