<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script type="text/javascript" src="easyui/js/datagrid-dnd.js"></script>
<script>
    $(function(){
        var a=$("#adv")
        $('#adv').datagrid({
            columns:[[
                {field:'advId',title:'广告编号',width:100,align:'center',checkbox:"true"},
                {field:'advTitle',title:'广告标题',width:200,align:'center'},
                {field:'advPicUrl',title:'图片',width:200,align:'center'},
                {field:'advOrder',title:'排位',width:200,align:'center'},
                {field:'advLinkUrl',title:'广告连接地址',width:300,align:'center'},
                {field:'advOffline',title:'广告状态',width:100,align:'center'},
                {field:'advCratetime',title:'创建时间',width:315,align:'center'},
                {field:'advUpdatetime',title:'更新时间',width:315,align:'center'}
            ]],
            url:"advertisementdata",
            pagination:true,
            title:"广告列表",
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加广告",
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
      <table id="adv"></table>
    </div>
<jsp:include page="commom/wei.jsp"></jsp:include>
