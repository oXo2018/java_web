<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
	%>
	<%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<base href="<%=basePath %>"/>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>briup电子商务-首页</title>
<link rel="stylesheet" href="css/common.css"/>
<link rel="stylesheet" href="css/style.css" />
<link rel="stylesheet" href="css/icons.css" />
<link rel="stylesheet" href="css/table.css" />
<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script>
<script type="text/javascript">
	$(function(){
		//获取图片路径的隐藏标签
		var imgs=$(".imgs").val();
		var sm=imgs.split("#");
		var maxImgs=sm[0].split(",")
		var minImgs=sm[1].split(",")
		$(".div_img").attr("src",maxImgs[0]);
		for(var i=0;i<minImgs.length;i++){
			if(i==0){
			$(".cn5topy_imglist").append("<li class='current'><img src='"+minImgs[i]+"'></li>");
			}else{
			$(".cn5topy_imglist").append("<li><img src='"+minImgs[i]+"'></li>");
			}
			}
		
		$(".cn5topy_imglist li").click(function(){
			//当前事件是给所有小图片绑定的鼠标点击事件
			//$(this)表示单前点击的小图标（li标签）
			//console.log($(this));
			//取出所有的小图标签<li>
			var n=$(".cn5topy_imglist li");
			for(var i=0;i<n.length;i++){
					//判断某一个标签中class是否含有某个属性值
					if($(n[i]).hasClass("current")){
						//移除标签的属性
						$(n[i]).removeAttr("class");
					}
					//is判断两个jquery对象是不是同一个
					if($(n[i]).is($(this))){
						//给某个标签添加属性
						$(this).attr("class","current");
						$(".div_img").attr("src",maxImgs[i]);
					}
			}
		});
		var intro=$("input[name='introduce']").val();
		var cont=intro.split("#");
		$(".introduce_item").text(cont[0]);
		var imgs=cont[1].split(",")
		for(var i=0;i<imgs.length;i++){
			$(".intro_pics").append("<img class='intro_pic' src='"+imgs[i]+"'>");
		}
		
		$(".parameter").hide();
		$(".wraplist").hide();
		$(".c5_b2_tabs li").click(function(){
			//移除所有的子标签
			$(".c5_b2_tabs li").removeAttr("class")
			var n=$(".c5_b2_tabs li");
			for(var i=0;i<n.length;i++){
				if($(n[i]).hasClass("current")){
					$(n[i]).removeAttr("class");
				}
				if($(n[i]).is($(this))){
					//清空子标签
					$(".intro_pics").empty();
					$(n[i]).attr("class","current");
					if(i==0){
						$(".introduce").show();
						$(".parameter").hide();
						$(".wraplist").hide();
						var intro=$("input[name='introduce']").val();
						var cont=intro.split("#");
						$(".introduce_item").text(cont[0]);
						var imgs=cont[1].split(",")
						for(var i=0;i<imgs.length;i++){
							$(".intro_pics").append("<img class='intro_pic' src='"+imgs[i]+"'>");
						}
					}
					if(i==1){
						$(".introduce").hide();
						$(".parameter").show();
						$(".wraplist").hide();
					}
					if(i==2){
						$(".introduce").hide();
						$(".parameter").hide();
						$(".wraplist").show();
					}
				}
			}
		});
		
		$("#add").on("click",function(){
			var diva = this.parentNode.parentNode;
			var input = $(diva).find("input");
			var value = Number(input.val())+1;
			input.val(value);
			
		});
		$("#minus").on("click",function(){
			var diva = this.parentNode.parentNode;
			var input = $(diva).find("input");
			var value = Number(input.val())-1;
			
			if(value>0){
				input.val(value);
			}else{
				input.val(0);
			}
			
		});
		
		
	});
</script>
<script type="text/javascript">
function addShopCart(bookname){
	alert(bookname+"  加入购物车成功!");
}
</script>

</head>
<body>
	<!--顶部-->
	<div class="top">
    	<div class="top_center">
            <ul class="top_bars">
            	<li><a href="index.html">退出</a>|</li>
                <li><a href="confirmList.html">我的订单<span class="jt_down"></span></a>|</li>
                <li><a href="#">关注杰普<span class="jt_down"></span></a>|</li>
                <li><a href="#">网站导航<span class="jt_down"></span></a></li>
            </ul>
        </div>
    </div>
    <!--头部-->
    <div class="header3">
    	<a href="#"><img src="images/logo.png"></a>
    	<div class="h3_center">
        	<div class="search_box">
            	<input type="text"/>
                <span>搜索</span>
            </div>
        </div>
        <div class="h3_right">
        	<div class="myyy">
            	<a href="userinfo.html">个人信息</a>
                <span class="sj_down"></span>
             </div>
            <div class="tsc">
            	<a href="shopCart.html">去购物车结算</a>
                <span class="sj_right"></span>
            </div>
        </div>
    </div>
    <!--头部导航-->
    <div class="nav_top">
    	<div class="nav_top_center">
            <div>
                全部图书分类
            </div>
            <ul>
                <c:forEach items="${applicationScope.cates}"   var="cate">
                <li><a href="listCateBookSer?id=${cate.id}">${cate.name}</a></li>
          		</c:forEach>
            </ul>
        </div>
    </div>
    
	<div class="container5">
    	<div class="cn5_top">
            <div class="cn5_top_x center01">
            	<a class="font20" href="#">书籍</a> >
                <a href="listCateBookSer?id=${requestScope.product.cate_detail.cate.id}">${requestScope.product.cate_detail.cate.name}</a>
            </div>
            <div class="cn5_top_y center01">
            	<div class="cn5topy_1">
                	<div class="cn5topy_imgview">
                		<input type="hidden" class="imgs" value="${requestScope.product.img}"/>
                    	<img class="div_img" />
                        <ul class="cn5topy_imglist">
                        	<!-- class="current" -->
                        </ul>
                    </div>
                </div>
                <div class="cn5topy_2">
                	<h1 class="pro_title font15">${requestScope.product.name}</h1>
                    <div class="pro_price">
                            <div class="pro_price_x">
                                <p> briup价：<b>￥${requestScope.product.price}</b> <a href="#">(降价通知)</a></p>
                            </div>
                            
                    </div>
                    <div class="pro_ship">
                        <div>
                        	<div class="pro_key fl">服&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;务：</div>
                            <ul class="pro_service f1">
                                <li class="service_fq">分期付款</li>
                                <li class="service_myf">免运费</li>
                                <li class="service_zt">自提</li>
                                <li class="service_th">7天无理由退换货</li>
                            </ul>
                        </div>
                    </div>
                    <div class="pro_ship">
                        <div>
                        	<div class="pro_key fl">剩&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;余：${requestScope.product.remain}</div>
                        </div>
                    </div>
                    <div class="pro_buy">
                    	<div class="pro_buy_nums">
                        	<input type="text" value="1"/>
                            <dl>
                            	<dd id="add">+</dd>
                                <dd id="minus">-</dd>
                            </dl>
                        </div>
                        <div class="pro_addshop"> <a href="javascript:void(0)" onclick="addShopCart('当前书')">加入购物车 </a></div>
                    </div>
                    
                </div>
            </div>
        </div>
    	<div class="c5_b2">
        	
            <div class="c5_b2_right">
            	<!--选项卡-->
            	<ul class="c5_b2_tabs">
                	<li class="current">商品介绍</li>
                    <li >规格参数</li>
                    <li>包装清单</li>
                    <li>商品评价</li>
                </ul>
                <!--介绍-->
                <div class="introduce">
                <input type="hidden" name="introduce" value="${requestScope.product.introduction}"/>
              	<div class="c5_b2_right_1 box">
                        <div class="introduce_item">
                         <!--  内容-->
                        </div>
               		</div>
                    <div id="int_img" class="intro_pics">
                    	
                    </div>
                    </div>
                    <!-- 规格参数 -->
                <div class="parameter">
                <input type="hidden" name="wrap" value="${requestScope.product.parameter}"/>
              	<div class="c5_b2_right_1 box">
                        <div class="introduce_item">
                          <ul>
                        	<li>商品名称：Effective Java (中文版) 第2版22222</li>
                            <li>商品编号：1002024</li>
                            <li class="fr"><a class="color_link1" href="#">更多参数>></a></li>
                          </ul>
                        </div>
               		</div>
                    <div class="intro_pics">
                    	<img class="intro_pic" src="images/viewBook.png">
                    </div>
                    </div>
                    <!-- 包装清单 -->
                <div class="wraplist">
                <input type="hidden" name="wrap" value="${requestScope.product.wrapist}"/>
              	<div class="c5_b2_right_1 box">
                        <div class="introduce_item">
                          <ul>
                        	<li>商品名称：Effective Java (中文版) 第2版333333</li>
                            <li>商品编号：1002024</li>
                            <li class="fr"><a class="color_link1" href="#">更多参数>></a></li>
                          </ul>
                        </div>
               		</div>
                    <div class="intro_pics">
                    	<img class="intro_pic" src="images/viewBook.png">
                    </div>
                    </div>
                </div>
                
                
            <div class="c5_b2_right">
              	<div class="c5_b2_right_2">
                    	<h1>正品行货</h1>
                        <p>briup网上商城向您保证所售商品均为正品，briup自营商品开具机打发票或电子发票。</p>
                        
                        <h1>全国联保</h1>
                        <p>凭质保证书及briup网上商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。briup网上商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！</p>
                        
                        <h1>正品行货</h1>
                        <p>briup网上商城向您保证所售商品均为正品，briup自营商品开具机打发票或电子发票。</p>
                        
                        <h1>全国联保</h1>
                        <p>凭质保证书及briup网上商城发票，可享受全国联保服务，与您亲临商场选购的商品享受相同的质量保证。briup网上商城还为您提供具有竞争力的商品价格和运费政策，请您放心购买！</p>
                        
            		</div> 
            </div>
            
            <!--左侧栏-->
            <div class="c5_b2_left_container">
                <div class="c5_b2_left box">
                    <h1>服务时间 早9：00~凌晨1：00</h1>
                    <p>
                    <a href="#">
                        <img class="callmebyqq" src="images/icon_qq_03.png"/>
                    </a>
                    </p>
                </div>
                
                <div class="c5_b2_left box">
                    <h1>其他种类</h1>
                    <dl>
                        <dd>文学类</dd>
                        <dd>漫画类</dd>
                        <dd>通书类</dd>
                    </dl>
                    <dl>
                        <dd>文学类</dd>
                        <dd>漫画类</dd>
                        <dd>通书类</dd>
                    </dl>
                </div>
            </div> 
        </div>
    </div>
    	
    <div class="c20"></div>
    <!--脚部-->
    <div class="footer3">
    	<div class="f3_top">
        	<div class="f3_center">
                <div class="ts1">品目繁多 愉悦购物</div>
                <div class="ts2">正品保障 天天低价</div>
                <div class="ts3">极速物流 特色定制</div>
                <div class="ts4">优质服务 以客为尊</div>
            </div>
        </div>
        <div class="f3_middle">
        	<ul class="f3_center">
            	<li class="f3_mi_li01">
                	<h1>购物指南</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>配送方式</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>支付方式</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>售后服务</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li01">
                	<h1>服务保障</h1>
                    <p>常见问题</p>
                    <p>找回密码</p>
                    <p>会员介绍</p>
                    <p>购物演示</p>
                </li>
                <li class="f3_mi_li06">
                	<h1>客服中心</h1>
                    <img src="images/qrcode_jprj.jpg" width="80px" height="80px">
                    <p>抢红包、疑问咨询、优惠活动</p>
                </li>
            </ul>
        </div>
        <div class="f3_bottom">
        	<p class="f3_links">
                <a href="#">关于我们</a>|
                <a href="#">联系我们</a>|
                <a href="#">友情链接</a>|
                <a href="#">供货商入驻</a> 
           	</p>
            <p>沪ICP备14033591号-8 杰普briup.com版权所有 杰普软件科技有限公司 </p>
          	<img src="images/police.png">
        </div>
    </div>

</body>
</html>







