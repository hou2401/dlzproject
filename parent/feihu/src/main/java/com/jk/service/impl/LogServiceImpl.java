package com.jk.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.jk.pojo.MongoLog;
import com.jk.service.LogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * 创建人：张飞虎 1518786490@qq.com
 * 创建时间：2018/5/9 20:02
 * 修改人：张飞虎 1518786490@qq.com
 * 修改人电话：17611610795
 * 修改时间：2018/5/9 20:02
 * 修改备注：
 */
@Service
public class LogServiceImpl implements LogService{

    @Autowired
    private MongoTemplate mongoTemplate;
    @Override
    public JSONObject queryLog(MongoLog logPojo, Integer limit, Integer offset) {
        Criteria criteria = new Criteria();

        if(logPojo.getMethodname()!=null&&!"".equals(logPojo.getMethodname())){
            criteria.and("methodname").regex(logPojo.getMethodname());
        }
        if(logPojo.getEndTime()!=null&&!"".equals(logPojo.getEndTime())){
            if(logPojo.getStartTime()!=null&&!"".equals(logPojo.getStartTime())){
                criteria.and("startTime").lte(logPojo.getEndTime()).gte(logPojo.getStartTime());
            }else{
                criteria.and("startTime").lte(logPojo.getEndTime());
            }
        }else if(logPojo.getStartTime()!=null&&!"".equals(logPojo.getStartTime())){
            criteria.and("startTime").gte(logPojo.getStartTime());
        }
        if(logPojo.getState()!=null&&logPojo.getState()!=-1){
            criteria.and("state").is(logPojo.getState());
        }

/*		Query query = new Query(Criteria.where("methodname").regex(logPojo.getMethodname()));
*/
        Query query = new Query();
        query.with(new Sort(new Sort.Order(Sort.Direction.DESC,"startTime")));
        query.skip(offset).limit(limit);
        query.addCriteria(criteria);
        //查询当前页
        List<MongoLog> logPojos = mongoTemplate.find(query,MongoLog.class);
        //查询总条数
/*		long total = mongoTemplate.count(new Query(Criteria.where("methodname").regex(logPojo.getMethodname())), LogPojo.class);
*/      long total = mongoTemplate.count(query, MongoLog.class);
        JSONObject json = new JSONObject();
        json.put("total", total);
        json.put("rows", logPojos);
        return json;
    }
}
