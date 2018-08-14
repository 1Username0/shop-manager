<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script>
    $(function(){
        loadData("atricledata",null);

        $("#search").panel({
            width:"100%",
            height:80,
            title:'搜索'
        });

        $('#ss').searchbox({
            searcher: function (value, name) {

                loadData("atricledatabypro", {pn: name, pv: value});
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
                    "text": "是"
                }, {
                    "value": "0",
                    "text": "否"
                }],
            editable: false,
            onSelect:function(){
                var v=  $('#status').combobox("getValue");
                loadData("atricledatabypro", {pn: "article_show", pv: v});
            }
        });


        //搜索按钮
        $("#link").linkbutton();
        $('#link').bind('click', function(){
            var start = $('#start').val();
            var end= $('#end').val();
            if(start&&end)
                loadData("atricledatabytime",{startTime:start,endTime:end});
            else
                loadData("atricledata",null);
        });


    })


    function loadData(url,param){
        $('#art').datagrid({
            queryParams:param,
            height:700,
            columns:[[
                {field:'articleId',title:'文章编号',width:100,align:'center',checkbox:"true"},
                {field:'articleTitle',title:'文章标题',width:200,align:'center'},
                {field:'articlePicUrl',title:'图片',width:200,align:'center',formatter:function(v,r,i){
                    return "<img src='"+ v+"'height=20 />";
                }},

                {field:'articleShow',title:'是否显示',width:100,align:'center',formatter:function(v,r,i){
                    if(v==1) return "是";
                    else return"否"
                }},
                {field:'amountOfReading',title:'阅读量',width:100,align:'center'},
                {field:'createTime',title:'创建时间',width:200,align:'center',formatter:function(value,row,index){
                    if(value){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
                {field:'updateTime',title:'更新时间',width:200,align:'center',formatter:function(value,row,index){
                    if(value){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
                {field:'articleContent',title:'文章内容',width:300,align:'center'},
                {field:'edit',title:"编辑",width:100,align:'center',formatter:function(v,r,i){
                    return "<a href='javascript:showWindow("+ r.articleId+")'>编辑</a>"
                }},

                {field:'delete',title:"删除",width:100,align:'center',formatter:function(v,r,i){
                    return "<a href='javascript:del("+ r.articleId+")'>删除</a>"
                }}
            ]],
            url:url,
            pagination:true,
            title:"文章列表",
            singleSelect:true,
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加",
                handler: function(){showInsertWindow()}
            }]

        })
    }

    function del(articleId){
        $("deleteArt").window({
            width:800,
            height:500,
            title:"删除文章信息"
        })
        $("#contentbody2").attr("src","http://localhost:8080/deleteatriclebyid?id="+articleId)
        $('#art').datagrid('reload')
    }

    function showInsertWindow(){
        $("#insertArt").window({
            width:800,
            height:500,
            title:"增加文章信息",
            onClose:function(){
                $('#art').datagrid('reload')
            }
        })
        $("#contentbody1").attr("src","http://localhost:8080/page_wenzhangzengjia")
    }

    function showWindow(articleId){
        $("#addArt").window({
            width:800,
            height:500,
            title:"编辑文章信息",
            onClose:function(){
                $('#art').datagrid('reload')
            }
        })
        $("#contentbody").attr("src","http://localhost:8080/atriclebyid?id="+articleId)
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
                            <div data-options="name:'article_title'">按文章标题搜索</div>
                            <div data-options="name:'article_content'">按文章内容搜索</div>
                        </div>
                    </td>
                    <td width="80" align="left">
                        按状态搜索:
                    </td>
                    <td width="200">
                        <input id="status" name="dept" value="全部">
                    </td>
                    <td width="80" align="left">
                        阅读量:
                    </td>
                    <td width="350">
                        <input id="start" type="text" name="start">
                        -
                        <input id="end" type="text" name="end" >
                    </td>
                    <td>
                        <a href="#" id="link">搜索</a>
                    </td>
                </tr>
            </table>
        </div>



        <table id="art"></table>
        <div id="addArt">
            <iframe id="contentbody" src="" width="800" frameborder="0" height="500" scrolling="no"></iframe>
        </div>
        <div id="insertArt">
            <iframe id="contentbody1" src="" width="800" frameborder="0" height="500" scrolling="no"></iframe>
        </div>
        <div id="deleteArt">
            <iframe id="contentbody2" src="" width="800" frameborder="0" height="500" scrolling="no" style="display: none"></iframe>
        </div>
    </div>
    <jsp:include page="commom/wei.jsp"></jsp:include>
