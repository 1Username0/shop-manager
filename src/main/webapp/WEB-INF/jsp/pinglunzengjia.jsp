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

            $.post("insertcomment",{scommId:$("#scommId").val(),goodisId:$("#goodisId").val(),scommContent:$("#scommContent").val(),scommMemberid:$("#scommMemberid").val(),scommMembername:$("#scommMembername").val(),scommMemberavatar:$("#scommMemberavatar").val()})

      })
    })
  </script>
</head>
<body>
<fieldset class="title">
<legend>评论管理</legend>
<table width="544"  align="center" cellpadding="3" cellspacing="3" id="comment">
  <tr>
    <td width="87" align="right" >评论编号:</td>
    <td width="421" align="right"><input id="scommId" type="text" name="Input" value="${comment.scommId}" /></td>
  </tr>
  <tr>
    <td width="87" align="right" >商品编号:</td>
    <td width="421" align="right"><input id="goodisId" type="text" name="Input" value="${comment.goodisId}" /></td>
  </tr>
  <tr>
    <td align="right" >评论:</td>
    <td align="right"><input id="scommContent" type="text" name="Input2" value="${comment.scommContent}" /></td>
  </tr>
  <tr>
    <td align="right" >会员编号:</td>
    <td align="right"><input id="scommMemberid" type="text" name="Input3" value="${comment.scommMemberid}" /></td>
  </tr>
  <tr>
    <td align="right" >会员名字:</td>
    <td align="right"><input id="scommMembername" type="text" name="Input4" value="${comment.scommMembername}" /></td>
  </tr>



  <tr>
    <td height="50">&nbsp;</td>
    <td align="right" valign="bottom"><a  value="提交" class="easyui-linkbutton" id="insert">增加</a></td>
  </tr>
</table>
</fieldset>

</body>

</html>