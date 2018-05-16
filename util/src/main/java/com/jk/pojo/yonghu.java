package com.jk.pojo;

/**
 * Created by 再难遇 on 2018/5/14.
 */
public class yonghu {
    private Integer customerid; //用户id

    private Integer orderid;//订单id

    private String customerphone; //手机号

    private  String  customername;  //用户名称

    private  String  customertype; //用户类型

    private Integer  customerjine; //现有金额

    private String customershijian; //会员卡开通时间

    private Integer   customerzhekou; //折扣

    private String  customerdingdan; //订单人姓名

    private String  customerdizhi;  //订单地址
    private Integer   shipCarid;  // 会员卡id

    private String shipCardDate;   // 会员卡办理时间
    private Integer shipCardYouHui;  // 会员卡优惠包状态
    private String shipCardYouHuiDate;  // 会员卡优惠包使用开始时间

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public String getCustomerphone() {
        return customerphone;
    }

    public void setCustomerphone(String customerphone) {
        this.customerphone = customerphone;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername;
    }

    public String getCustomertype() {
        return customertype;
    }

    public void setCustomertype(String customertype) {
        this.customertype = customertype;
    }

    public Integer getCustomerjine() {
        return customerjine;
    }

    public void setCustomerjine(Integer customerjine) {
        this.customerjine = customerjine;
    }

    public String getCustomershijian() {
        return customershijian;
    }

    public void setCustomershijian(String customershijian) {
        this.customershijian = customershijian;
    }

    public Integer getCustomerzhekou() {
        return customerzhekou;
    }

    public void setCustomerzhekou(Integer customerzhekou) {
        this.customerzhekou = customerzhekou;
    }

    public String getCustomerdingdan() {
        return customerdingdan;
    }

    public void setCustomerdingdan(String customerdingdan) {
        this.customerdingdan = customerdingdan;
    }

    public String getCustomerdizhi() {
        return customerdizhi;
    }

    public void setCustomerdizhi(String customerdizhi) {
        this.customerdizhi = customerdizhi;
    }

    public Integer getShipCarid() {
        return shipCarid;
    }

    public void setShipCarid(Integer shipCarid) {
        this.shipCarid = shipCarid;
    }

    public String getShipCardDate() {
        return shipCardDate;
    }

    public void setShipCardDate(String shipCardDate) {
        this.shipCardDate = shipCardDate;
    }

    public Integer getShipCardYouHui() {
        return shipCardYouHui;
    }

    public void setShipCardYouHui(Integer shipCardYouHui) {
        this.shipCardYouHui = shipCardYouHui;
    }

    public String getShipCardYouHuiDate() {
        return shipCardYouHuiDate;
    }

    public void setShipCardYouHuiDate(String shipCardYouHuiDate) {
        this.shipCardYouHuiDate = shipCardYouHuiDate;
    }

    @Override
    public String toString() {
        return "yonghu{" +
                "customerid=" + customerid +
                ", orderid=" + orderid +
                ", customerphone='" + customerphone + '\'' +
                ", customername='" + customername + '\'' +
                ", customertype='" + customertype + '\'' +
                ", customerjine=" + customerjine +
                ", customershijian='" + customershijian + '\'' +
                ", customerzhekou=" + customerzhekou +
                ", customerdingdan='" + customerdingdan + '\'' +
                ", customerdizhi='" + customerdizhi + '\'' +
                ", shipCarid=" + shipCarid +
                ", shipCardDate='" + shipCardDate + '\'' +
                ", shipCardYouHui=" + shipCardYouHui +
                ", shipCardYouHuiDate='" + shipCardYouHuiDate + '\'' +
                '}';
    }
}
