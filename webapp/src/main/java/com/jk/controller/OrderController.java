package com.jk.controller;


import com.alibaba.fastjson.JSON;
import com.jk.pojo.Order;
import com.jk.service.OrderService;
import java.io.File;

import java.io.FileOutputStream;
import java.io.OutputStream;

import java.util.List;



import com.jk.utils.FileUtil;

import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




@Controller
@RequestMapping("orderController")
public class OrderController {

    @Autowired
   private OrderService service;

    /**
     * 查询订单信息
     */
    @RequestMapping("queryOrder")
    @ResponseBody
    public  String  queryOrder(){

        List<Order>  list = service.queryOrder();

        return  JSON.toJSONString(list);
    }
    /**
     * 修改订单状态  根据传入的订单号修改 订单表确认退款 状态改为4 订单表修改时间为当前时间
     * 需要将这个时间传到退款列表中 并更新订单修改时间
     */
    @RequestMapping("updateOrderState")
    @ResponseBody
    public Integer   updateOrderState(String customernumber){

        service.updateOrderState(customernumber);

        return  4;

    }
    /**
     * 修改订单表状态 修改时间
     * 修改财务表收款信息 更新时间
     */
    @RequestMapping("updateOrderSubmitState")
    @ResponseBody
    public  Integer  updateOrderSubmitState(Integer goodstotalprice,String customernumber){
        System.out.println("我是超人"+goodstotalprice+customernumber);
        service.updateFinanceBySubmitState(goodstotalprice);

        service.updateOrderSubmitState(customernumber);

        return  4;
    }

    public static String filePath="D:\\order.xlsx";

    @RequestMapping("exportExcel")
    public  void  exportExcel(String customernumber,HttpServletRequest request,HttpServletResponse response){
        System.out.println(customernumber);
        //1.查数据 将传入的字符串转化为数组

        String [] array = customernumber.split(",");

        List <Order>  list = service.exportExcel(array);

        XSSFWorkbook xssfWorkbook=new XSSFWorkbook();

        XSSFSheet createSheet = xssfWorkbook.createSheet();

        XSSFRow creattitle = createSheet.createRow(0);

        creattitle.createCell(6).setCellValue("订单信息表");

        XSSFRow createRow = createSheet.createRow(1);

        createRow.createCell(0).setCellValue("订单编号");
        createRow.createCell(1).setCellValue("创建时间");
        createRow.createCell(2).setCellValue("买家信息");
        createRow.createCell(3).setCellValue("买家电话");
        createRow.createCell(4).setCellValue("收货信息");
        createRow.createCell(5).setCellValue("商品信息");
        createRow.createCell(6).setCellValue("购买总价");
        createRow.createCell(7).setCellValue("购买数量");
        createRow.createCell(8).setCellValue("商品图片");
        createRow.createCell(9).setCellValue("订单状态");
        createRow.createCell(10).setCellValue("提交状态");
        createRow.createCell(11).setCellValue("修改时间");

        for (int i = 0; i < list.size(); i++) {

            XSSFRow row = createSheet.createRow(i + 2); //创建行

            row.createCell(0).setCellValue(list.get(i).getCustomernumber());

            System.out.println("第"+i+"次数据"+list.get(i).getCustomernumber());

            row.createCell(1).setCellValue(list.get(i).getPaytime());
            row.createCell(2).setCellValue(list.get(i).getCustomername());
            row.createCell(3).setCellValue(list.get(i).getCustomerphone());
            row.createCell(4).setCellValue(list.get(i).getCustomerdizhi());
            row.createCell(5).setCellValue(list.get(i).getGoodsname());
            row.createCell(6).setCellValue(list.get(i).getGoodstotalprice());
            row.createCell(7).setCellValue(list.get(i).getPaycount());
            row.createCell(8).setCellValue(list.get(i).getGoodsimage());
            if(list.get(i).getOrderstate()==1){
                row.createCell(9).setCellValue("未付款");
            }
            if(list.get(i).getOrderstate()==2){
                row.createCell(9).setCellValue("已付款");
            }
            if(list.get(i).getOrderstate()==3){
                row.createCell(9).setCellValue("客户退款");
            }
            if(list.get(i).getOrderstate()==4){
                row.createCell(9).setCellValue("退货中");
            }
            if(list.get(i).getOrderstate()==5){
                row.createCell(9).setCellValue("退货完成");
            }
            //提交状态
            if(list.get(i).getOrdersubmitstate()==0){
                row.createCell(10).setCellValue("新建状态");
            }
            if(list.get(i).getOrdersubmitstate()==1){
                row.createCell(10).setCellValue("提交财务");
            }
            if(list.get(i).getOrdersubmitstate()==2){
                row.createCell(10).setCellValue("死亡状态");
            }
            row.createCell(11).setCellValue(list.get(i).getOrdermodificationtime());
        }

        OutputStream out = null;
            try {
                out = new FileOutputStream(new File(filePath));
                xssfWorkbook.write(out);
                out.flush();
                out.close();
            } catch (Exception e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
            FileUtil.downloadFile(request, response, filePath, "订单信息表.xlsx");
            new File(filePath).delete();


    }
}
