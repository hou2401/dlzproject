/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TreeDao
 * Author:   HOU
 * Date:     2018/5/13 21:10
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.dao;

import com.jk.pojo.Finance;
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
public interface TreeDao {

    List<Power> getTree(Integer id);

    List<Finance> querychar();
}
