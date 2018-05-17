package com.jk.pojo;

public class Finance {

    private Integer financeid;//财务表id；

    private Integer orderid;//订单id；

    private Integer goodsid;//商品id；

    private Integer customerid;//客户id；

    private Integer financestate;//申请退款时间；

    private String  financedate;//退款状态；

    private Integer tradingvolume;//成交金额

    private Integer refundamount;//退款金额

    private Integer actualamount;//实际金额

    private String financenewdate;//创建时间也就是财务表更新的时间

    //业务字段
    private String customernumber;//订单号
    private String customername;//用户名
    private String goodsname;//商品名
    private String goodsprice;//商品价格
    private String customerphone;//用户手机号

    public String getCustomernumber() {
        return customernumber;
    }

    public void setCustomernumber(String customernumber) {
        this.customernumber = customernumber;
    }

    public String getCustomername() {
        return customername;
    }

    public void setCustomername(String customername) {
        this.customername = customername;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public String getGoodsprice() {
        return goodsprice;
    }

    public void setGoodsprice(String goodsprice) {
        this.goodsprice = goodsprice;
    }

    public String getCustomerphone() {
        return customerphone;
    }

    public void setCustomerphone(String customerphone) {
        this.customerphone = customerphone;
    }

    public Integer getTradingvolume() {
        return tradingvolume;
    }

    public void setTradingvolume(Integer tradingvolume) {
        this.tradingvolume = tradingvolume;
    }

    public Integer getRefundamount() {
        return refundamount;
    }

    public void setRefundamount(Integer refundamount) {
        this.refundamount = refundamount;
    }

    public Integer getActualamount() {
        return actualamount;
    }

    public void setActualamount(Integer actualamount) {
        this.actualamount = actualamount;
    }

    public String getFinancenewdate() {
        return financenewdate;
    }

    public void setFinancenewdate(String financenewdate) {
        this.financenewdate = financenewdate;
    }

    public Integer getFinanceid() {
        return financeid;
    }

    public void setFinanceid(Integer financeid) {
        this.financeid = financeid;
    }

    public Integer getOrderid() {
        return orderid;
    }

    public void setOrderid(Integer orderid) {
        this.orderid = orderid;
    }

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
    }

    public Integer getCustomerid() {
        return customerid;
    }

    public void setCustomerid(Integer customerid) {
        this.customerid = customerid;
    }

    public Integer getFinancestate() {
        return financestate;
    }

    public void setFinancestate(Integer financestate) {
        this.financestate = financestate;
    }

    public String getFinancedate() {
        return financedate;
    }

    public void setFinancedate(String financedate) {
        this.financedate = financedate;
    }

    @Override
    public String toString() {
        return "Finance{" +
                "financeid=" + financeid +
                ", orderid=" + orderid +
                ", goodsid=" + goodsid +
                ", customerid=" + customerid +
                ", financestate=" + financestate +
                ", financedate='" + financedate + '\'' +
                ", tradingvolume=" + tradingvolume +
                ", refundamount=" + refundamount +
                ", actualamount=" + actualamount +
                ", financenewdate='" + financenewdate + '\'' +
                ", customernumber='" + customernumber + '\'' +
                ", customername='" + customername + '\'' +
                ", goodsname='" + goodsname + '\'' +
                ", goodsprice='" + goodsprice + '\'' +
                ", customerphone='" + customerphone + '\'' +
                '}';
    }
}
