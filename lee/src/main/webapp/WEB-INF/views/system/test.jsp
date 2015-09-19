<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
      <title>Basic DataList - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/1.4/themes/bootstrap/easyui.css" />">
		 <link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/1.4/themes/default/easyui.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/1.4/themes/icon.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/1.4/themes/color.css" />">
		<link rel="stylesheet" type="text/css" href="<c:url value="/static/easyui/1.4/demo/demo.css" />">
		<script type="text/javascript" src="<c:url value="/static/easyui/1.4/jquery.min.js" />"></script> 
		<script type="text/javascript" src="<c:url value="/static/easyui/1.4/jquery.easyui.min.js" />"></script>
		<script type="text/javascript" src="<c:url value="/static/easyui/1.4/locale/easyui-lang-zh_CN.js" />"></script>
		<script type="text/javascript" src="<c:url value="/static/js/main.js" />"></script>
		<script type="text/javascript" src="<c:url value="/static/js/validateboxRules.js" />"></script>
    	<link href="<c:url value="/static/css/font-awesome-4.2.0/css/font-awesome.min.css" />" rel="stylesheet">
</head>
<body>
<div style="padding-top:15px; padding-left:5px; padding-right:15px; ">	
		 
			<div id="managerSd" class="easyui-panel" title="查询条件" style="height:100px;padding:10px; margin-bottom:10px;" data-options="collapsible:true">
		       <form action="" id="managerSdForm"> 
		       <div>
		        	   姓名：<input type="text" id="name" name="name">
	                                                          班级：<input type="text" id="classname" name="classname">
		       </div>           
		        <div>
		        	  电话：<input type="text" id="cellphone" name="cellphone">
	                                                          邮箱：<input type="text" id="email" name="email">
	                 <a href="#" class="easyui-linkbutton" iconCls="icon-search" onclick="searchLoad()">查询</a>
		       </div>         
	           
	            
	            </form> 
		    </div>  
	           	
     	<div id="managerTb" style="margin-bottom:5px">
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-plus fa-lg" plain="true" onclick="newObj()">添加</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-pencil-square-o fa-lg" plain="true" onclick="editObj()">修改</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-trash-o fa-lg" plain="true" onclick="destroyObj()">删除</a>
            <a href="#" class="easyui-linkbutton" iconCls="fa fa-crosshairs fa-lg" plain="true" onclick="viewObj()">查看</a>
        </div>           
	    <table id="managerDg"  title="管理员列表"   url="list"
	    		style="margin: 100px"
	    		sortName="id" sortOrder="asc" rownumbers="true"  
	    		pagination="true" pageSize="20" pageList="[10,20,50,100]"
	            data-options="singleSelect:true,method:'post',toolbar:'#managerTb'">
	        <thead>
	            <tr>
	            	<th field="id" sortable="true" hidden="true">ID</th>
	                <th field="name" sortable="true">姓名</th>
	                <th field='classname' sortable="true">班级</th>
	                <th field='cellphone' sortable="true">电话</th>
	                <th field='email' sortable="true">邮箱</th>
	                <th field='birthday' sortable="true">生日</th>
	                
	            </tr>
	        </thead>
	    </table> 
	    <div id="dlg" class="easyui-dialog" style="width:400px;height:450px;padding:10px 20px"
            closed="true" buttons="#dlg-buttons" href="<c:url value="/newtest/info" />">
         </div>
	    <div id="dlg-buttons">
	        <a href="javascript:void(0)" class="easyui-linkbutton c6" iconCls="icon-ok" onclick="saveObj()" style="width:90px" id="save">保存</a>
	        <a href="javascript:void(0)" class="easyui-linkbutton" iconCls="icon-cancel" onclick="javascript:$('#dlg').dialog('close')" style="width:90px">取消</a>
	    </div>
	</div> 
	<script type="text/javascript">
	//获得查询条件
	function dgParams(){
		 var params = {};  
		    $.each($("#managerSdForm").serializeArray(), function(index) {
		    	if(this['value'] != ""){				       
		        	params['params['+this['name']+']'] = this['value'];  
		    	}
		    }); 
		return params;
	}
	//dg在初始化时加入查询条件
	$('#managerDg').datagrid({
		queryParams: dgParams()
	});		
	//按查询条件查询
	function searchLoad(){		
		$('#managerDg').datagrid('options').queryParams=dgParams();
		$('#managerDg').datagrid('load');
	}
	//添加
    function newObj(){
    	$('#save').show();
        $('#dlg').dialog('open').dialog('setTitle','添加管理员');
        $('#managerInfoForm').form('clear');
        url = "manager/insert";
    }
	
	
	
	</script> 
</body>
</html>