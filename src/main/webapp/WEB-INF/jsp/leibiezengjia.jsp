<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>饰品销售管理台</title>
  <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
  <script type="text/javascript" src="easyui/js/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>
  <script src="easyui/js/ajaxform.js"></script>
  <style type="text/css">
<!--
.title {
	border:1px solid #95b8e7;
	font-family:微软雅黑;
	font-size:12px;
	width:500px;
	height:380px;
	margin-top: 0px;
	margin-right: auto;
	margin-bottom: 0px;
	margin-left: auto;
  text-align: center;
}
input[type='text']{
border:1px solid #95b8e7;
font-family:微软雅黑;
width:400px;
}
body,table,tr,td{font-family:微软雅黑;font-size:12px; border:0px solid red}
*{ margin:0px; padding:0px;}
-->
  </style>

  <script>
    $(function(){
      $("#insert").click(function(){
        $("#goodsCategor").ajaxSubmit({
          success:function(){
            $.post("insertgoodsCategory",{catId:$("#catId").val(),catName:$("#catName").val(),sort:$("#sort").val(),description:$("#description").val(),isOffline:$("input[name='status']:checked").val()})
          }
        });
      })
    })
  </script>
</head>
<body>
<fieldset class="title">
<legend>类别管理</legend>
<table width="544"  align="center" cellpadding="3" cellspacing="3" id="goodsCategor">
  <tr>
    <td width="87" align="right" >类别编号:</td>
    <td width="421" align="right"><input id="catId" type="text" name="Input" value="${goodsCategory.catId}" /></td>
  </tr>
  <tr>
    <td width="87" align="right" >类别名称:</td>
    <td width="421" align="right"><input id="catName" type="text" name="Input" value="${goodsCategory.catName}" /></td>
  </tr>
  <tr>
    <td align="right" >排序:</td>
    <td align="right"><input id="sort" type="text" name="Input2" value="${goodsCategory.sort}" /></td>
  </tr>
  <tr>
    <td align="right" >描述:</td>
    <td align="right"><input id="description" type="text" name="Input3" value="${goodsCategory.description}" /></td>
  </tr>


  <tr>
    <td align="right">是否显示:</td>
    <c:choose>
      <c:when test="${goodsCategory.isOffline==0}">
        <td align="right">
          <input value="1"  type="radio" name="status"  />
          是 |
          <input  value="0"  checked type="radio" name="status" />
          否</td>
      </c:when>
      <c:otherwise>
        <td align="right" width="20">
          <input value="1" type="radio" name="status" checked />
          是 |
          <input value="0"   type="radio" name="status" />
          否</td>
      </c:otherwise>
    </c:choose>
  </tr>

  <tr>
    <td height="50">&nbsp;</td>
    <td align="right" valign="bottom"><a  value="提交" class="easyui-linkbutton" id="insert">增加</a></td>
  </tr>
</table>
</fieldset>
</body>

</html>