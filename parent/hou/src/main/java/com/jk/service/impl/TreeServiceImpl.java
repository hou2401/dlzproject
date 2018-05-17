/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: TreeServiceImpl
 * Author:   HOU
 * Date:     2018/5/13 21:09
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */
package com.jk.service.impl;

import com.jk.dao.TreeDao;
import com.jk.pojo.Finance;
import com.jk.pojo.Highchars;
import com.jk.pojo.Power;
import com.jk.service.TreeService;

import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author HOU
 * @create 2018/5/13
 * @since 1.0.0
 */
@Service
public class TreeServiceImpl implements TreeService {

@Resource
    private TreeDao treeDao;

    @Override
    public List<Power> getTree(Integer id) {
        return treeDao.getTree(id);
    }

    @Override
    public List<Highchars> querychar() {
        List<Finance> list = treeDao.querychar();
        List<Highchars> chars = new ArrayList<Highchars>();
        Highchars hi =new Highchars();
        Highchars he =new Highchars();
        Highchars ht =new Highchars();
        Double sr = 0.0;
        Double zc = 0.0;
        Double lr = 0.0;
        for (Finance f : list) {
            sr+=f.getTradingvolume();
            zc+=f.getRefundamount();

            lr+=f.getActualamount();
        }
        hi.setName("收入");
        hi.setY(sr);
        he.setName("退款");
        he.setY(zc);
        ht.setName("利润");
        ht.setY(lr);
        chars.add(hi);
        chars.add(he);
        chars.add(ht);
        return chars;
    }


}
