package com.jk.dao;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.MongoLog;

import java.util.List;

/**
 * 创建人：张飞虎 1518786490@qq.com
 * 创建时间：2018/5/9 20:02
 * 修改人：张飞虎 1518786490@qq.com
 * 修改人电话：17611610795
 * 修改时间：2018/5/9 20:02
 * 修改备注：
 */
public interface LogDao {
    JSONObject queryLog(MongoLog mongoLog, Integer limit, Integer offset);
}
