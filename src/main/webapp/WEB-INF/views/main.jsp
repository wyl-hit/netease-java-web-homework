<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
	  <meta charset="utf-8">
	  <meta http-equiv="X-UA-Compatible" content="IE=edge">
	  <meta name="viewport" content="width=device-width, initial-scale=1">
	  <title>"shopping"</title>
	  <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
	  <link href="${cp}/css/style.css" rel="stylesheet">
	  <link href="${cp}/css/picbuyed.css" rel="stylesheet">

	  <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
	  <script src="${cp}/js/layer.js" type="text/javascript"></script>
    <!--[if lt IE 9]>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/js/respond.min.js"></script>
    <![endif]-->
  </head>

  <body>
    <!--导航栏部分-->
	<jsp:include page="include/header.jsp"/>
	<!-- 中间内容 -->
	<div class="container-fluid">

		<div class="row">
			<!-- 控制栏 -->
			<div class="col-sm-3 col-md-2 sidebar sidebar-1">
				<ul class="nav nav-sidebar">
					<li class="list-group-item-diy"><a href="#productArea1">衣服配饰 <span class="sr-only">(current)</span></a></li>
					<li class="list-group-item-diy"><a href="#productArea2">数码产品</a></li>
					<li class="list-group-item-diy"><a href="#productArea3">书籍办公</a></li>
					<li class="list-group-item-diy"><a href="#productArea4">游戏周边</a></li>
					<li class="list-group-item-diy"><a href="#productArea5">生活用品</a></li>
					<li class="list-group-item-diy"><a href="#productArea6">化妆用品</a></li>
					<li class="list-group-item-diy"><a href="#productArea7">运动用品</a></li>
				</ul>
			</div>
			<div class="">
			<!-- 控制内容 -->
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				<c:if test="${currentUser.role == 0}">
					<ul id="myTab" class="nav nav-tabs">
						<li class="active">
							<a href="#all" data-toggle="tab" onclick="fresh(0)">
								全部商品
							</a>
						</li>
						<li><a href="#unbuy" data-toggle="tab" onclick="fresh(1)">未购买商品</a></li>
					</ul>
				</c:if>
				<div name="productArea1" class="row pd-10" id="productArea1">
				</div>

				<div name="productArea2" class="row" id="productArea2">
				</div>

				<div name="productArea3" class="row" id="productArea3">
				</div>

                <div name="productArea4" class="row" id="productArea4">
				</div>

				<div name="productArea5" class="row" id="productArea5">
				</div>

				<div name="productArea6" class="row" id="productArea6">
				</div>

				<div name="productArea7" class="row" id="productArea7">
				</div>

			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2">
				<jsp:include page="include/foot.jsp"/>
			</div>
		</div>
	</div>
  </div>

  <script type="text/javascript">

	  var loading = layer.load(0);

      var productType = new Array;
      productType[1] = "衣服配饰";
      productType[2] = "数码产品";
      productType[3] = "书籍办公";
      productType[4] = "游戏周边";
      productType[5] = "生活用品";
      productType[6] = "化妆用品";
      productType[7] = "运动用品";
      var allProduct = getAllProducts();
	  listProducts(allProduct);

	  function listProducts(Products) {

		  var mark = new Array;
          mark[1] = 0;
          mark[2] = 0;
          mark[3] = 0;
          mark[4] = 0;
          mark[5] = 0;
          mark[6] = 0;
          mark[7] = 0;
          var role = "${currentUser.role}";
          for(var index=1;index<=productType.length;index++){
              var areaId = "productArea"+ index;
              var aproductArea = document.getElementById(areaId);
              $("#"+areaId).empty();
          }
          for(var i=0;i<Products.length;i++){
              var html = "";
			  var imgURL = "${cp}/img/"+Products[i].id+".jpg?data=${datatime}";
			  if(!isEmptyObject(role) && Products[i].sales > 0){
                  html += '<div class="col-sm-4 col-md-4" >'+
                      '<div class="boxes pointer" onclick="productDetail('+Products[i].id+')">'+
                      '<div class="big bigimg">'+
					  '<div class="main_img">' +
                      '<img width="auto" height="auto" max-width="100%" max-height="100%" src="'+imgURL+'" onload="ReSizePic(this);">'+
					  '<div class="new"><a href=""  class="sm" id="soure">buyed</a></div>'+
                      '</div>'+
					  '</div>'+
                      '<p class="product-name">'+Products[i].name+'</p>'+
                      '<p class="product-price">¥'+Products[i].price+'</p>'+
                      '</div>';
			  }
			  else{
                  html += '<div class="col-sm-4 col-md-4" >'+
                      '<div class="boxes pointer" onclick="productDetail('+Products[i].id+')">'+
                      '<div class="big bigimg">'+
                      '<img width="auto" height="auto" max-width="100%" max-height="100%" src="'+imgURL+'" onload="ReSizePic(this);">'+
                      '</div>'+
                      '<p class="product-name">'+Products[i].name+'</p>'+
                      '<p class="product-price">¥'+Products[i].price+'</p>'+
                      '</div>'+
                      '</div>';
			  }

              var id = "productArea"+Products[i].type;
              var productArea = document.getElementById(id);
              if(mark[Products[i].type] == 0){
                  html ='<hr/><h1>'+productType[Products[i].type]+'</h1><hr/>'+html;
                  mark[Products[i].type] = 1;
              }
              productArea.innerHTML += html;
		  }
		  layer.close(loading);
	  }
	  function getAllProducts() {
		  var allProducts = null;
		  var nothing = {};
		  $.ajax({
			  async : false, //设置同步
			  type : 'POST',
			  url : '${cp}/getAllProducts',
			  data : nothing,
			  dataType : 'json',
			  success : function(result) {
				  if (result!=null) {
					  allProducts = result.allProducts;
				  }
				  else{
					  layer.alert('查询错误');
				  }
			  },
			  error : function(resoult) {
				  layer.alert('查询错误');
			  }
		  });
		  //划重点划重点，这里的eval方法不同于prase方法，外面加括号
		  allProducts = eval("("+allProducts+")");
		  return allProducts;
	  }

      function getUnBuyedProducts() {
          var unBuyProducts = null;
          var nothing = {};
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getUnBuyProducts',
              data : nothing,
              dataType : 'json',
              success : function(result) {
                  if (result!=null) {
                      unBuyProducts = result.unBuyProducts;
                  }
                  else{
                      layer.alert('查询错误');
                  }
              },
              error : function(resoult) {
                  layer.alert('查询错误');
              }
          });
          //划重点划重点，这里的eval方法不同于prase方法，外面加括号
          unBuyProducts = eval("("+unBuyProducts+")");
          return unBuyProducts;
      }

	  function productDetail(id) {
		  var product = {};
		  var jumpResult = '';
		  product.id = id;
		  $.ajax({
			  async : false, //设置同步
			  type : 'POST',
			  url : '${cp}/productDetail',
			  data : product,
			  dataType : 'json',
			  success : function(result) {
				  jumpResult = result.result;
			  },
			  error : function(resoult) {
				  layer.alert('查询错误');
			  }
		  });

		  if(jumpResult == "success"){
			  window.location.href = "${cp}/product_detail";
		  }
	  }

      function isEmptyObject(obj) {
          for (var key in obj) {
              return false;
          }
          return true;
      }
      function fresh(isAll) {
          var role = "${currentUser.role}";
          if(!isEmptyObject(role) && isAll==1){
              var unBuyedProducts = getUnBuyedProducts();
              listProducts(unBuyedProducts);
		  }
          // isAll == 0 表示全部商品
		  else{
              var allProduct = getAllProducts();
              listProducts(allProduct);
		  }
      }

      function ReSizePic(ThisPic){
          var RePicWidth = 280; //这里修改为您想显示的宽度值
          var RePicHeight = 260; //这里修改为您想显示的宽度值
		  ThisPic.width = RePicWidth;  //图片显示的可视宽度
          ThisPic.height = RePicHeight;  //图片显示的可视高度
      }

  </script>


  </body>
</html>