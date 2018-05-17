package com.jk.service;

import com.jk.pojo.MyShipCarid;
import com.jk.pojo.yonghu;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by 再难遇 on 2018/5/14.
 */
public interface HuiService {
//查询
    List<yonghu> getPerson();

    //新增
    void addPerson(yonghu person);

    //删除
    Integer deleteUser(Integer customerid);

    yonghu findComById(String customerid);
    //修改
    void updateCom(yonghu com);
    //zhekou
    MyShipCarid queryAllZheKou(HttpServletRequest request);
    //修改折扣
    Integer updateZheKou(Integer zheKouId, Double zheKou);

    //验证码
    Map<String, Object> yanZhengMa(String nowimageCode, HttpServletRequest request);
    //优惠包状态
    Integer queRenYouHui(String nowDate, Integer customerid);
    //查询红心用户
    Map<String, Object> queryAllPuTong(Integer page, Integer rows, Integer queryMoney);

}
