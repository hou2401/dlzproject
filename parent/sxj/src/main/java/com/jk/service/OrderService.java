package com.jk.service;

import com.jk.pojo.Order;

import java.util.List;

public interface OrderService {

    List <Order> queryOrder();

    void updateFinanceBySubmitState(Integer goodstotalprice);

    void updateOrderSubmitState(String customernumber);

    void updateOrderState(String customernumber);

    List<Order> exportExcel(String[] array);
}
