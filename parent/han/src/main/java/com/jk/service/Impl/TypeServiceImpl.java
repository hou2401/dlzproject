package com.jk.service.Impl;/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TypeServiceImpl
 * Author:   ${韩苏雨}
 * Date:     2018/5/15 15:37
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */

import com.jk.dao.TypeDao;
import com.jk.pojo.Type;
import com.jk.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author ${韩苏雨}
 * @create 2018/5/15
 * @since 1.0.0
 */
@Service
public class TypeServiceImpl implements TypeService{

    @Autowired
    private TypeDao dao;

    public void addType(Type type) {
        dao.addType(type);
    }

    public void deleteType(Integer typeid) {

        dao.deleteType(typeid);
    }


    public void updateType(Type type) {

        dao.updateType(type);
    }

    public Type queryById(Integer typeid) {
        return dao.queryById(typeid);
    }

}