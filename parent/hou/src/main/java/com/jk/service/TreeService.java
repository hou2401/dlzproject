/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TreeService
 * Author:   HOU
 * Date:     2018/5/13 21:08
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.service;

import com.jk.pojo.Highchars;
import com.jk.pojo.Power;

import java.util.List;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author HOU
 * @create 2018/5/13
 * @since 1.0.0
 */
public interface TreeService {

    List<Power> getTree(Integer id);

    List<Highchars> querychar();
}
