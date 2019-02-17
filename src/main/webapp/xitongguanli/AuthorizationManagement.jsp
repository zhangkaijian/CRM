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
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css"
          href="easyui/themes/default/easyui.css">
    <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
    <script type="text/javascript" src="easyui/jquery.min.js"></script>
    <script type="text/javascript" src="easyui/jquery.easyui.min.js"></script>
    <script type="text/javascript" src="easyui/locale/easyui-lang-zh_CN.js"></script>
    <script type="text/javascript">
        var index;
        var roles = [{"value":"superadmin","text":"超级管理员"},{"value":"guest","text":"游客"}]
        var endIndex = 0 ;
        $(function() {
            $('#dg').datagrid({
                //?task=queryByContract&field="+$('#bbb').val()
                url:"getAllUser?field="+$('#bbb').val(),
                pagination:'true',
                fit:'true',		//适应父容器的大小
                rownumbers:'true',	//显示行号
                striped:'true',		//条纹背景
                singleSelect:'true',
                toolbar: '#tb',
                rowStyler: function(index,row){
                    if (row.productid=='RP-LI-02'){
                        return 'background-color:#6293BB;color:#fff;';
                        //设置行样式
                    }
                },
                onDblClickRow:function(rowIndex,rowData){
                    $("#dg").datagrid("endEdit",endIndex);
                    $("#dg").datagrid("beginEdit",rowIndex);
                    endIndex = rowIndex;
                },onClickRow:function(rowIndex,rowData){

                    $("#dg").datagrid("endEdit",endIndex);
                },onAfterEdit:function(rowIndex,row,changes){
                    $.post("updatecustomer"
                        ,{
                            "id":row.id
                            ,"name":row.name
                            ,"phone":row.phone
                            ,"industry":row.industry
                            ,"companysize":row.companysize
                            ,"des":row.des
                        }
                        ,function(){
                            $("#dg").datagrid("load");
                        });
                },
                columns:[[
                    {field:'',title:'#',width:100,checkbox:'true'},
                    {field:'id',title:'用户id',width:100},
                    {field:'username',title:'用户名称',width:100},
                    {field:'password',title:'用户密码',width:100,
                        editor:'text'},
                    {field:'roles',title:'用户权限',width:100,
                        editor:{
                            type:'combobox',
                            options: {
                                data: roles,
                                valueField: "value",
                                textField: "text",
                                editable: false,
                                panelHeight:70,
                                required: true
                            }
                        }
                    },
                ]]
            });
        });

    </script>
    <script type="text/javascript">
        function qq(value) {
            $('#dg').datagrid('load',{
                key:value
            });
        }

    </script>
    <script type="text/javascript">
        function querybybbb() {
            location.reload();
        }
    </script>
    <script type="text/javascript">
        function delete1() {
            var row = $("#dg").datagrid("getSelected");
            console.log(row.id);
            $.post("deletecustomer"
                ,{
                    "id":row.id
                }
                ,function(){
                    $("#dg").datagrid("load");
                });
        }

        function update1(){
            //alert(1);
            // 获取选中的行，如果没有被选中的 那么会返回null
            var row = $('#dg').datagrid("getSelected");
            if(row != null){
                console.log(row.id,row.name,row.phone);
                $('#dg').datagrid("endEdit",index);
                // 获取改行对应的行号
                index = $("#dg").datagrid("getRowIndex",row);
                // 让某行进入编辑状态
                $('#dg').datagrid("beginEdit",index);
            }else{
                //登录失败 给出提示
                $.messager.alert('警告','请选择要修改的记录！');
            }
        }

        function save1(){
            var row = $('#dg').datagrid("getSelected");
            if(row != null){
                console.log(row.id,row.name,row.phone);
                $('#dg').datagrid("endEdit",index);
                // 获取修改的数据 提交到服务器
                $.post("updatecustomer"
                    ,{
                        "id":row.id
                        ,"username":row.username
                        ,"password":row.password
                        ,"roles":row.roles
                    }
                    ,function(msg){
                        // 重新加载数据
                        $('#dg').datagrid("reload");
                    }
                );
            }else{
                //登录失败 给出提示
                $.messager.alert('警告','请选择要修改的记录并修改！');
            }
        }
    </script>
</head>
<body>
<table id="dg"></table>

<div id="tb">
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-add',plain:true" id="btn1" onclick="$('#add').window('open')">添加</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-edit',plain:true" id="btn2" onclick="update1()">修改</a>
    <a href="javascript:void(0)" class="easyui-linkbutton" data-options="iconCls:'icon-remove',plain:true" id="btn3" onclick="delete1()">删除</a>
    <a href="javascript:void(0)"class="easyui-linkbutton"data-options="iconCls:'icon-save',plain:true" id="btn4" onclick="save1()">保存</a>
    <select id="bbb" style="width:120px" onchange="querybybbb()">
        <option value="customername">输入客户姓名查询</option>
        <option value="customerid">输入客户ID查询</option>
    </select>
    <input class="easyui-searchbox" data-options="searcher:qq,prompt:'请输入...'" style="width: 300px"></input>
</div>

<div id="add" class="easyui-window" title="Modal Window" data-options="modal:true,closed:true,iconCls:'icon-save'" style="width:350px;height:500px;padding:10px;">
    <form id=addUser method="post">
        <table cellpadding="10">
            <tr>
                <td colspan="3"><strong style="margin-left: 50px">---添加客户信息---</strong></td>
            </tr>
            <tr>
                <td>用户名:</td>
                <td ><input class="easyui-textbox" type="text" name="username" data-options="required:true,missingMessage:'用户名不能为空'"></input></td>
            </tr>
            <tr>
                <td>用户密码:</td>
                <td><input class="easyui-textbox" type="password" name="password" data-options="required:true,missingMessage:'用户密码不能为空'"></input></td>
            </tr>
            <tr>
                <td>用户权限:</td>
                <td><input class="easyui-textbox" type="text" name="roles" data-options="required:true,missingMessage:'行业信息不能为空'"></input></td>
            </tr>
        </table>
    </form>
    <div style="text-align:center;padding:5px">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">添加</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">清除</a>
    </div>
</div>
<script>
    function submitForm(){
        $('#addUser').form('submit', {
            url:'addUser',
            success:function(msg){
                console.log(msg)
                if (msg==1) {
                    $.messager.alert('恭喜','添加成功');
                    $("#win").window('close')
                    $('#dg').datagrid("reload");
                    $('#addcustomer')[0].reset();
                    $('#add').window('close');
                } else {
                    $.messager.alert('警告','添加失败');
                }
            }
        });
    }
    function clearForm(){
        $('#addUser').form('clear');
    }
</script>
</body>
</html>