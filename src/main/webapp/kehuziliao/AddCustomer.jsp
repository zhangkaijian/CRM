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
    <title>Basic Form - jQuery EasyUI Demo</title>
    <link rel="stylesheet" type="text/css"
          href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
</head>
<body>
<div class="easyui-panel" title="合同信息添加" style="width:400px" fit="true" >
    <div style="padding:10px 60px 20px 60px">
        <form id=save method="post">
            <table cellpadding="10">
                <tr>
                    <td colspan="3"><strong style="margin-left: 230px">---添加房屋信息---</strong></td>
                </tr>
                <tr>
                    <td>房产信息:</td>
                    <td colspan="3"><input class="easyui-textbox" type="text" name="propertyinfo" data-options="required:true,missingMessage:'房产信息不能为空'"style="width:425px"></input></td>
                </tr>
                <tr>
                    <td>房产状态:</td>
                    <td>
                        <select class="easyui-combobox" name="statusteant" style="width:150px" panelHeight=140>
                            <option value="已售">已售</option>
                            <option value="未售">未售</option>
                            <option value="已租">已租</option>
                            <option value="未租">未租</option>
                        </select>
                    </td>
                    <td>房产户型:</td>
                    <td><input class="easyui-textbox" type="text" name="housetype" data-options="required:true,missingMessage:'房屋户型不能为空'"></input></td>
                </tr>
                <tr>
                    <td>房屋朝向:</td>
                    <td>
                        <select class="easyui-combobox" name="toward" style="width:150px" panelHeight=140>
                            <option value="朝东">朝东</option>
                            <option value="朝南">朝南</option>
                            <option value="朝北">朝北</option>
                            <option value="朝西">朝西</option>
                        </select>
                    </td>
                    <td>建筑面积:</td>
                    <td><input class="easyui-textbox" type="text" name="roomarea" data-options="required:true,missingMessage:'建筑面积不能为空'"></input></td>
                    <td>平米</td>
                </tr>
                <tr>
                    <td colspan="3"><strong style="margin-left: 230px">---添加合同信息---</strong></td>
                </tr>
                <tr>
                    <td>合同编号:</td>
                    <td><input class="easyui-textbox" type="text" name="contacrtnum" data-options="required:true,missingMessage:'合同编号不能为空'"></input></td>
                    <td>合同金额:</td>
                    <td><input class="easyui-textbox" type="text" name="contractmoney" data-options="required:true,missingMessage:'合同金额不能为空'"></input></td>
                </tr>
                <tr>
                    <td>合同日期:</td>
                    <td><input class="easyui-textbox" type="date" name="contactdate" data-options="required:true,missingMessage:'合同日期不能为空'" style="width:150px"></input></td>
                    <td>付款方式</td>
                    <td>
                        <select class="easyui-combobox" name="paymoney" style="width:150px" panelHeight=70><option value="全款">全款</option><option value="贷款">贷款</option></select>
                    </td>
                </tr>
                <tr>
                    <td colspan="3"><strong style="margin-left: 230px">---添加业主信息---</strong></td>
                </tr>
                <tr>
                    <td>业主姓名:</td>
                    <td><input class="easyui-textbox" type="text" name="proprietorname" data-options="required:true,missingMessage:'业主姓名不能为空'"></input></td>
                    <td>身份证号:</td>
                    <td><input class="easyui-textbox" type="text" name="idnum" data-options="required:true,missingMessage:'身份证不能为空'"></input></td>
                </tr>
                <tr>
                    <td>联系电话:</td>
                    <td><input class="easyui-textbox" type="text" name="phone" data-options="required:true,missingMessage:'联系电话不能为空'"></input></td>
                </tr>
                <tr>
                    <td>备注:</td>
                    <td><input class="easyui-textbox" name="remake" data-options="multiline:true" style="height:60px"></input></td>
                </tr>
            </table>
        </form>
        <div style="text-align:center;padding:5px">
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">添加</a>
            <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
        </div>
    </div>
</div>
<script>
    function submitForm(){
        $('#save').form('submit', {
            url:'saleservlet?task=save',
            success:function(msg){
                console.log(msg)
                if (msg==1) {
                    $.messager.alert('恭喜','添加成功');
                    $("#win").window('close')
                    $('#save')[0].reset();
                } else {
                    $.messager.alert('警告','添加失败');
                }
            }
        });
    }
    function clearForm(){
        $('#ff').form('clear');
    }
</script>
</body>
</html>