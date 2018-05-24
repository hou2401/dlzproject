package com.jk.service;

import com.jk.pojo.Goods;
import com.jk.pojo.Type;

import java.util.List;

public interface HanService {
    List queryGoods(Goods goods);

    List queryType(Type type);

    void updateFlag(Integer goodsid);

    void deleteGoods(Integer goodsid);

    void updateGoods(Goods goods);

    Goods queryById(Integer goodsid);

    void addGoods(Goods goods);
}
