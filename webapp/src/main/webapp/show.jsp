<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<jsp:include page="boots.jsp"></jsp:include>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>


</head>
<body>
	<div id="cha">
		<button type="button" class="btn btn-success" id="addbtn">新增信息</button>
		<form id="where">
		<input name="deleteAll" type="button" id="deleteAll" value="批量删除"/>
		</form>
	</div>
	
	<table id="table" class="table"></table>
	
	<script type="text/javascript">

		$("#addbtn").click(function(){
			 BootstrapDialog.show({
			        type : BootstrapDialog.TYPE_SUCCESS,
			        title : '错误 ',
			        message : $("<div></div>").load("add.jsp"),
			        size : BootstrapDialog.SIZE_SMALL,//size为小，默认的对话框比较宽
			        buttons : [ {// 设置关闭按钮
			            label : '关闭',
			            action : function(dialogItself) {
			                dialogItself.close();
			            },
			        	},{
				            label : '保存',
				            action : function(dialogItself) {
				            	 var formData = new FormData(document.getElementById("person"));
				            	 $.ajax({
				        			 url:"<%=request.getContextPath()%>/zpsTree/addPerson",
				        			 type:"post",
				        			 data:formData,
				        			 dataType:"json",
				        			 async:false,
	                                 cache: false, 
	                                 contentType: false, 
	                                 processData: false, 
				        			 success:function(data){
				        				 if(data.success){
				        					 alert("成功");
				        					 dialogItself.close();
				        					 $("#table").bootstrapTable("refresh",{pageNumber:1});
				        				 }else{
				        					 alert("失败")
				        				 }
				        			 }
				        		 	
				        		 })
				            }
			        	}
			        ]
			    });
		})
	
	</script>
	
	<script type="text/javascript">
		$("#table").bootstrapTable({
			url:"<%=request.getContextPath()%>/zpsTree/getPerson",//获取数据的请求路径
			columns:[//绑定数据
			       {checkbox:true},
			       {field:"customerid",title:"编号"},
			       {field:"orderid",title:"订单id"},
			       {field:"customerphone",title:"手机号",align:"center"},
			       {field:"customername",title:"用户名称",sortable:true},

				{field:"customertype",title:"用户类型"},
				{field:"customerjine",title:"现有金额"},
				{field:"customershijian",title:"会员开通时间",align:"center"},
				{field:"customerzhekou",title:"折扣",sortable:true},

				{field:"customerdingdan",title:"订单人姓名"},
				{field:"customerdizhi",title:"订单地址"},
				{field:"shipCarid",title:"会员id",align:"center"},
				{field:"shipCardDate",title:"医院卡办理时间",sortable:true},
				{field:"shipCardYouHui",title:"会员优惠包开通时间"},

			       {field:"shipCardYouHuiDate",title:"会员卡包使用时间",formatter:function(value,row,index){
			    	   return new Date(value).toLocaleString();
			       }},

			     {field:"p_photo",title:"lon",formatter:function(value,row,index){
			    	   if(value != null){
			    	   	return '<img width="100" height="100" src="'+value+'"/>';
			    	   }else{
			    		   return "";
			    	   }
			       }}  
			       ,{
			            field:'aa',
			            title:'操作',
			            width:10,
			        	formatter: function(value,row,index){
			        		return '<button type="button" onclick="delGong('+row.p_id+')"class="btn btn-danger"><font>删除</font></button><button type="button" onclick="xiugai(\''+row.p_id+'\')" class="btn btn-info"><font>修改</font></button>';
				        }
			       }
			       
			       ],
			       pagination:true,//显示分页条
				   pageNumber:1,//初始化 页数
				   pageSize:10,//初始化 条数
				   pageList:[5,10,15],//初始化 可选择的条数
				   paginationLoop:false,//关闭分页的无限循环
				   height:530,//高度
				   undefinedText:"-",//有数据为空时 显示的内容
				   striped:true,//斑马线
				   sortName:"p_age",//排序的字段
				   sortOrder:"asc",//排序的方式 desc或asc
				   onlyInfoPagination:true,  //设置true时  只显示总条数   
				   selectItemName:"name",
				   smartDisplay:false,
				  // search:true,//启用搜索框
				 // strictSearch:true,//设置精确匹配 还是模糊匹配     默认模糊匹配false
				  showFooter:true,//表格底部角
				   showColumns:true,//显示选择展示列的按钮
				   showRefresh:true,//刷新按钮
				   showToggle:true,//切换显示格式
				   showPaginationSwitch:true,//展示所有数据 和分页数据的切换按钮
				  detailView:true,//列的详细页
				  /*  detailFormatter:function(index,row){
					   //格式化详细页
					   return '<a href="#">'+row.p_name+'</a>';
				   }, */
				   searchAlign:"left",//搜索框的显示位置
				   paginationHAlign:"left",//分页按钮的显示位置
				   paginationDetailHAlign:"right",//总页数 和条数的显示位置
				   paginationPreText:"上一页",//设置上一页显示的文本
				   paginationNextText:"下一页",//设置下一页显示的文本
				   clickToSelect:true,//选中行  默认选中  单选或复选
				   toolbar:"#cha",
				   sidePagination:"server",
				   method:"post",
				   contentType:"application/x-www-form-urlencoded",
				   queryParams:function(){
					   var sort=this.sortName;
					   var order=this.sortOrder;
					   var offset=(this.pageNumber-1)*this.pageSize;
					   var limit=this.pageSize;
					   return formToJson("where",limit,offset,sort,order);
				   } 
		})
		function formToJson(id,limit,offset,sort,order) {
		//序列化表当为数组对象
	    var arr = $("#" + id).serializeArray();
		//准备拼接字符串
	    var jsonStr = "";
		//拼接开始位置的{
	    jsonStr += '{';
	    //循环所有的
	    for (var i = 0; i < arr.length; i++) {
	    	//拼接字符串     "name值":"value值",
	        jsonStr += '"' + arr[i].name + '":"' + arr[i].value + '",'
	    }
	    //拼接上我们分页必要几个参数
	    jsonStr +='"limit":"'+limit+'",';
	    jsonStr +='"offset":"'+offset+'",';
	    jsonStr +='"sort":"'+sort+'",';
	    jsonStr +='"order":"'+order+'",';
	    //去掉最后一个，
	    jsonStr = jsonStr.substring(0, (jsonStr.length - 1));
	    //拼接结束的}   
	    /*
	    {
	    	“name”:"123",
	    	"age":"12"
	    }
	    */
	    jsonStr += '}'
	    var json = JSON.parse(jsonStr)
	    return json
	}
		function delGong(p_id){
			 $.ajax({
					url:"<%=request.getContextPath()%>/setTree/deleteUser.do",
					dataType:"text",
					type:"post",
					data:{"p_id":p_id},
					success:function(data){
						
						
						$('#gonggao').bootstrapTable('refresh');
					}
				})
		}	
		function updateGong(p_id){
			alert(1)
			$.ajax({
			url:"<%=request.getContextPath()%>/setTree/queryById.do",	
			data:{"p_id":p_id},
			type:"post",
			dataType:"json",	
			async:false,
			success:function (gg){
				alert(gg.p_id);
				$("#p_id").val(gg.p_id);
				$("#p_name").val(gg.p_name);
				$("#p_sex").val(gg.p_sex);
				$("#p_age").val(gg.p_age);
				$("#p_hobby").val(gg.p_hobby);
				$("#p_address").val(gg.p_address);
				$("#p_birthday").val(gg.p_birthday);
				$("#p_photo").val(gg.p_photo);
			 	$('#myModal1').modal({
				        keyboard:false,
				  }) 
			}
			}); 
				
		}  
		 function upgao(){
				$.ajax({
					url:"<%=request.getContextPath()%>/setTree/updateUser.do",	
					data:$("#upForm").serialize(),
					async:false,
					dataType:"text",
					type:"post",
					async:false,
					success:function (updateFlag){
						if(updateFlag == "updateSuccess"){
							$('#gonggao').bootstrapTable('refresh');
						}
					},
					error:function (){
						alert("修改失败");
					}
			})

			}	
		 
	
		 
		 function xiugai(p_id){
				
				BootstrapDialog.show({
			        type : BootstrapDialog.TYPE_SUCCESS,
			        title : '修改 ',
			        message : $('<div></div>').load('<%=request.getContextPath()%>/setTree/findComById.do?p_id='+p_id),
			        size : BootstrapDialog.BIG_SMALL,//size为小，默认的对话框比较宽
			        buttons : [ {// 设置关闭按钮
			            label : '关闭',
			            action : function(dialogItself) {
			                dialogItself.close();
			            },
			        	},{
				            label : '修改',
				            action : function(dialogItself) {
				            	 var formData = new FormData(document.getElementById("person"));
				            	 $.ajax({
				        			 url:"<%=request.getContextPath()%>/setTree/updateCom.do",
				        			 type:"post",
				        			 data:formData,
				        			 dataType:"text",
				        			 async:false,
	                                 cache: false, 
	                                 contentType: false, 
	                                 processData: false, 
				        			 success:function(data){
				        				 if(data == "1"){
				        					 alert("修改成功");
				        					 dialogItself.close();
				        					 $("#table").bootstrapTable("refresh");
				        				 }else{
				        					 alert("失败")
				        				 }
				        			 }
				        		 	
				        		 })
				            }
			        	}
			        ]
			    });
				
			}
			
		 
		 
		//批量删除
		 data$("#deleteAll").click(function(){
				
				var ids = $("[name='checkbox']:checked");
				//友好提醒
				var idslength = ids.length;
				if(idslength == 0){
					alert("请选择要删除的数据");
					return false;
					}
				//拼装一个id字符串
				var idss="";
				ids.each(function(){
					idss += $(this).val()+",";
					})
					alert(idss)
				if(confirm("确认删除吗?")){
					$.ajax({
				 	      url:"<%=request.getContextPath()%>/setTree/deleteTravelByIds.do",
				 	      type:"post",
						  data:{"ids":idss},
						  Type:"text",
						  async:false,
						  success:function(result){
								if(result=="success"){
									alert("删除成功");
									location.reload();
									}
								},
						  error:function(){
									alert("删除失败");
								}	
							})
					}	
					
			})
		 
		 
		 
		 
	</script>
</body>
</html>