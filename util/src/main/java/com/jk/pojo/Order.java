package com.jk.pojo;


import org.springframework.data.annotation.Transient;

public class Order {

    private  Integer orderid; //订单id

    private  Integer customerid;//用户id

    private  String customernumber;//订单编号

    private  Integer goodsid;//商品id

    private  Integer orderstate;//订单状态

    private  String  paytime;//创建时间\

    private  Integer  goodstotalprice;//购买总价

    private  String  paycount;//购买数量

    private  Integer  ordersubmitstate;//订单提交状态

    private  String  ordermodificationtime;//订单修改时间

    //业务字段
    private String customername;
    private String customerphone;
    private  String customerdizhi;
    private  String goodsname;
    private  String goodsimage;




    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername;
    }

    public String getCustomerphone() {
        return customerphone;
    }

    public void setCustomerphone(String customerphone) {
        this.customerphone = customerphone;
    }

    public String getCustomerdizhi() {
        return customerdizhi;
    }

    public void setCustomerdizhi(String customerdizhi) {
        this.customerdizhi = customerdizhi;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getGoodsimage() {
        return goodsimage;
    }

    public void setGoodsimage(String goodsimage) {
        this.goodsimage = goodsimage;
    }

    @Transient
    private int page;
    @Transient
    private int rows;

    public Integer getOrdersubmitstate() {
        return ordersubmitstate;
    }

    public void setOrdersubmitstate(Integer ordersubmitstate) {
        this.ordersubmitstate = ordersubmitstate;
    }

    public String getOrdermodificationtime() {
        return ordermodificationtime;
    }

    public void setOrdermodificationtime(String ordermodificationtime) {
        this.ordermodificationtime = ordermodificationtime;
    }

    public int getPage() {
        return page;
    }

    public void setPage(int page) {
        this.page = page;
    }

    public int getRows() {
        return rows;
    }

    public void setRows(int rows) {
        this.rows = rows;
    }

    public Integer getOrderstate() {
        return orderstate;
    }

    public void setOrderstate(Integer orderstate) {
        this.orderstate = orderstate;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public String getCustomernumber() {
        return customernumber;
    }

    public void setCustomernumber(String customernumber) {
        this.customernumber = customernumber;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getGoodstotalprice() {
        return goodstotalprice;
    }

    public void setGoodstotalprice(Integer goodstotalprice) {
        this.goodstotalprice = goodstotalprice;
    }

    public String getPaycount() {
        return paycount;
    }

    public void setPaycount(String paycount) {
        this.paycount = paycount;
    }

    public String getPaytime() {
        return paytime;
    }

    public void setPaytime(String paytime) {
        this.paytime = paytime;
    }

    @Override
    public String toString() {
        return "Order{" +
                "orderid=" + orderid +
                ", customerid=" + customerid +
                ", customernumber='" + customernumber + '\'' +
                ", goodsid=" + goodsid +
                ", orderstate=" + orderstate +
                ", paytime='" + paytime + '\'' +
                ", goodstotalprice=" + goodstotalprice +
                ", paycount='" + paycount + '\'' +
                ", ordersubmitstate=" + ordersubmitstate +
                ", ordermodificationtime='" + ordermodificationtime + '\'' +
                ", customername='" + customername + '\'' +
                ", customerphone='" + customerphone + '\'' +
                ", customerdizhi='" + customerdizhi + '\'' +
                ", goodsname='" + goodsname + '\'' +
                ", goodsimage='" + goodsimage + '\'' +
                ", page=" + page +
                ", rows=" + rows +
                '}';
    }


}
