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
	height:300px;
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
            $.post("savecomment",{scommId:$("#scommId").val(),scommContent:$("#scommContent").val()})
      })
    })
  </script>
    </head>
    <body>
    <div id="win"></div>
    <fieldset class="title">
      <legend>评论管理</legend>
      <table width="544"  align="center" cellpadding="3" cellspacing="3" id="com">
        <td><input id="scommId" value="${comment.scommId}" style="display:none;"/></td>
        <tr>
          <td width="87" align="right" >评论:</td>
          <td width="421" align="right"><input id="scommContent" type="text" name="Input" value="${comment.scommContent}" /></td>
        </tr>


  <tr>
    <td height="50">&nbsp;</td>
    <td align="right" valign="bottom"><a  value="提交" class="easyui-linkbutton" id="insert">编辑</a></td>
  </tr>
</table>
</fieldset>
<script>
  var showImg = document.querySelector("#file_pic");
  var getImg = document.querySelector("input[type='file']");
  if(typeof FileReader==='undefined'){
    showImg.innerHTML = "抱歉，你的浏览器不支持!";
    getImg.setAttribute('disabled','disabled');
  }else{
    getImg.addEventListener('change',readFile,false);
  }
  function readFile(){
    var file = this.files[0];
    if(!/image\/\w+/.test(file.type)){
      alert("请上传图片！");
      return false;
    }
    var reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = function(e){
      showImg.getElementsByTagName("img")[0].src=this.result ;
    }
  }
</script>
</body>

</html>