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
import org.apache.solr.common.SolrInputDocument;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import sun.net.www.protocol.http.HttpURLConnection;

import javax.annotation.Resource;
import java.io.DataOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.URL;
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

        Boolean aBoolean = runHttpGet();
    }

    public void updateFlag(Integer goodsid) {

        dao.updateFlag(goodsid);
        Boolean aBoolean = runHttpGet();
    }

    public void deleteGoods(Integer goodsid) {
        dao.deleteGoods(goodsid);
        Boolean aBoolean = runHttpGet();
    }

    public void updateGoods(Goods goods) {
        dao.updateGoods(goods);
        Boolean aBoolean = runHttpGet();
    }

    public Goods queryById(Integer goodsid) {

        return dao.queryById(goodsid);
    }

    public static Boolean runHttpGet(){
        Boolean flag = false;
        //设置请求的路径
        String strUrl="http://localhost:7070/solr/new_core/dataimport?command=full-import";
        //将请求的参数进行UTF-8编码，并转换成byte数组=
        try {
            //创建一个URL对象
            URL url=new URL(strUrl);
            //打开一个HttpURLConnection连接
            HttpURLConnection urlConn=(HttpURLConnection)url.openConnection();
            //设置连接超时的时间
            urlConn.setDoOutput(true);
            //在使用post请求的时候，设置不能使用缓存
            urlConn.setUseCaches(false);
            //设置该请求为post请求
            urlConn.setRequestMethod("GET");
            urlConn.setInstanceFollowRedirects(true);
            //配置请求content-type
            urlConn.setRequestProperty("Content-Type", "application/json, text/javascript");
            //执行连接操作
            urlConn.connect();
            //发送请求的参数
            DataOutputStream dos=new DataOutputStream(urlConn.getOutputStream());
            dos.flush();
            dos.close();

            if(urlConn.getResponseCode()==200){
                flag = true;
                //显示
                InputStreamReader isr = new InputStreamReader(urlConn.getInputStream(), "utf-8");
                int i;
                String strResult = "";
                // read
                while ((i = isr.read()) != -1) {
                    strResult = strResult + (char) i;
                }
                //System.out.println(strResult.toString());
                isr.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }

}