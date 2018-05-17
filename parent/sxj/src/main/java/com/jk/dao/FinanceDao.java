package com.jk.dao;

import com.jk.pojo.Finance;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

public interface FinanceDao {

    List <Finance> queryFinance();

    void updateOrderState(String customernumber);

    void updateFinanceState(Integer financeid);

    List <Finance> querySunmary();

    void updateSunmary(Integer goodsprice);
}
