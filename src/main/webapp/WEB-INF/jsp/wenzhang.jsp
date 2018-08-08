<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script>
    $(function(){
        var a=$("#art")
        $('#art').datagrid({
            columns:[[
                {field:'articleId',title:'文章编号',width:100,align:'center',checkbox:"true"},
                {field:'articleTitle',title:'文章标题',width:200,align:'center'},
                {field:'articlePicUrl',title:'图片',width:200,align:'center'},
                {field:'articleShow',title:'是否显示',width:100,align:'center'},
                {field:'amountOfReading',title:'阅读量',width:300,align:'center'},
                {field:'createTime',title:'创建时间',width:315,align:'center'},
                {field:'updateTime',title:'更新时间',width:315,align:'center'}
            ]],
            url:"atricledata",
            pagination:true,
            title:"文章列表",
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加文章",
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
        <table id="art"></table>
    </div>
    <jsp:include page="commom/wei.jsp"></jsp:include>
