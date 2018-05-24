package com.jk.pojo;

import java.io.Serializable;

public class Type implements Serializable{

    private Integer typeid;

    private String typename;
    private Integer generaid;
    private String generaname;

    @Override
    public String toString() {
        return "Type{" +
                "typeid=" + typeid +
                ", typename='" + typename + '\'' +
                ", generaid=" + generaid +
                ", generaname='" + generaname + '\'' +
                '}';
    }

    public Integer getTypeid() {
        return typeid;
    }

    public void setTypeid(Integer typeid) {
        this.typeid = typeid;
    }

    public String getTypename() {
        return typename;
    }

    public void setTypename(String typename) {
        this.typename = typename;
    }

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
}
