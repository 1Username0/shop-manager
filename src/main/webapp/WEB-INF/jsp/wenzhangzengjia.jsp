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
        $("#art").ajaxSubmit({
          success:function(){
            $.post("insertart",{articleId:$("#articleId").val(),articleTitle:$("#articleTitle").val(),amountOfReading:$("#amountOfReading").val(),articleContent:$("#articleContent").val(),articlePicUrl:$("#articlePicUrl").val(),articleShow:$("input[name='status']:checked").val()})
          }
        });
      })
    })
  </script>
</head>
<body>
<fieldset class="title">
<legend>文章管理</legend>
<table width="544"  align="center" cellpadding="3" cellspacing="3" id="art">
  <tr>
    <td width="87" align="right" >文章编号:</td>
    <td width="421" align="right"><input id="articleId" type="text" name="Input" value="${art.articleId}" /></td>
  </tr>
  <tr>
    <td width="87" align="right" >文章标题:</td>
    <td width="421" align="right"><input id="articleTitle" type="text" name="Input" value="${art.articleTitle}" /></td>
  </tr>
  <tr>
    <td align="right" >阅读量:</td>
    <td align="right"><input id="amountOfReading" type="text" name="Input2" value="${art.amountOfReading}" /></td>
  </tr>
  <tr>
    <td align="right" >文章内容:</td>
    <td align="right"><input id="articleContent" type="text" name="Input3" value="${art.articleContent}" /></td>
  </tr>

  <tr>
    <td align="right" valign="top" >图片:</td>
    <td align="right">
      <label id="file_pic">
      <input id="articlePicUrl" value="${art.articlePicUrl}" type="file" name="1" style="display: none;" />
      <img src="${art.articlePicUrl}" width="400" height="100" >
      </label>
    </td>
  </tr>

  <tr>
    <td align="right">是否显示:</td>
    <c:choose>
      <c:when test="${art.articleShow==0}">
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