package com.jk.dao;

import com.jk.pojo.yonghu;
import org.apache.ibatis.annotations.Param;

import javax.servlet.http.HttpServletRequest;
import java.util.List;
import java.util.Map;

/**
 * Created by 再难遇 on 2018/5/14.
 */
public interface HuiDao {
//查询
    List<yonghu> getPerson();

    //新增
    void addPerson(yonghu person);

    //删除
    Integer deleteUser(@Param("customerid") Integer customerid);

    //回显
    yonghu findComById(String customerid);

    //修改
    void updateCom(yonghu com);
//zhekou
    List queryAllZheKou();
//xiugai折扣
    Integer updateZheKou(@Param("zheKouId") Integer zheKouId, @Param("zheKou") Double zheKou);

    //修改优惠包状态
    Integer queRenYouHui(@Param("nowDate") String nowDate, @Param("customerid") Integer customerid);
//查询红心会员
    List queryAllPuTong(Integer page, Integer rows, Integer queryMoney);

    Integer selectPuTongCount(Integer queryMoney);
//修改状态
    Integer updateZhuangTai(Integer customerid);
//查询该用户会员卡的详细信息
    yonghu queryOneUser(@Param("customerid") Integer customerid);


}
