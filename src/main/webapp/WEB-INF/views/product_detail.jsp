<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="utf-8" isELIgnored="false" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="cp" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html lang="zh-CN">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>商品详情</title>

      <link href="${cp}/css/bootstrap.min.css" rel="stylesheet">
      <link href="${cp}/css/style.css" rel="stylesheet">

      <script src="${cp}/js/jquery.min.js" type="text/javascript"></script>
      <script src="${cp}/js/bootstrap.min.js" type="text/javascript"></script>
      <script src="${cp}/js/ajaxfileupload.js" type="text/javascript"></script>
      <script src="${cp}/js/layer.js" type="text/javascript"></script>

    <!--[if lt IE 9]>
      <script src="${cp}/js/html5shiv.min.js"></script>
      <script src="${cp}/js/respond.min.js"></script>
    <![endif]-->
  </head>
  <body>
    <!--导航栏部分-->
    <jsp:include page="include/header.jsp"/>

    <!-- 模态框（Modal） -->
    <div class="modal fade" id="myEditModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal"
                            aria-hidden="true">×
                    </button>
                    <h4 class="modal-title" id="myModalLabel">
                        请编辑您的商品
                    </h4>
                </div>
                <div class="modal-body">
                    <div  class="form-horizontal">
                        <div class="form-group">
                            <label for="productName" class="col-sm-2 col-md-2 control-label">商品名称</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="productName" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productDescribe" class="col-sm-2 col-md-2 control-label">商品描述</label>
                            <div class="col-sm-6 col-md-6">
                                <textarea type="text" class="form-control" id="productDescribe" placeholder=""></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="keyWord" class="col-sm-2 col-md-2 control-label">关键词</label>
                            <div class="col-sm-6 col-md-6">
                                <textarea type="text" class="form-control" id="keyWord" placeholder=""></textarea>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productPrice" class="col-sm-2 col-md-2 control-label">商品价格</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="productPrice" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productCount" class="col-sm-2 col-md-2 control-label">商品数量</label>
                            <div class="col-sm-6 col-md-6">
                                <input type="text" class="form-control" id="productCount" placeholder="" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productType" class="col-sm-2 col-md-2 control-label">商品类别</label>
                            <div class="col-sm-6 col-md-6">
                                <select name="productType" class="form-control" id="productType">
                                    <option value="1">衣服配饰</option>
                                    <option value="2">数码产品</option>
                                    <option value="3">书籍办公</option>
                                    <option value="4">游戏周边</option>
                                    <option value="5">生活用品</option>
                                    <option value="6">化妆用品</option>
                                    <option value="7">运动用品</option>
                                </select>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="productImgUpload" class="col-sm-2 col-md-2 control-label" accept="image/jpg">商品图片</label>
                            <div class="col-sm-6 col-md-6">
                                <input name="productImgUpload" type="file"  id="productImgUpload"/>
                                <p class="help-block">上传的图片大小应为280*160大小</p>
                            </div>
                            <%--<button class="btn btn-primary col-sm-2 col-md-2" onclick="fileUpload()">上传图片</button>--%>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-offset-2 col-sm-6" id="imgPreSee">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default"
                            data-dismiss="modal">关闭
                    </button>
                    <button type="button" class="btn btn-primary" type="submit" onclick="updateProduct()">
                        提交更改
                    </button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->

    <!-- 中间内容 -->
    <div class="container-fluid">
        <div class="row">
            <div class="col-sm-1 col-md-1"></div>
            <div class="col-sm-10 col-md-10">
                <h1>${productDetail.name}</h1>
                <hr/>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-1 col-md-1"></div>
            <div class="col-sm-5 col-md-5">
                <img class="detail-img" src="${cp}/img/${productDetail.id}.jpg?data=${datatime}">
            </div>
            <div class="col-sm-5 col-md-5 detail-x">
                <table class="table table-striped">
                    <tr>
                        <th>商品名称</th>
                        <td>${productDetail.name}</td>
                    </tr>
                    <tr>
                        <th>商品价格</th>
                        <td>${productDetail.price}</td>
                    </tr>
                    <tr>
                        <th>商品描述</th>
                        <td>${productDetail.description}</td>
                    </tr>
                    <tr>
                        <th>商品类别</th>
                        <td>${productDetail.type}</td>
                    </tr>
                    <tr>
                        <th>商品库存</th>
                        <td>${productDetail.counts}</td>
                    </tr>
                    <c:if test="${currentUser.role == 1}">
                        <tr>
                            <th>已出售</th>
                            <td><strong>${productDetail.sales}</strong></td>
                        </tr>
                    </c:if>
                    <c:if test="${currentUser.role == 0}">
                        <tr>
                            <th>购买数量</th>
                            <td>
                                <div class="btn-group" role="group">
                                    <button type="button" class="btn btn-default" onclick="subCounts()">-</button>
                                    <button id="productCounts" type="button" class="btn btn-default">1</button>
                                    <button type="button" class="btn btn-default" onclick="addCounts(1)">+</button>
                                </div>
                            </td>
                        </tr>
                    </c:if>
                </table>
                <div class="row">
                    <c:if test="${currentUser.role == 0}">
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <button class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4" onclick="addToShoppingCar(${productDetail.id})">添加购物车</button>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <button  class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4" onclick="buyConfirm(${productDetail.id})">购买</button>
                    </c:if>
                    <c:if test="${currentUser.role == 1}">
                        <div class="col-sm-1 col-md-1 col-lg-1"></div>
                        <button class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4" onclick="editProduct(${productDetail.id})">编辑</button>
                        <div class="col-sm-2 col-md-2 col-lg-2"></div>
                        <!--查询是否可以删除-->
                        <c:if test="${productDetail.sales == 0}">
                            <button  class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4" onclick="deleteProduct(${productDetail.id})">删除</button>
                        </c:if>
                        <c:if test="${productDetail.sales != 0}">
                            <button  class="btn btn-danger btn-lg col-sm-4 col-md-4 col-lg-4" onclick="deleteProduct(${productDetail.id})" disabled="disabled">删除</button>
                        </c:if>
                    </c:if>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-sm-1 col-md-1 col-lg-1"></div>
            <div class="col-sm-10 col-md-10 col-lg-10">
                <hr class="division"/>
                <table class="table evaluationTable" border="0" id="evaluation">
                </table>
                <hr/>
                <div id="inputArea"></div>
            </div>
        </div>
    </div>

    <!-- 尾部 -->
    <jsp:include page="include/foot.jsp"/>
  <script type="text/javascript">
      listEvaluations();

      function addToShoppingCar(productId) {
          judgeIsLogin();
          layer.confirm('添加购物车？', {icon: 1, title:'买我',btn:['马上剁手','我再想想']},
              function(index){
                  var productCounts = document.getElementById("productCounts");
                  var counts = parseInt(productCounts.innerHTML);
                  var shoppingCar = {};
                  shoppingCar.userId = ${currentUser.id};
                  shoppingCar.productId = productId;
                  shoppingCar.counts = counts;
                  var addResult = "";
                  $.ajax({
                      async : false,
                      type : 'POST',
                      url : '${cp}/addShoppingCar',
                      data : shoppingCar,
                      dataType : 'json',
                      success : function(result) {
                          addResult = result.result;
                      },
                      error : function(result) {
                          layer.alert('查询用户错误');
                      }
                  });
                  if(addResult == "success") {
                      layer.confirm('前往购物车？', {icon: 1, title:'添加成功',btn:['前往购物车','继续浏览']},
                          function(){
                              window.location.href = "${cp}/shopping_car";
                          },
                          function(index){
                              layer.close(index);}
                      );
                  }
                  layer.close();
              }
          );
      }

      function judgeIsLogin() {
          if("${currentUser.id}" == null || "${currentUser.id}" == undefined || "${currentUser.id}" ==""){
              window.location.href = "${cp}/login";
          }
      }

      function subCounts() {
          var productCounts = document.getElementById("productCounts");
          var counts = parseInt(productCounts.innerHTML);
          if(counts>=2)
              counts--;
          productCounts.innerHTML = counts;
      }

      function addCounts() {
          var productCounts = document.getElementById("productCounts");
          var counts = parseInt(productCounts.innerHTML);
          if(counts<${productDetail.counts})
              counts++;
          productCounts.innerHTML = counts;
      }

      function buyConfirm(productId) {
          var address = getUserAddress(${currentUser.id});
          var phoneNumber = getUserPhoneNumber(${currentUser.id});
          var productCounts = document.getElementById("productCounts");
          var counts = parseInt(productCounts.innerHTML);
          var product = getProductById(productId);
          var html = '<div class="col-sm-1 col-md-1 col-lg-1"></div>'+
                  '<div class="col-sm-10 col-md-10 col-lg-10">'+
                  '<table class="table confirm-margin">'+
                  '<tr>'+
                  '<th>商品名称：</th>'+
                  '<td>'+product.name+'</td>'+
                  '</tr>'+
                  '<tr>'+
                  '<th>商品单价：</th>'+
                  '<td>'+product.price+'</td>'+
                  '</tr>'+
                  '<tr>'+
                  '<th>购买数量：</th>'+
                  '<td>'+counts+'</td>'+
                  '</tr>'+
                  '<tr>'+
                  '<th>总金额：</th>'+
                  '<td>'+counts*product.price+'</td>'+
                  '</tr>'+
                  '<tr>'+
                  '<th>收货地址：</th>'+
                  '<td>'+address+'</td>'+
                  '</tr>'+
                  '<tr>'+
                  '<th>联系电话：</th>'+
                  '<td>'+phoneNumber+'</td>'+
                  '</tr>'+
                  '</table>'+
                  '<div class="row">'+
                  '<div class="col-sm-4 col-md-4 col-lg-4"></div>'+
                  '<button class="btn btn-danger col-sm-4 col-md-4 col-lg-4" onclick="addToShoppingRecords('+productId+')">确认购买</button>'+
                  '</div>'+
                  '</div>';
          layer.open({
              type:1,
              title:'请确认订单信息：',
              content:html,
              area:['650px','350px'],
          });
      }

      function getProductById(id) {
          var productResult = "";
          var product = {};
          product.id = id;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getProductById',
              data : product,
              dataType : 'json',
              success : function(result) {
                  productResult = result.result;
              },
              error : function(result) {
                  layer.alert('查询错误');
              }
          });
          productResult = JSON.parse(productResult);
          return productResult;
      }

      function getUserAddress(id) {
          var address = "";
          var user = {};
          user.id = id;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getUserAddressAndPhoneNumber',
              data : user,
              dataType : 'json',
              success : function(result) {
                  address = result.address;
              },
              error : function(result) {
                  layer.alert('查询错误');
              }
          });
          return address;
      }

      function getUserPhoneNumber(id) {
          var phoneNumber = "";
          var user = {};
          user.id = id;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getUserAddressAndPhoneNumber',
              data : user,
              dataType : 'json',
              success : function(result) {
                  phoneNumber = result.phoneNumber;
              },
              error : function(result) {
                  layer.alert('查询错误');
              }
          });
          return phoneNumber;
      }

      function addToShoppingRecords(productId) {
          judgeIsLogin();
          var productCounts = document.getElementById("productCounts");
          var counts = parseInt(productCounts.innerHTML);
          var shoppingRecord = {};
          shoppingRecord.userId = ${currentUser.id};
          shoppingRecord.productId = productId;
          shoppingRecord.counts = counts;
          var buyResult = "";
          var picName = ""
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/addShoppingRecord',
              data : shoppingRecord,
              dataType : 'json',
              success : function(result) {
                  buyResult = result.result;
                  picName = result.userId + '_' + result.productId + '_' + result.time;
              },
              error : function(result) {
                  layer.alert('购买错误');
              }
          });
          if(buyResult == "success") {
              layer.confirm('前往订单财务？', {icon: 1, title:'购买成功',btn:['前往订单','继续购买']},
                  function(){
                      window.location.href = "${cp}/shopping_record";
                  },
                  function(index){
                      layer.close(index);}
              );
              uploadThumbNailPic(picName);
          }
          else if(buyResult == "unEnough"){
              layer.alert("库存不足，购买失败")
          }


      }

      function listEvaluations() {
          var evaluations = getEvaluations();
          var evaluationTable = document.getElementById("evaluation");
          var html = "";
          for(var i=0;i<evaluations.length;i++){
              var user = getUserById(evaluations[i].userId);
              html+='<tr>'+
                      '<th>'+user.nickName+'</th>'+
                      '<td>'+evaluations[i].content+'</td>'+
                      '</tr>';
          }
          evaluationTable.innerHTML += html;

          if(getUserProductRecord() == "true"){
              var inputArea = document.getElementById("inputArea");
              html= '<div class="col-sm-12 col-md-12 col-lg-12">'+
                      '<textarea class="form-control" rows="4" id="evaluationText"></textarea>'+
                      '</div>'+
                      '<div class="col-sm-12 col-md-12 col-lg-12">'+
                      '<div class="col-sm-4 col-md-4 col-lg-4"></div>'+
                      '<button class="btn btn-primary btn-lg evaluationButton col-sm-4 col-md-4 col-lg-4" onclick="addToEvaluation()">评价</button>'+
                      '</div>';
              inputArea.innerHTML +=html;
          }

      }

      function getUserProductRecord() {
          var results = "";
          var product = {};
          product.userId = ${currentUser.id};
          product.productId = ${productDetail.id};
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getUserProductRecord',
              data : product,
              dataType : 'json',
              success : function(result) {
                  results = result.result;
              },
              error : function(result) {
                  layer.alert('查询错误');
              }
          });
          return results;
      }

      function getEvaluations() {
          var evaluations = "";
          var product = {};
          product.productId = ${productDetail.id};
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getShoppingEvaluations',
              data : product,
              dataType : 'json',
              success : function(result) {
                  evaluations = result.result;
              },
              error : function(result) {
                  layer.alert('查询错误');
              }
          });
          evaluations = eval("("+evaluations+")");
          return evaluations;
      }

      function getUserById(id) {
          var userResult = "";
          var user = {};
          user.id = id;
          $.ajax({
              async : false, //设置同步
              type : 'POST',
              url : '${cp}/getUserById',
              data : user,
              dataType : 'json',
              success : function(result) {
                  userResult = result.result;
              },
              error : function(result) {
                  layer.alert('查询错误');
              }
          });
          userResult = JSON.parse(userResult);
          return userResult;
      }

      function addToEvaluation() {
          var inputText = document.getElementById("evaluationText").value;
          var evaluation = {};
          evaluation.userId = ${currentUser.id};
          evaluation.productId = ${productDetail.id};
          evaluation.content = inputText;
          var addResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/addShoppingEvaluation',
              data : evaluation,
              dataType : 'json',
              success : function(result) {
                  addResult = result.result;
              },
              error : function(result) {
                  layer.alert('查询用户错误');
              }
          });
          if(addResult = "success"){
              layer.msg("评价成功",{icon:1});
              window.location.href = "${cp}/product_detail";
          }
      }

      function editProduct(productId) {
          $('#productName').val('${productDetail.name}');
          $('#productDescribe').val('${productDetail.description}');
          $('#productPrice').val(${productDetail.price});
          $('#productCount').val(${productDetail.counts});
          $('#productType').val('${productDetail.type}');
          $('#keyWord').val('${productDetail.keyWord}');
          $('#myEditModal').modal({
              keyboard: true
          });
      }

      function updateProduct() {
          judgeIsLogin();
          var tmpProduct = {};
          tmpProduct.id = ${productDetail.id};
          tmpProduct.name = $('#productName').val();
          tmpProduct.description = $('#productDescribe').val();
          tmpProduct.price = $('#productPrice').val();
          tmpProduct.counts = $('#productCount').val();
          tmpProduct.type = $('#productType').val();
          tmpProduct.keyWord = $('#keyWord').val();
          var editResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/editProduct',
              data : tmpProduct,
              dataType : 'json',
              success : function(result) {
                  editResult = result.result;
              },
              error : function(result) {
                  layer.alert('更新商品错误');
              }
          });
          if(editResult == "success") {
             // layer.msg('修改成功！');
              fileUpload(${productDetail.id});
              location.reload();
          }
      }

      function deleteProduct(id) {
          var product = {};
          product.id = id;
          var deleteResult = "";
          $.ajax({
              async : false,
              type : 'POST',
              url : '${cp}/deleteProduct',
              data : product,
              dataType : 'json',
              success : function(result) {
                  deleteResult = result.result;
              },
              error : function(result) {
                  layer.alert('删除商品错误');
              }
          });
          if(deleteResult != "success")
              layer.alert("删除商品出错");
          listAllProduct();
      }

      function fileUpload(id) {
          var results = "";
          $.ajaxFileUpload({
              url:'${cp}/uploadFile?id='+id,
              secureuri:false ,
              fileElementId:'productImgUpload',
              type:'POST',
              dataType : 'text',
              success: function (result){
                  result = result.replace(/<pre.*?>/g, '');  //ajaxFileUpload会对服务器响应回来的text内容加上<pre style="....">text</pre>前后缀
                  result = result.replace(/<PRE.*?>/g, '');
                  result = result.replace("<PRE>", '');
                  result = result.replace("</PRE>", '');
                  result = result.replace("<pre>", '');
                  result = result.replace("</pre>", '');
                  result = JSON.parse(result);
                  results = result.result;
                  if(results == "success") {
                      layer.msg("图片上传成功", {icon: 1});
                      window.location.href = "${cp}/product_detail";
                      //var imgPreSee = document.getElementById("imgPreSee");
                      //var imgSrc = '${cp}/img/'+name+'.jpg';
                      //imgPreSee.innerHTML +='<img src="'+imgSrc+')" class="col-sm-12 col-md-12 col-lg-12"/>';
                  }
                  else {
                      layer.msg("图片上传失败", {icon: 0});
                  }

              },
              error: function ()
              {
                  layer.alert("上传错误");
              }}
          );
      }

      function getBase64Image(img) {
          var canvas = document.createElement("canvas");
          canvas.width = img.width;
          canvas.height = img.height;
          var ctx = canvas.getContext("2d");
          ctx.drawImage(img, 0, 0, img.width, img.height);
          var dataURL = canvas.toDataURL("image/png");
          return dataURL;
          //return dataURL.replace("data:image/png;base64,", "");
      }

      function uploadThumbNailPic(picName) {
          var img = new Image();
          var pic = {};
          img.onload=function(){
              var RePicWidth = 80; //这里修改为您想显示的宽度值
              var TrueWidth = img.width;    //图片实际宽度
              var TrueHeight = img.height;  //图片实际高度
              var Multiple = TrueWidth / RePicWidth;  //图片缩小(放大)的倍数
              img.width = RePicWidth;  //图片显示的可视宽度
              img.height = TrueHeight / Multiple;  //图片显示的可视高度
              var data = getBase64Image(img);
              var uploadResult = "";
              pic.name = picName;
              pic.content = data;
              $.ajax({
                  async : false,
                  type : 'POST',
                  url : '${cp}/uploadThumbNailPic',
                  data : pic,
                  dataType : 'json',
                  success : function(result) {
                      addResult = result.result;
                  },
                  error : function(result) {
                      layer.alert('查询用户错误');
                  }
              });

          };
          img.src = "${cp}/img/${productDetail.id}.jpg?data=${datatime}";

      }

      function ReSizePic(ThisPic){
          var RePicWidth = 80; //这里修改为您想显示的宽度值
          var TrueWidth = ThisPic.width;    //图片实际宽度
          var TrueHeight = ThisPic.height;  //图片实际高度
          var Multiple = TrueWidth / RePicWidth;  //图片缩小(放大)的倍数
          ThisPic.width = RePicWidth;  //图片显示的可视宽度
          ThisPic.height = TrueHeight / Multiple;  //图片显示的可视高度
          return ThisPic;
      }

  </script>
  </body>
</html>