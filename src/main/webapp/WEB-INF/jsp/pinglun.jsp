<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script>
    $(function(){
        loadData("commentdata",null);

        $("#search").panel({
            width: "100%",
            height: 80,
            title: '搜索'
        });

        $('#ss').searchbox({
            searcher: function (value, name) {

                loadData("commentdatabypro", {pn: name, pv: value});
            },
            menu: '#mm',
            prompt: '请输入搜索关键字'
        });

        $('#start').datetimebox();
        $('#end').datetimebox();

        $("#link").linkbutton();
        $('#link').bind('click', function(){
            var start = $('#start').datetimebox('getValue');
            var end= $('#end').datetimebox('getValue');
            if(start&&end)
                loadData("commentdatabytime",{startTime:start,endTime:end});
            else
                loadData("commentdata",null);
        });
    })

    function loadData(url,param){
        $('#comment').datagrid({
            queryParams:param,
            height:700,
            columns:[[
                {field:'scommId',title:'评论编号',width:100,align:'center',checkbox:"true"},
                {field:'scommContent',title:'评论',width:300,align:'center'},
                {field:'scommMembername',title:'会员名字',width:100,align:'center'},
                {field:'scommMemberavatar',title:'会员头像',width:200,align:'center',formatter:function(v,r,i){
                    return "<img src='"+ v+"'height=20 />";
                }},
                {field:'scommTime',title:'评论时间',width:200,align:'center',formatter:function(value,row,index){
                    if(value){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
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
                {field:'edit',title:"编辑",width:100,align:'center',formatter:function(v,r,i){
                    return "<a href='javascript:showWindow("+ r.scommId+")'>编辑</a>"
                }},
                {field:'delete',title:"删除",width:100,align:'center',formatter:function(v,r,i){
                    return "<a href='javascript:del("+ r.scommId+")'>删除</a>"
                }}
            ]],
            url:url,
            pagination:true,
            singleSelect:true,
            title:"评论列表",
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加",
                handler: function(){showInsertWindow()}
            }]

        })
    }

    function del(scommId){
        $("deleteComment").window({
            width:800,
            height:500,
            title:"删除评论信息"
        })
        $("#contentbody2").attr("src","http://localhost:8080/deletecommentbyid?id="+scommId)
        $('#comment').datagrid('reload')
    }

    function showInsertWindow(){
        $("#insertComment").window({
            width:800,
            height:500,
            title:"增加评论信息",
            onClose:function(){
                $('#comment').datagrid('reload')
            }
        })
        $("#contentbody1").attr("src","http://localhost:8080/page_pinglunzengjia")
    }

    function showWindow(scommId){
        $("#addComment").window({
            width:650,
            height:450,
            title:"编辑评论",
            onClose:function(){
                $('#comment').datagrid('reload')
            }
        })
        $("#contentbody").attr("src","http://localhost:8080/commentbyid?id="+scommId)
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
                            <div data-options="name:'scomm_content'">按评论内容搜索</div>
                            <div data-options="name:'scomm_membername'">按会员名搜索</div>
                        </div>
                    </td>
                    <td width="80" align="left">
                        根据评论时间:
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

        <table id="comment"></table>
        <div id="addComment">
            <iframe id="contentbody" src="" width="600" frameborder="0" height="400" scrolling="no"></iframe>
        </div>
        <div id="insertComment">
            <iframe id="contentbody1" src="" width="800" frameborder="0" height="500" scrolling="no"></iframe>
        </div>
        <div id="deleteComment">
            <iframe id="contentbody2" src="" width="800" frameborder="0" height="500" scrolling="no" style="display: none"></iframe>
        </div>
    </div>
    <jsp:include page="commom/wei.jsp"></jsp:include>
