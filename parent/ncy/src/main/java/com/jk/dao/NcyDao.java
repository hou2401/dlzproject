/**
 * Copyright (C), 2018-2018, 金科教育有限公司
 * FileName: NcyDao
 * Author:   Administrator
 * Date:     2018-5-14 10:34
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.dao;

import com.jk.pojo.User;
import org.apache.ibatis.annotations.Param;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author Administrator
 * @create 2018-5-14
 * @since 1.0.0
 */

public interface NcyDao {
    User login(String uname);

    Integer getuserrole(Integer uid);
}
