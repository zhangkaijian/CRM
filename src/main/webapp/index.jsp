<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
	<title>登陆界面</title>
	<link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
	<script type="text/javascript" src="easyui/jquery.min.js"></script>
	<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body style="background:url(img/background.png);background-repeat: no-repeat;background-size:100% ">
	<div align="center">
		<div style="margin: 20px 0;"></div>
		<div class="easyui-panel" title="用户登陆" style="width: 400px">
			<div style="padding: 10px 60px 20px 60px">
				<form action="/doLogin" id="ff" method="post">
					<table cellpadding="5">
						<tr>
							<td>账号:</td>
							<td><input class="easyui-textbox" type="text" name="username"
								data-options="required:true,missingMessage:'账号不能为空'"></input></td>
						</tr>
						<tr>
							<td>密码:</td>
							<td><input class="easyui-textbox" type="password" name="password"
								data-options="required:false"></input></td>
						</tr>
					</table>
				</form>
				<div style="text-align: center; padding: 5px">
					<a href="javascript:void(0)" class="easyui-linkbutton"onclick="submitForm()">登录</a>
					<a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清空</a>
				</div>
			</div>
		</div>
	</div>
	<script>
		function submitForm(){
			$('#ff').form('submit', {
			    url:'/doLogin',
			    success:function(msg){
			    	console.log(msg)
					if (msg==1) {
						location.href="home.jsp";
					}else
						$.messager.alert('警告','账号或密码错误');
			    }
			});
		}
		function clearForm(){
			$('#ff').form('clear');
		}
		
	
	</script>
</body>
</html>