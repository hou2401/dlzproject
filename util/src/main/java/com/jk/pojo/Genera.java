package com.jk.pojo;/**
 * Copyright (C), 2015-2018, XXX有限公司
 * FileName: Genera
 * Author:   ${韩苏雨}
 * Date:     2018/5/17 14:43
 * Description:
 * History:
 * <author>          <time>          <version>          <desc>
 * 作者姓名           修改时间           版本号              描述
 */

import java.io.Serializable;

/**
 * 〈一句话功能简述〉<br> 
 * 〈〉
 *
 * @author ${韩苏雨}
 * @create 2018/5/17
 * @since 1.0.0
 */
public class Genera implements Serializable{

    private Integer generaid;
    private String generaname;


    public Integer getGeneraid() {
        return generaid;
    }

    public void setGeneraid(Integer generaid) {
        this.generaid = generaid;
    }

    public String getGeneraname() {
        return generaname;
    }

    public void setGeneraname(String generaname) {
        this.generaname = generaname;
    }

    @Override
    public String toString() {
        return "Genera{" +
                "generaid=" + generaid +
                ", generaname='" + generaname + '\'' +
                '}';
    }
}