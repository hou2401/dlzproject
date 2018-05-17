package com.jk.dao;

import com.jk.pojo.Order;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;


public interface OrderDao {

    List <Order>  queryOrder();

    void updateOrderSubmitState(String customernumber );

    void updateFinanceBySubmitState(Integer goodstotalprice);

    void updateOrderState(String customernumber);

    List<Order> exportExcel(@Param("array") String[] array);
}
