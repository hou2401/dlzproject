package com.jk.service.Impl;/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: HanServiceImpl
 * Author:   ${韩苏雨}
 * Date:     2018/5/14 11:58
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */

import com.jk.dao.HanDao;
import com.jk.pojo.Goods;
import com.jk.pojo.SolrBean;
import com.jk.pojo.Type;
import com.jk.service.HanService;
import org.apache.solr.client.solrj.SolrServerException;
import org.apache.solr.client.solrj.impl.HttpSolrClient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author ${韩苏雨}
 * @create 2018/5/14
 * @since 1.0.0
 */
@Service
public class HanServiceImpl implements HanService{

    @Autowired
    private HanDao dao;
    @Resource
    private HttpSolrClient client;

    public List queryGoods(Goods goods) {
        return dao.queryGoods(goods);
    }

    public List queryType(Type type) {

        return dao.queryType(type);
    }

    public void addGoods(Goods goods) {
        SimpleDateFormat sim = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if(goods.getGoodsid()==null){
            goods.setCreatetime(sim.format(new Date()));
        }
        goods.setUpdatetime(sim.format(new Date()));

        dao.addGoods(goods);

       Map good = dao.queryGoodByName(goods.getGoodsname());
        SolrBean solrBean = new SolrBean();
        solrBean.setProduct_id((Long)good.get("product_id"));
        solrBean.setProduct_brandname((String)good.get("product_brandname"));
        solrBean.setProduct_goodsimage((String)good.get("product_goodsimage"));
        solrBean.setProduct_goodssales((Integer) good.get("product_goodssales"));
        solrBean.setProduct_goodssize((String)good.get("product_goodssize"));
        solrBean.setProduct_name((String) good.get("product_name"));
        solrBean.setProduct_typename((String)good.get("product_typename"));
        solrBean.setProduct_goodsprice((Double) good.get("product_goodsprice"));
        try {
            client.addBean(solrBean);
            client.commit();
            client.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SolrServerException e) {
            e.printStackTrace();
        }
    }

    public List updateFlag(Integer goodsid) {

        return dao.updateFlag(goodsid);
    }

    public void deleteGoods(Integer goodsid) {
        dao.deleteGoods(goodsid);
    }

    public void updateGoods(Goods goods) {
        dao.updateGoods(goods);
    }

    public Goods queryById(Integer goodsid) {

        return dao.queryById(goodsid);
    }



}