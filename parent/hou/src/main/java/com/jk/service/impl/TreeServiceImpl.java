/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TreeServiceImpl
 * Author:   HOU
 * Date:     2018/5/13 21:09
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.service.impl;

import com.jk.dao.TreeDao;
import com.jk.pojo.Power;
import com.jk.service.TreeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author HOU
 * @create 2018/5/13
 * @since 1.0.0
 */
@Service
public class TreeServiceImpl implements TreeService {

@Resource
    private TreeDao treeDao;

    @Override
    public List<Power> getTree(Integer id) {
        return treeDao.getTree(id);
    }

}
