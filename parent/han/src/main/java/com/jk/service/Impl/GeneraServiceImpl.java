package com.jk.service.Impl;/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: GeneraServiceImpl
 * Author:   ${韩苏雨}
 * Date:     2018/5/17 14:41
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */

import com.jk.dao.GeneraDao;
import com.jk.pojo.Genera;
import com.jk.service.GeneraService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author ${韩苏雨}
 * @create 2018/5/17
 * @since 1.0.0
 */
@Service
public class GeneraServiceImpl implements GeneraService{
    @Autowired
    private GeneraDao dao;

    public List queryGenera() {
        return dao.queryGenera();
    }

    public void addGenera(Genera genera) {
        dao.addGenera(genera);
    }
}