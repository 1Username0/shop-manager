<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script>
    $(function(){
        var a=$("#mem")
        $('#mem').datagrid({
            columns:[[
                {field:'scommId',title:'评论编号',width:100,align:'center',checkbox:"true"},
                {field:'goodisId',title:'商品编号',width:100,align:'center'},
                {field:'scommContent',title:'评论',width:300,align:'center'},
                {field:'scommMemberid',title:'会员编号',width:100,align:'center'},
                {field:'scommMembername',title:'会员名字',width:200,align:'center'},
                {field:'scommMemberavatar',title:'会员头像',width:300,align:'center'},
                {field:'scommTime',title:'评论时间',width:200,align:'center'},
                {field:'createTime',title:'创建时间',width:200,align:'center'},
                {field:'updateTime',title:'更新时间',width:200,align:'center'},
            ]],
            url:"commentdata",
            pagination:true,
            title:"评论列表",
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加评论",
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
