<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script>
    $(function() {
        loadData("goodscategorydata", null);


        $("#search").panel({
            width: "100%",
            height: 80,
            title: '搜索'
        });

        $('#ss').searchbox({
            searcher: function (value, name) {

                loadData("goodscategorydatabypro", {pn: name, pv: value});
            },
            menu: '#mm',
            prompt: '请输入搜索关键字'
        });

        $('#status').combobox({
            data: [
                {
                    "value": "",
                    "text": "全部"
                }, {
                    "value": "1",
                    "text": "是"
                }, {
                    "value": "0",
                    "text": "否"
                }],
            editable: false,
            onSelect: function () {
                var v = $('#status').combobox("getValue");
                loadData("goodscategorydatabypro", {pn: "is_offline", pv: v});
            }
        });


        //搜索按钮
        $("#link").linkbutton();
        $('#link').bind('click', function () {
            var start = $('#start').val();
            var end = $('#end').val();
            if (start && end)
                loadData("goodscategorydatabytime", {startTime: start, endTime: end});
            else
                loadData("goodscategorydata", null);
        });


    })



    function loadData(url,param){
        $('#goodsCategory').datagrid({
            queryParams:param,
            height:700,
            columns:[[
                {field:'catId',title:'编号',width:100,align:'center',checkbox:"true"},
                {field:'catName',title:'分类名称',width:200,align:'center'},
                {field:'sort',title:'排序',width:40,align:'center'},
                {field:'description',title:'描述',width:200,align:'center'},
                {field:'isOffline',title:'是否显示',width:100,align:'center',formatter:function(v,r,i){
                    if(v==1) return "是";
                    else return"否"
                }},
                {field:'createdTime',title:'创建时间',width:200,align:'center',formatter:function(value,row,index){
                    if(value){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
                {field:'createdTime',title:'更新时间',width:200,align:'center',formatter:function(value,row,index){
                    if(value){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
                /*  {field:'ooo',title:'操作',width:85,align:'center',formatter: function(value,row,index){
                 if(row.shibianji){
                 return "<a href='javascript:save()'>确认</a>  | <a href='#'>取消</a>"
                 }else{
                 return "<a href='javascript:startedit("+index+")'>编辑</a>"
                 }
                 }
                 }*/
                {field:'edit',title:"编辑",width:100,align:'center',formatter:function(v,r,i){
                    return "<a href='javascript:showWindow("+ r.catId+")'>编辑</a>"
                }},
                {field:'delete',title:"删除",width:100,align:'center',formatter:function(v,r,i){
                    return "<a href='javascript:del("+ r.catId+")'>删除</a>"
                }}

            ]],
            /*   onBeforeEdit:function(index,row){
             row.shibianji = true;
             $('#goodscategory').datagrid('updateRow',{index:index});
             },*/
            url:url,
            pagination:true,
            title:"分类列表",
            singleSelect:true,
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加",
                handler: function(){showInsertWindow()}
            }]

        })
    }

  /*  function startedit(index){
        $("#goodscategory").datagrid("beginEdit",index);
    }*/

    function del(catId){
        $("deletegoodsCategory").window({
            width:800,
            height:500,
            title:"删除类别信息"
        })
        $("#contentbody2").attr("src","http://localhost:8080/deletegoodscategorybyid?id="+catId)
        $('#goodsCategory').datagrid('reload')
    }

    function showInsertWindow(){
        $("#insertgoodsCategory").window({
            width:800,
            height:500,
            title:"增加类别信息",
            onClose:function(){
                $('#goodsCategory').datagrid('reload')
            }
        })
        $("#contentbody1").attr("src","http://localhost:8080/page_leibiezengjia")
    }

    function showWindow(catId){
        $("#addGoodscategory").window({
            width:800,
            height:500,
            title:"编辑分类信息",
            onClose:function(){
                $('#goodsCategory').datagrid('reload')
            }
        })
        $("#contentbody").attr("src","http://localhost:8080/goodscategorybyid?id="+catId)
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
                            <div data-options="name:'cat_name'">按分类搜索</div>
                            <div data-options="name:'description'">按描述搜索</div>
                        </div>
                    </td>
                    <td width="80" align="left">
                        按状态搜索:
                    </td>
                    <td width="200">
                        <input id="status" name="dept" value="全部">
                    </td>
                    <td width="80" align="left">
                        根据排序查询:
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

        <table id="goodsCategory"></table>
        <div id="addGoodscategory">
            <iframe id="contentbody" src="" width="800" frameborder="0" height="500" scrolling="no"></iframe>
        </div>
        <div id="insertgoodsCategory">
            <iframe id="contentbody1" src="" width="800" frameborder="0" height="500" scrolling="no"></iframe>
        </div>
        <div id="deletegoodsCategory">
            <iframe id="contentbody2" src="" width="800" frameborder="0" height="500" scrolling="no" style="display: none"></iframe>
        </div>
    </div>
    <jsp:include page="commom/wei.jsp"></jsp:include>
