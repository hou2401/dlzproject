package com.jk.service;

import com.jk.pojo.Goods;

import java.util.List;

public interface HanService {
    List queryGoods();

    List queryType();


    List updateFlag(Integer goodsid);

    void deleteGoods(Integer goodsid);

    void updateGoods(Goods goods);

    Goods queryById(Integer goodsid);

    void addGoods(Goods goods);
}
