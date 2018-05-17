package com.jk.service.impl;



import com.jk.dao.OrderDao;
import com.jk.pojo.Order;
import com.jk.service.OrderService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import java.util.List;


@Service
public class OrderServiceImpl implements OrderService {
    /**
     *
     */
    @Autowired
    private OrderDao orderDao;


    public List <Order>  queryOrder() {

        return orderDao.queryOrder();
    }

    public void updateOrderState(String customernumber ) {

        orderDao.updateOrderState(customernumber);
    }

    @Override
    public List<Order> exportExcel(String[] array) {

        return orderDao.exportExcel(array);
    }


    /**
     * a是总收入
     * t是真实收入
     * r是总退款金额
     * @param customernumber
     * @param
     * @param
     */
    public void updateOrderSubmitState(String customernumber) {

        orderDao.updateOrderSubmitState(customernumber);

    }

    public void updateFinanceBySubmitState(Integer goodstotalprice) {
        //修改财务表

        orderDao.updateFinanceBySubmitState(goodstotalprice);
    }


}
