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
        $("#mempic").ajaxSubmit({
          success:function(url){
            $.post("insertmem",{memberMobile:$("#memberMobile").val(),memberName:$("#memberName").val(),memberId:$("#memberId").val(),memberPic:url,memberEmail:$("#memberEmail").val(),isSell:$("input[name='status']:checked").val(),memberState:$("input[name='status1']:checked").val(),memberBirthday:$("memberBirthday").val(),memberPasswd:$("memberPasswd").val()})
          }
        });
      })
    })
  </script>
</head>
<body>
<fieldset class="title">
<legend>会员管理</legend>
<table width="544"  align="center" cellpadding="3" cellspacing="3" id="member">
  <tr>
    <td width="87" align="right" >会员编号:</td>
    <td width="421" align="right"><input id="memberId" type="text" name="Input" value="${mem.memberId}" /></td>
  </tr>
  <tr>
    <td width="87" align="right" >会员电话:</td>
    <td width="421" align="right"><input id="memberMobile" type="text" name="Input" value="${mem.memberMobile}" /></td>
  </tr>
  <tr>
    <td align="right" >会员名字:</td>
    <td align="right"><input id="memberName" type="text" name="Input2" value="${mem.memberName}" /></td>
  </tr>
  <tr>
    <td align="right" >会员生日:</td>
    <td align="right"><input id="memberBirthday" type="date" name="Input3" value="${mem.memberBirthday}" /></td>
  </tr>
  <tr>
    <td align="right" >会员密码:</td>
    <td align="right"><input id="memberPasswd" type="text" name="Input4" value="${mem.memberPasswd}" /></td>
  </tr>
  <tr>
    <td width="87" align="right" >会员邮箱:</td>
    <td width="421" align="right"><input id="memberEmail" type="text" name="Input5" value="${mem.memberEmail}" /></td>
  </tr>
  <tr>
    <td align="right" valign="top" >会员头像:</td>
    <td align="right">
      <form id="mempic" action="udloadimage" method="post" enctype="multipart/form-data">
      <label id="file_pic">
      <input id="memberPic"  type="file" name="f" style="display: none;" />
      <img src="${mem.memberPic}" width="400" height="100" >
      </label>
      </form>
    </td>
  </tr>

  <tr>
    <td align="right">是否有权发布商品:</td>
    <c:choose>
      <c:when test="${mem.isSell==0}">
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
  <tr>
    <td align="right">会员开启状态:</td>
    <c:choose>
      <c:when test="${mem.memberState==0}">
        <td align="right"><input value="1" type="radio" name="status1"  />
          启用 |
          <input value="0" checked type="radio" name="status1" />
          禁用</td>
      </c:when>
      <c:otherwise>
        <td align="right" width="20"><input value="1" type="radio" name="status1" checked />
          启用 |
          <input  value="0" type="radio" name="status1" />
          禁用</td>
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