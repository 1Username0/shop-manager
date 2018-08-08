<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script>
    $(function(){
        var a=$("#goodscategory")
        $('#goodscategory').datagrid({
            columns:[[
                {field:'catId',title:'编号',width:100,align:'center',checkbox:"true"},
                {field:'catName',title:'分类名称',width:200,align:'center'},
                {field:'sort',title:'排序',width:200,align:'center'},
                {field:'description',title:'描述',width:200,align:'center'},
                {field:'isOffline',title:'是否禁用',width:100,align:'center'},
                {field:'createdTime',title:'创建时间',width:315,align:'center'},
                {field:'createdTime',title:'更新时间',width:315,align:'center'}
            ]],
            url:"goodscategorydata",
            pagination:true,
            title:"分类列表",
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加分类",
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
        <table id="goodscategory"></table>
    </div>
    <jsp:include page="commom/wei.jsp"></jsp:include>
