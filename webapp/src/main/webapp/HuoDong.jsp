<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<!-- jqeuy默认的css样式 -->
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/js/easyui/themes/icon.css">
	</head>
	<!-- 这是jquery的核心包  -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-3.2.1.js"></script>
	<!-- 这是easyui的核心包  -->
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/jquery.easyui.min.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/util-js.js"></script>
	<script type="text/javascript" src="<%=request.getContextPath()%>/js/easyui/locale/easyui-lang-zh_CN.js"></script>
</head>
<body style="background:url('images/1112442.jpg') no-repeat;">
	<input type = "hidden" id = "sessionName" value = "${user.unme}">
	<input type = "hidden" id = "sessionPassWord" value = "${user.upss}">
	<!-- 面板 -->
	<div class="yanZhengPalen" style="padding:10px;"style="background:url('images/1526020158715.jpg') no-repeat;">
		<marquee behavior=alternate><font color = "gray" size = "6">红心会员</font></marquee><br/><br/>
		<marquee behavior=alternate><h2>· 1. 临双11会员卡时间办理长达一年的红心会员 ，将会获得<font color = "red"> 3 </font>个月的免费笑话大全体验</h2></marquee>
		<marquee behavior=alternate><h2>· 2. 红心会员在每月的<font color = "red"> 11号 ，12号  </font>获得购物 <font color = "red">${shipCard.myPuTongZheKou}</font> 折的优惠</h2></marquee>
		<marquee behavior=alternate><h2>· 3. 每买一物品，根据相应的价格扣除相应的金额 ，金额不足<font color = "red"> 十 </font>元，提示您是忠实粉丝</h2></marquee>
		<marquee behavior=alternate><h2>· 4. 如果金额不足，我们将有权拒绝你的购物车申请</h2></marquee>
			<marquee behavior=alternate><font color = "gray" size = "6">金冠会员</font></marquee><br/><br/>
		<marquee behavior=alternate><h2>· 1. 临双11会员卡时间办理长达一年的金冠会员 ，将会获得<font color = "red"> 3 </font>个月的免费优酷会员体验</h2></marquee>
		<marquee behavior=alternate><h2>· 2. 金冠会员 购物将会获得 <font color = "red">${shipCard.myBoJinZheKou}</font> 折的优惠</h2></marquee>
		<marquee behavior=alternate><h2>· 3. 每够一次物，根据相应的物品扣除相应的金额 ，金额不足<font color = "red"> 十 </font>元，提示充值</h2></marquee>
		<marquee behavior=alternate><h2>· 4. 金冠会员 购物可以超额<font color = "red"> 100 </font>元  （即，欠<font color = "red"> 十 </font>元）</h2></marquee>
		<marquee behavior=alternate><h2>· 5. 超额期间，购物不可打白条</h2></marquee>
		<marquee behavior=alternate><h2>· 6. 如果金额不足，我们将有权延长发货</h2></marquee>
				<marquee behavior=alternate><font color = "gray" size = "6">皇冠会员</font></marquee><br/><br/>
		<marquee behavior=alternate><h2>· 1. 临双11会员卡时间办理长达一年的皇冠会员， 将会获得 3 个月的<font color = "red"> 0.5 </font>折 的优惠</h2></marquee>
		<marquee behavior=alternate><h2>· 2. 皇冠会员，购物将会获得 <font color = "red">${shipCard.myZuanShiZheKou}</font> 折 的优惠</h2></marquee>
		<marquee behavior=alternate><h2>· 3. 每购一次物，根据相应的物品扣除相应的金额 ，金额不足<font color = "red"> 十 </font>元，提示充值</h2></marquee>
		<marquee behavior=alternate><h2>· 4. 皇冠会员 购物可以超额<font color = "red"> 300 </font>元  （即，欠<font color = "red"> 300 </font>元）</h2></marquee>
		<marquee behavior=alternate><h2>· 5. 超额期间，租书价格无任何优惠</h2></marquee>
		<marquee behavior=alternate><h2>· 6. 如果金额不足，我们可继续发货</h2></marquee>
	</div>
	
	<!-- 动态打开 dialog 弹窗进行验证 -->
	<div class="yanZheng"></div> 
	
	<!-- 打开价格折扣框 -->
	<div class = "jiaGeZheKou"></div>
<script type="text/javascript">
	$(function(){
		$.ajax({
			url:"<%=request.getContextPath()%>/zpsTree/queryAllZheKou",
			type:"post",
			data:"",
			dataType:"json",
			async:false,
			success:function(result){
			},
			error:function(){
				$.messager.alert('提示','折扣查询失败,请查看后台代码！！！');    
			}
		})

		$('.yanZhengPalen').panel({    
			fit:true,    
			title: '会员卡活动规则',    
			tools: [{    
				iconCls:'icon-large-smartart',    
				handler:function(){
					yanZheng();
				}    
			}]    
		});   
	})

</script>
 
 
<script type="text/javascript">
	function yanZheng(){
		var name = $("#sessionName").val();
		var passWord = $("#sessionPassWord").val();
		$('.yanZheng').dialog({  
		    title: '验证窗口',    
		    width: 400,    
		    height: 300,    
		    closed: false,    
		    cache: false,    
		    href: "<%=request.getContextPath()%>/YanZhengDialog.jsp",
		    modal: true,
		    buttons:[{
				text:'确定',
				handler:function(){
					var nowUserName = $("[name = 'nowUserName']").val();
					var nowPassWord = $("[name = 'nowPassWord']").val();
					var noimageCode = $("[name = 'imageCode']").val();
					var nowimageCode = noimageCode.toLocaleLowerCase();
					if(nowUserName == name && nowPassWord == passWord){
						$.ajax({
							url:"<%=request.getContextPath()%>/zpsTree/yanZhengMa",
							data:{"nowimageCode":nowimageCode},
							type:"post",
							dataType:"json",
							success:function(result){
								if(result.success){
									$('.yanZheng').dialog('destroy');
				    	        	/* 如果登陆成功的话, 将打开 价格折扣框  */
									$('.jiaGeZheKou').dialog({    
									    title: '设置价格折扣',    
									    width: 400,    
									    height: 300,    
									    closed: false,    
									    cache: false,    
									    href: "<%=request.getContextPath()%>/JiaGeZheKouDialog.jsp",
									    modal: true,
									    buttons:[{
											text:'完成',
											handler:function(){
												$('.jiaGeZheKou').dialog('destroy');
									        	var tab = $('#tt').tabs('getSelected');  
							    	        	tab.panel('refresh');
											}
										}]
									}); 
								}else{
									$('.yanZheng').dialog('destroy');
						        	var tab = $('#tt').tabs('getSelected');  
				    	        	tab.panel('refresh');
									$.messager.alert('提示',result.prompt);    
								}
							},
							error:function(){
								$.messager.alert('提示','验证码查询失败,请检查后台代码！！！');    
							}
						})
					}else{
						$('.yanZheng').dialog('destroy');
			        	var tab = $('#tt').tabs('getSelected');  
	    	        	tab.panel('refresh');
						$.messager.alert('提示','您的用户名或密码与当前登陆用户不符,请确认后在登陆！！！');    
					} 
				}
			}]
		});   
	}

</script>




</body>
</html>