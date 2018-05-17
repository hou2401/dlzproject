package com.jk.service.impl;

import com.jk.dao.FinanceDao;
import com.jk.pojo.Finance;

import com.jk.service.FinanceService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

@Service
public class FinanceServiceImpl implements FinanceService {

    @Resource
    private FinanceDao financeDao;

    public List <Finance> queryFinance() {

        return financeDao.queryFinance();
    }

    public void updateOrderState(String customernumber) {

        financeDao.updateOrderState(customernumber);
    }

    public void updateFinanceState(Integer financeid) {

        financeDao.updateFinanceState(financeid);
    }

     public List<Finance> querySunmary() {

        return financeDao.querySunmary();
    }

    @Override
    public void updateSunmary(Integer goodsprice) {
        financeDao.updateSunmary(goodsprice);
    }
}
