<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

	<!-- 这是jquery的核心包  -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
	<!-- jqeuy默认的css样式 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/icon.css">
	</head>
	<!-- 这是easyui的核心包  -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/util-js.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>

</head>
<body>
	<div id="PuTongDataLayout" data-options="fit:true" class="easyui-layout" style="width:600px;height:400px;">   
	    <div data-options="region:'north',title:'条件查询',split:true" style="height:100px;">
	    	<br/><input id="ss" class="easyui-searchbox" style="width:300px" data-options="searcher:qq,prompt:'请输入',menu:'#mm'"></input> 
			&nbsp;&nbsp;&nbsp;
			<input type = "button" value = "查询全部" id = "PuTongChaXunId">
			<div id="mm" style="width:120px"> 
				<div data-options="name:'queryMoney',iconCls:'1'">查询用户金额</div> 
			</div> 
	    </div>   
	    <div data-options="region:'center',title:'数据展示'" style="padding:5px;background:#eee;">
	    	<table id="puTongData"></table>  
	    </div>   
	</div> 
	 
<script>

	$("#PuTongChaXunId").click(function(){
		puTongChaXun();
	})
	function qq(){ 
		searcher:puTongChaXun();
	} 

	$(function(){
		puTongChaXun();
	})
	
	function puTongChaXun(){
		var names = $('#ss').searchbox('getName');
		$('#puTongData').datagrid({    
		    url:"<%=request.getContextPath()%>/zpsTree/queryAllPuTong",
		    columns:[[
				{field:"customerid",title:"编号"},
				{field:"orderid",title:"订单id"},
				{field:"customerphone",title:"手机号",align:"center"},
				{field:"customername",title:"用户名称",sortable:true},

				{field:"customertype",title:"用户类型"},
				{field:"customerjine",title:"现有金额",
					formatter: function(value,row,index){
						var nowMoneyTiShi = "";
						if(row.customerjine < 10 && row.customerjine >= 0){
							nowMoneyTiShi = "<font color = 'red'> 余额不足十元 </font>";
						}
						if(row.customerjine < 0 && row.customerjine >= -30){
							nowMoneyTiShi = "<font color = 'red'> 余额已欠(原价购物) </font>";
						}
						return row.customerjine + nowMoneyTiShi;
					}
				},
				{field:"customershijian",title:"会员开通时间",align:"center"},
				{field:"customerzhekou",title:"折扣",sortable:true},

				{field:"customerdingdan",title:"订单人姓名"},
				{field:"customerdizhi",title:"订单地址"},
				{field:"shipCarid",title:"会员id",align:"center"},
				{field:"shipCardDate",title:"会员卡办理时间",
					formatter: function(value,row,index){
						var date = new Date();
						var oldyear = date.getFullYear() - 1;
						var nowyear = date.getFullYear();
						var yue = date.getMonth() + 1;
						var ri = date.getDate();
						if(yue < 10){
							oldDate = oldyear+"-0"+yue+"-"+ri;
						}else{
							oldDate = oldyear+"-"+yue+"-"+ri;
						}
						nowDate = nowyear+"-"+yue+"-"+ri;

						var shipCardYouHuiDate = row.shipCardYouHuiDate;
						/* 如果优惠包的开始时间为不为空 */
						if(row.shipCardYouHuiDate != null){
							var youHuiDateYear = "";
							var youHuiDateMonth = "";
							youHuiDateYear = shipCardYouHuiDate.substr(0,4);
							var youHuiDateMont = shipCardYouHuiDate.substr(5,2);
							youHuiDateMonth = youHuiDateMont - (-3) ;
							if(youHuiDateMonth > 12){
								youHuiDateMonth = youHuiDateMonth - 12;
								youHuiDateYear = youHuiDateYear - (-1);
							}
							var youHuiDateRi = shipCardYouHuiDate.substr(8,2);
							var youHuiEndDate = youHuiDateYear+"-"+youHuiDateMonth+"-"+youHuiDateRi;
						}

						if(row.shipCardDate <= oldDate){
							var zhuangTai = "";
							if(row.shipCardYouHui == 1){
								zhuangTai = "<font color = 'red'> (待)铂金优惠期<font>";
							}
							if(row.shipCardYouHui == 2){
								zhuangTai = "<font color = 'red'> (期间)铂金优惠期<font>";
							}
							if(row.shipCardYouHui == 3){
								zhuangTai = "<font color = 'red'> (已)铂金优惠期<font>";
							}
							/* 如果优惠包的开始时间为不为空 */
							if(row.shipCardYouHuiDate != null){
								/* 当前的系统时间如果大于优惠包的截止时间,那么已过优惠期 */
								if(nowDate > youHuiEndDate){
									zhuangTai = "<font color = 'red'> (已)铂金优惠期<font>";
								}
								/* 当前的系统时间如果小于或等于优惠包的截止时间,那么在优惠期间 */
								if(nowDate <= youHuiEndDate){
									zhuangTai = "<font color = 'red'> (期间)铂金优惠期<font>";
								}
							}
							return row.shipCardDate + zhuangTai;
						}else{
							return row.shipCardDate;
						}
					}
				},
				{field:"shipCardYouHui",title:"会员优惠包开通时间"},

				{field:"shipCardYouHuiDate",title:"会员卡包使用时间",formatter:function(value,row,index){
					return new Date(value).toLocaleString();
				}},
		        {field:'aaa',title:'操作',width:100,align:'center',
		        	formatter: function(value,row,index){
		        		var queDingYouHuiBut = "<input id = 'queDingYouHuiButId"+row.uid+"' type = 'button' value = '确定优惠' onclick = 'puTongYouHuiBtn("+row.uid+")'>";
		        		var shipCardYouHui = row.shipCardYouHui;
		        		var uidd = "queDingYouHuiButId"+row.uid;
		        		if(shipCardYouHui != 1){
	        				queDingYouHuiBut = "<input id = 'queDingYouHuiButId"+row.uid+"' type = 'button' value = '确定优惠' onclick = 'puTongYouHuiBtn("+row.uid+")' disabled>";
		        		}
	        			if(row.shipCardDate > oldDate){
	        				queDingYouHuiBut = "<input id = 'queDingYouHuiButId"+row.uid+"' type = 'button' value = '确定优惠' onclick = 'puTongYouHuiBtn("+row.uid+")' disabled>";
	        			}
		        		return queDingYouHuiBut;
					} 
		        }    
		    ]],
		    fit:true,
		    pagination:true,
		    fitColumns:true,
		    pageSize:3,
		    pageList:[3,5,7],
		    queryParams:{
		    	"queryMoney":$("#ss").val()
			}
		}); 
	}
	
	
	/* 点击确认优惠的时候，走后台将用户优惠状态改为2 （正在优惠期中）
		并将确认优惠的当前时间传入后台 存入数据库中，
		当用户使用会员卡租书时，先判断他是否已过优惠期（用确认优惠的时间+3个月 与当前时间比较，
			如果，超过则进数据库改变状态 为 3 （已过优惠期）
		）
	*/
	function puTongYouHuiBtn(customerid){
		$.ajax({
			url:"<%=request.getContextPath()%>/zpsTree/queRenYouHui",
			type:"post",
			data:{"nowDate":nowDate, "customerid":customerid},
			dataType:"text",
			success:function(result){
				if(result == "success"){
					$.messager.alert("提示","现已开始使用优惠包！！！");
    	        	puTongChaXun();
				}else{
					$.messager.alert("提示","无法使用优惠包！！！");
				}
			},
			error:function(){
				$.messager.alert("提示","修改优惠包状态失败,请查看后台代码！！！");
			}
		})
	}
	
</script>











</body>
</html>