package com.jk.service.impl;

import com.jk.dao.HuiDao;
import com.jk.pojo.MyShipCarid;
import com.jk.pojo.ShipCard;
import com.jk.pojo.yonghu;
import com.jk.service.HuiService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 再难遇 on 2018/5/14.
 */
@Service
public class HuiServiceImpl implements HuiService {

    @Autowired
    private HuiDao mapper;


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

    //删除
    @Override
    public Integer deleteUser(Integer customerid) {

        return  mapper.deleteUser(customerid);
    }

    //回显
    @Override
    public yonghu findComById(String customerid) {

        return mapper.findComById(customerid);
    }
    //修改
    @Override
    public void updateCom(yonghu com) {
        mapper.updateCom(com);

    }
//查看折扣
    @Override
    public MyShipCarid queryAllZheKou(HttpServletRequest request) {
        List<ShipCard> li = mapper.queryAllZheKou();
        MyShipCarid myship = new MyShipCarid();
        for(int i = 0 ; i < li.size() ; i ++ ){
            if(li.get(i).getCarId() == 1){
                myship.setMyPuTongId(li.get(i).getCarId());
                myship.setMyPuTongZheKou(li.get(i).getCaprice());
            }
            if(li.get(i).getCarId() == 2){
                myship.setMyBoJinId(li.get(i).getCarId());
                myship.setMyBoJinZheKou(li.get(i).getCaprice());
            }
            if(li.get(i).getCarId() == 3){
                myship.setMyZuanShiId(li.get(i).getCarId());
                myship.setMyZuanShiZheKou(li.get(i).getCaprice());
            }
        }
        request.getSession().setAttribute("shipCard", myship);
        return myship;
    }
//修改折扣
    @Override
    public Integer updateZheKou(Integer zheKouId, Double zheKou) {
        Integer num = mapper.updateZheKou(zheKouId, zheKou);
        return num;
    }

    @Override
    public Map<String, Object> yanZhengMa(String nowimageCode, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        String code = (String)request.getSession().getAttribute("rand");
        if(code.equals(nowimageCode)){
            map.put("success", true);
            map.put("prompt", "验证成功！！！");
        }else{
            map.put("success", false);
            map.put("prompt", "验证码输入错误！！！");
        }
        return map;
    }
//优惠包状态
    @Override
    public Integer queRenYouHui(String nowDate, Integer customerid) {
        Integer num = mapper.queRenYouHui(nowDate, customerid);
        return num;
    }
//查询红心会员
    @Override
    public Map<String, Object> queryAllPuTong(Integer page, Integer rows, Integer queryMoney) {
        Map<String, Object> map = new HashMap<String, Object>();
        Integer count = mapper.selectPuTongCount(queryMoney);
        page = (page - 1) * rows;
        List li = mapper.queryAllPuTong(page, rows, queryMoney);
        map.put("total", count);
        map.put("rows", li);
        return map;
    }

    // 改状态的方法
    private Integer updateZhuangTai(Integer customerid){
        Integer num = mapper.updateZhuangTai(customerid);
        if(num > 0){
            return 1;
        }
        return 2;
    }


}
