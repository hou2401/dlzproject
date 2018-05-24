package com.jk.pojo;

import org.apache.solr.client.solrj.beans.Field;

/**
 * 创建人：张飞虎 1518786490@qq.com
 * 创建时间：2018/5/24 15:25
 * 修改人：张飞虎 1518786490@qq.com
 * 修改人电话：17611610795
 * 修改时间：2018/5/24 15:25
 * 修改备注：
 */
public class SolrBean {
   /*  <field column="goodsid" name="product_id"/>
    <field column="goodsname" name="product_name"/>
    <field column="goodsimage" name="product_goodsimage"/>
    <field column="goodssize" name="product_goodssize"/>
	<field column="goodssales" name="product_goodssales"/>
	<field column="goodsprice" name="product_goodsprice"/>
	<field column="typename" name="product_typename"/>
	<field column="brandname" name="product_brandname"/>*/
   private Integer product_id;
   private String product_name;
   private String product_goodsimage;
   private String product_goodssize;
   private Double product_goodssales;
   private String product_typename;
   private String product_brandname;

    public Integer getProduct_id() {
        return product_id;
    }
    @Field
    public void setProduct_id(Integer product_id) {
        this.product_id = product_id;
    }

    public String getProduct_name() {
        return product_name;
    }
    @Field
    public void setProduct_name(String product_name) {
        this.product_name = product_name;
    }

    public String getProduct_goodsimage() {
        return product_goodsimage;
    }
    @Field
    public void setProduct_goodsimage(String product_goodsimage) {
        this.product_goodsimage = product_goodsimage;
    }

    public String getProduct_goodssize() {
        return product_goodssize;
    }
    @Field
    public void setProduct_goodssize(String product_goodssize) {
        this.product_goodssize = product_goodssize;
    }

    public Double getProduct_goodssales() {
        return product_goodssales;
    }
    @Field
    public void setProduct_goodssales(Double product_goodssales) {
        this.product_goodssales = product_goodssales;
    }

    public String getProduct_typename() {
        return product_typename;
    }
    @Field
    public void setProduct_typename(String product_typename) {
        this.product_typename = product_typename;
    }

    public String getProduct_brandname() {
        return product_brandname;
    }
    @Field
    public void setProduct_brandname(String product_brandname) {
        this.product_brandname = product_brandname;
    }
}
