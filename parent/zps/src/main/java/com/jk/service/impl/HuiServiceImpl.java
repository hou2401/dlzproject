package com.jk.service.impl;

import com.jk.dao.HuiDao;
import com.jk.pojo.yonghu;
import com.jk.service.HuiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 再难遇 on 2018/5/14.
 */
@Service
public class HuiServiceImpl implements HuiService {

    @Autowired
    private HuiDao mapper;

//查询
    @Override
    public List<yonghu> getPerson() {
        return mapper.getPerson();
    }
//新增
    @Override
    public void addPerson(yonghu person) {
        // TODO Auto-generated method stub
        mapper.addPerson(person);
    }


}
