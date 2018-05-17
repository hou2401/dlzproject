package com.jk.dao;

import com.jk.pojo.Goods;
import com.jk.pojo.Type;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface HanDao {
    List queryGoods(@Param("goods") Goods goods);

    List queryType(@Param("type")Type type);

    List updateFlag(Integer goodsid);

    void deleteGoods(Integer goodsid);

    void updateGoods(Goods goods);

    Goods queryAllGoods(Integer goodsid);

    Goods queryById(Integer goodsid);

    void addGoods(Goods goods);
}
