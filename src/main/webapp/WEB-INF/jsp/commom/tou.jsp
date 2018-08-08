<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
  <title>饰品销售管理</title>
  <link rel="stylesheet" type="text/css" href="easyui/themes/default/easyui.css">
  <link rel="stylesheet" type="text/css" href="easyui/themes/icon.css">
  <script type="text/javascript" src="easyui/js/jquery-1.4.4.min.js"></script>
  <script type="text/javascript" src="easyui/js/jquery.easyui.min.js"></script>

</head>
<body>
<div class="easyui-layout" style="width:100%;height:100%;">
  <div region="north" split="true" style="height: 80px" ><h1>饰品销售管理平台</h1></div>
  <div region="west" title="操作区" style="width:200px;">
    <p style="padding:5px;margin:0;"></p>
    <ul class="easyui-tree">
      <li>
        <span>饰品销售管理平台</span>
        <ul>
          <li><span><a href="memberinfo">会员管理</a></span></li>
          <li><span><a href="atricle"> 文章管理</a></span></li>
          <li><span><a href="comment">评论管理</a></span></li>
          <li><span>订单管理</span></li>
          <li><span><a href="advertisement"> 广告管理</a></span></li>
          <li><span>商品管理</span></li>
          <li><span><a href="goodscategory">类别管理</a> </span></li>
          <li><span>系统设置</span></li>
        </ul>
      </li>
    </ul>
  </div>

