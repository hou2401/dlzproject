package com.jk.dao;

import com.jk.pojo.yonghu;

import java.util.List;

/**
 * Created by 再难遇 on 2018/5/14.
 */
public interface HuiDao {
//查询
    List<yonghu> getPerson();

    //新增
    void addPerson(yonghu person);

}