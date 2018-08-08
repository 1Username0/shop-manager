<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script>
    $(function(){
        var a=$("#mem")
        $('#mem').datagrid({
            columns:[[
                {field:'memberId',title:'会员编号',width:100,align:'center',checkbox:"true"},
                {field:'memberMobile',title:'会员电话',width:100,align:'center'},
                {field:'memberName',title:'会员名字',width:100,align:'center'},
                {field:'memberBirthday',title:'会员生日',width:100,align:'center'},
                {field:'memberPasswd',title:'会员密码',width:100,align:'center'},
                {field:'memberEmail',title:'会员邮箱',width:150,align:'center'},
                {field:'memberLoginNum',title:'登录次数',width:60,align:'center'},
                {field:'memberLoginTime',title:'当前登录时间',width:100,align:'center'},
                {field:'memberOldLoginTime',title:'上次登录时间',width:100,align:'center'},
                {field:'memberLoginIp',title:'当前登录IP',width:100,align:'center'},
                {field:'memberOldLoginIp',title:'上次登录IP',width:100,align:'center'},
                {field:'createTime',title:'创建时间',width:100,align:'center'},
                {field:'updateTime',title:'更新时间',width:100,align:'center'},
                {field:'memberState',title:'会员开启状态',width:100,align:'center'},
                {field:'memberPic',title:'会员头像',width:200,align:'center'},
                {field:'isSell',title:'是否有权发布商品',width:100,align:'center'}
            ]],
            url:"memberinfodata",
            pagination:true,
            title:"会员列表",
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加会员",
                handler: function(){alert('弹出一个增加的窗口')}
            },'-',{
                iconCls: 'icon-cancel',
                text:"批量删除",
                handler: function(){alert('批量删除')}
            }]

        })
    })
</script>

    <div id="content" region="center"  style="padding:5px;">
        <table id="mem"></table>
    </div>
    <jsp:include page="commom/wei.jsp"></jsp:include>
