/**
 * Copyright (C), 2018-2018, 金科教育有限公司
 * FileName: NcyService
 * Author:   Administrator
 * Date:     2018-5-14 10:35
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.service;

import com.jk.pojo.User;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author Administrator
 * @create 2018-5-14
 * @since 1.0.0
 */
public interface NcyService {

    Map<String,Object> login(String validataCode, HttpSession session, String sessionCode, User user, HttpServletRequest request, HttpServletResponse response);
}
