package com.jk.service;

import com.jk.pojo.Finance;

import java.util.List;
import java.util.Map;

public interface FinanceService {

    List <Finance> queryFinance();

    void updateOrderState(String customernumber);

    void updateFinanceState(Integer financeid);

    List<Finance> querySunmary();

    void updateSunmary(Integer goodsprice);
}
