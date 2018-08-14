<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="commom/tou.jsp"></jsp:include>
<script>
    $(function() {
        loadData("memberinfodata", null);


        //首页上方的搜索面板
        $("#search").panel({
            width: "100%",
            height: 80,
            title: '搜索'
        });
        //首页上方的搜索框
        $('#ss').searchbox({
            searcher: function (value, name) {

                loadData("memberinfodatabypro", {pn: name, pv: value});
            },
            menu: '#mm',
            prompt: '请输入搜索关键字'
        });
        //状态的下拉列表
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
                loadData("memberinfodatabypro", {pn: "member_state", pv: v});
            }
        });
        //日期时间:
        $('#start').datetimebox();
        $('#end').datetimebox();
        //搜索按钮
        $("#link").linkbutton();
        $('#link').bind('click', function(){
            var start = $('#start').datetimebox('getValue');
            var end= $('#end').datetimebox('getValue');
            if(start&&end)
            loadData("memberinfodatabytime",{startTime:start,endTime:end});
            else
            loadData("memberinfodata",null);
        });

    })

    function loadData(url,param){
        $('#mem').datagrid({
            queryParams:param,
            height:700,
            columns:[[
                {field:'memberId',title:'会员编号',width:80,align:'center',checkbox:"true"},
                {field:'memberMobile',title:'会员电话',width:100,align:'center'},
                {field:'memberName',title:'会员名字',width:100,align:'center'},
                {field:'memberBirthday',title:'会员生日',width:100,align:'center'},
                {field:'memberPasswd',title:'会员密码',width:100,align:'center'},
                {field:'memberEmail',title:'会员邮箱',width:100,align:'center'},
                {field:'memberLoginNum',title:'登录次数',width:60,align:'center'},
                {field:'memberLoginTime',title:'当前登录时间',width:135,align:'center',formatter:function(value,row,index){
                    if(value){
                    var unixTimestamp = new Date(value);
                    return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
                {field:'memberOldLoginTime',title:'上次登录时间',width:135,align:'center',formatter:function(value,row,index){
                    if(value){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
                {field:'memberLoginIp',title:'当前登录IP',width:100,align:'center'},
                {field:'memberOldLoginIp',title:'上次登录IP',width:100,align:'center'},
                {field:'createTime',title:'创建时间',width:135,align:'center',formatter:function(value,row,index){
                    if(value){
                        var unixTimestamp = new Date(value);
                        return unixTimestamp.toLocaleString('chinese',{hour12:false});
                    }
                    else return null;
                }},
                {field:'memberState',title:'会员状态',width:55,align:'center',formatter:function(v,r,i){
                    if(v==1) return "启用";
                    else return"禁用"
                }},
                {field:'memberPic',title:'会员头像',width:100,align:'center',formatter:function(v,r,i){
                    return "<img src='"+v+"' height=20 />";
                }},
                {field:'isSell',title:'是否有权发布商品',width:100,align:'center',formatter:function(v,r,i){
                    if(v==1) return "是";
                    else return"否"
                }},
                {field:'edit',title:"编辑",width:100,align:'center',formatter:function(v,r,i){
                    return "<a href='javascript:showWindow("+ r.memberId+")'>编辑</a>"
                }},

                {field:'delete',title:"删除",width:100,align:'center',formatter:function(v,r,i){
                    return "<a id='del' href='javascript:del("+ r.memberId+")'>删除</a>"
                }}
            ]],
            url:url,
            pagination:true,
            title:"会员列表",
            singleSelect:true,
            toolbar: [{
                iconCls: 'icon-add',
                text:"增加",
                handler: function(){showInsertWindow()}
            }]

        })
    }


    function del(memberId){
        $("deleteMem").window({
            width:800,
            height:500,
            title:"删除会员信息"
        })
        $("#contentbody2").attr("src","http://localhost:8080/deletememberinfobyid?id="+memberId)
        $('#mem').datagrid('reload')
    }

    function showInsertWindow(){
        $("#insertMem").window({
            width:800,
            height:500,
            title:"增加会员信息",
            onClose:function(){
                $('#mem').datagrid('reload')
            }
        })
        $("#contentbody1").attr("src","http://localhost:8080/page_huiyuanzengjia")
    }

    function showWindow(memberId){
        $("#updateMem").window({
            width:800,
            height:500,
            title:"编辑会员信息",
            onClose:function(){
                $('#mem').datagrid('reload')
            }

        })
        $("#contentbody").attr("src","http://localhost:8080/memberinfobyid?id="+memberId)
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
                          <div data-options="name:'member_name'">按名字搜索</div>
                          <div data-options="name:'member_mobile'">按电话搜索</div>
                      </div>
                  </td>
                  <td width="80" align="left">
                  按状态搜索:
              </td>
                  <td width="200">
                      <input id="status" name="dept" value="全部">
                  </td>
                  <td width="80" align="left">
                      当前登录时间:
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

        <table id="mem"></table>
        <div id="updateMem">
            <iframe id="contentbody" src="" width="800" frameborder="0" height="500" scrolling="no"></iframe>
        </div>
        <div id="insertMem">
            <iframe id="contentbody1" src="" width="800" frameborder="0" height="500" scrolling="no"></iframe>
        </div>
        <div id="deleteMem">
            <iframe id="contentbody2" src="" width="800" frameborder="0" height="500" scrolling="no" style="display: none"></iframe>
        </div>
    </div>


    <jsp:include page="commom/wei.jsp"></jsp:include>
