<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
<base href="<%=basePath%>">
<meta charset="UTF-8">
<title>管理系统</title>
<link rel="stylesheet" type="text/css"
	href="easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
<script type="text/javascript" src="easyui/jquery.min.js"></script>
<script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body class="easyui-layout">
	<div data-options="region:'north',title:'用户管理',split:true"
		style="background: #0d8ddb;height: 100px;">
		首页
	</div>
	<%--<div data-options="region:'south',title:'South Title',split:true"--%>
		<%--style="height: 100px;">--%>
	<%--</div>--%>
	<div data-options="region:'west',title:'导航栏',split:true"
		style="width: 200px;">
		<div class="easyui-accordion"  style="width:199px;" fit="true" border="false">
			<div title="系统管理" data-options="iconCls:'icon-system'" style="overflow:auto;padding:10px;">
				<ul class="easyui-tree">
					<li>
						<a style="text-decoration: none; color:#000000" href="javascript:void(o)" onclick="goPage1($(this).text())">
							<span>授权管理</span></a>
					</li>
				</ul>
			</div>
			<div title="客户资料" style="padding:10px;">
				<ul class="easyui-tree">
					<li>
						<a style="text-decoration: none; color:#000000" href="javascript:void(o)" onclick="goPage2($(this).text())">
							<span>客户资料管理</span></a>
					</li>
					<li>
						<a style="text-decoration: none; color:#000000" href="javascript:void(o)" onclick="goPage3($(this).text())">
							<span>邮件短信关怀</span></a>
					</li>
				</ul>
			</div>
			<div title="联系人资料" style="padding:10px;">
				<ul class="easyui-tree">
					<li>
						<a style="text-decoration: none; color:#000000" href="javascript:void(o)" onclick="goPage4($(this).text())">
							<span>添加联系人</span></a>
					</li>
					<li>
						<a style="text-decoration: none; color:#000000" href="javascript:void(o)" onclick="goPage5($(this).text())">
							<span>联系人管理</span></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<div data-options="region:'center',border:false" style="padding: 0px; background: #eee;">
		<div id="tab" class="easyui-tabs" fit="true">
			<div title="首页" style="padding: 20px; display: none;">
				<div>
					<div>
						<%
							Date d = new Date();
							SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
							String now = df.format(d);
						%>
						<h3><img src="img/sun.png">&nbsp;欢迎【<shiro:principal/>】使用CRM信息管理系！！！</h3>
						<h3><img src="img/time.png">
							登录时间：<%=now %>&nbsp;&nbsp;&nbsp;&nbsp;
							<shiro:hasRole name="superadmin">
								您的权限为：超级管理员
							</shiro:hasRole>
							<shiro:hasRole name="guest">
								您的权限为：游客
							</shiro:hasRole>
						</h3>
						<br>
						<br>
						不是我登录？<a href="logout">点击这里</a>
					</div>
					<hr/>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		function goPage1(name) {
			$('#tab').tabs('add',{
				title:name,
				content:'<iframe src="xitongguanli/AuthorizationManagement.jsp" width="100%" height="100%"></iframe>',
				closable:true
			});
		}
		function goPage2(name) {
			$('#tab').tabs('add',{
			    title:name,
			    content:'<iframe src="kehuziliao/CustomerManagement.jsp" width="100%" height="100%"></iframe>',
			    closable:true
			});
		}
		function goPage3(name) {
			$('#tab').tabs('add',{
			    title:name,
			    content:'<iframe src="kehuziliao/Message.jsp" width="100%" height="100%"></iframe>',
			    closable:true
			});
		}
		function goPage4(name) {
			$('#tab').tabs('add',{
			    title:name,
			    content:'<iframe src="lianxirenziliao/AddContacts.jsp" width="100%" height="100%"></iframe>',
			    closable:true
			});
		}
		function goPage5(name) {
			$('#tab').tabs('add',{
			    title:name,
			    content:'<iframe src="lianxirenziliao/ContactsManagement.jsp" width="100%" height="100%"></iframe>',
			    closable:true
			});
		}
		function goPage6(name) {
			$('#tab').tabs('add',{
			    title:name,
			    content:'<iframe src="lianxirenziliao/proMessage.jsp" width="100%" height="100%"></iframe>',
			    closable:true
			});
		}
	</script>
</body>
</html>