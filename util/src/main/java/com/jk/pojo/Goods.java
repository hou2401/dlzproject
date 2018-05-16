package com.jk.pojo;


public class Goods {

    private Integer goodsid;
    //商品名称
    private String goodsname;
    //商品价格
    private String goodsprice;
    //商品类型
    private Integer typeid;
    //类型名称
    private String typename;
    //商品图片
    private String goodsimage;
    //商品时间
    private String goodstime;
    //商品下架
    private Integer goodsflag;
    //创建时间
    private String createtime;
    //修改时间
    private String updatetime;
   //商品库存
    private String goodskucun;

    public Integer getGoodsid() {
        return goodsid;
    }

    public void setGoodsid(Integer goodsid) {
        this.goodsid = goodsid;
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

    public String getGoodsimage() {
        return goodsimage;
    }

    public void setGoodsimage(String goodsimage) {
        this.goodsimage = goodsimage;
    }

    public String getGoodstime() {
        return goodstime;
    }

    public void setGoodstime(String goodstime) {
        this.goodstime = goodstime;
    }

    public Integer getGoodsflag() {
        return goodsflag;
    }

    public void setGoodsflag(Integer goodsflag) {
        this.goodsflag = goodsflag;
    }

    public String getCreatetime() {
        return createtime;
    }

    public void setCreatetime(String createtime) {
        this.createtime = createtime;
    }

    public String getUpdatetime() {
        return updatetime;
    }

    public void setUpdatetime(String updatetime) {
        this.updatetime = updatetime;
    }

    public String getGoodskucun() {
        return goodskucun;
    }

    public void setGoodskucun(String goodskucun) {
        this.goodskucun = goodskucun;
    }

    @Override
    public String toString() {
        return "Goods{" +
                "goodsid=" + goodsid +
                ", goodsname='" + goodsname + '\'' +
                ", goodsprice='" + goodsprice + '\'' +
                ", typeid=" + typeid +
                ", typename='" + typename + '\'' +
                ", goodsimage='" + goodsimage + '\'' +
                ", goodstime='" + goodstime + '\'' +
                ", goodsflag=" + goodsflag +
                ", createtime='" + createtime + '\'' +
                ", updatetime='" + updatetime + '\'' +
                ", goodskucun='" + goodskucun + '\'' +
                '}';
    }
}
