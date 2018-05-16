package com.jk.dao;

import com.jk.pojo.Goods;

import java.util.List;

public interface HanDao {
    List queryGoods();

    List queryType();

    List updateFlag(Integer goodsid);

    void deleteGoods(Integer goodsid);

    void updateGoods(Goods goods);

    Goods queryAllGoods(Integer goodsid);

    Goods queryById(Integer goodsid);

    void addGoods(Goods goods);
}
