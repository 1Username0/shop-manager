<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script>
    $(function(){
        loadData("advertisementdata",null);

        $("#search").panel({
            width: "100%",
            height: 80,
            title: '搜索'
        });
        $('#ss').searchbox({
            searcher: function (value, name) {

                loadData("advertisementdatabypro", {pn: name, pv: value});
            },
            menu: '#mm',
            prompt: '请输入搜索关键字'
        });
        $('#status').combobox({
            data: [
                {
                    "value": "",
                    "text": "全部"
                },{
                    "value": "1",
                    "text": "启用"
                }, {
                    "value": "0",
                    "text": "禁用"
                }],
            editable: false,
            onSelect:function(){
                var v=  $('#status').combobox("getValue");
                loadData("advertisementdatabypro", {pn: "adv_offline", pv: v});
            }
        });
        $('#start').datetimebox();
        $('#end').datetimebox();
        //搜索按钮
        $("#link").linkbutton();
        $('#link').bind('click', function(){
            var start = $('#start').datetimebox('getValue').toString();
            var end= $('#end').datetimebox('getValue').toString();
            if(start&&end)
            loadData("advertisementdatabytime",{startTime:start,endTime:end});
            else
                loadData("advertisementdata",null);
        });

    })


    function loadData(url,param){
        $('#adv').datagrid({
            queryParams:param,
            height:700,
            columns:[[
                {field:'advId',title:'广告编号',width:100,align:'center',checkbox:'true'},
                {field:'advTitle',title:'广告标题',width:100,align:'center'},
                {field:'advPicUrl',title:'图片',width:100,align:'center',formatter:function(v,r,i){
                    return "<img src='"+ v+"'height=20 />";
                }},
                {field:'advOrder',title:'排位',width:80,align:'center'},
                {field:'advLinkUrl',title:'广告连接地址',width:200,align:'center'},
                {field:'advOffline',title:'广告状态',width:80,align:'center',formatter:function(v,r,i){
                    if(v==1) return "启用";
                    else return"禁用"
                }},
                {field:'advCratetime',title:'创建时间',width:200,align:'center',formatter:function(value,row,index){
                    if(value){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
                {field:'advUpdatetime',title:'更新时间',width:200,align:'center',formatter:function(value,row,index){
                    if(value){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
                {field:'edit',title:"编辑",width:100,align:'center',formatter:function(v,r,i){
                    return "<a href='javascript:showWindow("+ r.advId+")'>编辑</a>"
                }},
                {field:'delete',title:"删除",width:100,align:'center',formatter:function(v,r,i){
                    return "<a href='javascript:del("+ r.advId+")'>删除</a>"
                }}
            ]],
            url:url,
            pagination:true,
            singleSelect:true,
            title:"广告列表",
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加",
                handler: function(){showInsertWindow()}
            }]

        })
    }

    function del(advId){
        $("deleteAdv").window({
            width:800,
            height:500,
            title:"删除广告信息"
        })
        $("#contentbody2").attr("src","http://localhost:8080/deleteadvertisementbyid?id="+advId)
        $('#adv').datagrid('reload')
    }

    function showInsertWindow(advId){
        $("#insertAdv").window({
            width:650,
            height:450,
            title:"增加广告",
            onClose:function(){
                $('#adv').datagrid('reload')
            }
        })
        $("#contentbody1").attr("src","http://localhost:8080/page_guanggaozengjia1")
    }

    function showWindow(advId){
        $("#addAdv").window({
            width:650,
            height:450,
            title:"编辑广告",
            onClose:function(){
                $('#adv').datagrid('reload')
            }
        })
        $("#contentbody").attr("src","http://localhost:8080/advertisementbyid?id="+advId)
    }
</script>
    <div id="content" region="center"  style="padding:5px;">
        <div id="search" style="padding:10px;">
            <table width="100%" border="0">
                <tr>
                    <td align="left" width="80">
                        关键字搜索:
                    </td>
                    <td align="left" width="200">
                        <input id="ss" class="easyui-searchbox" style="width:300px" />
                        <div id="mm" style="width:120px">
                            <div data-options="name:'adv_title'">按标题搜索</div>
                        </div>
                    </td>
                    <td width="80" align="left">
                        按状态搜索:
                    </td>
                    <td width="200">
                        <input id="status" name="dept" value="全部">
                    </td>
                    <td width="80" align="left">
                        根据创建时间:
                    </td>
                    <td width="350">
                        <input id="start" name="start">
                        -
                        <input id="end" name="end" >
                    </td>
                    <td>
                        <a href="#" id="link">搜索</a>
                    </td>
                </tr>
            </table>
        </div>
      <table id="adv"></table>
        <div id="addAdv">
              <iframe id="contentbody" src="" width="600" frameborder="0" height="400" scrolling="no"></iframe>
        </div>
        <div id="insertAdv">
            <iframe id="contentbody1" src="" width="800" frameborder="0" height="500" scrolling="no"></iframe>
        </div>
        <div id="deleteAdv">
            <iframe id="contentbody2" src="" width="800" frameborder="0" height="500" scrolling="no" style="display: none"></iframe>
        </div>

    </div>
<jsp:include page="commom/wei.jsp"></jsp:include>
