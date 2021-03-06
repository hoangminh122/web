<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="DAO.DanhMucDAO"%>
<%@page import="model.products"%>
<%@page import="model.Order" %>
<%@page import="model.Item"%>
<%@page import="model.type_products" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/web/" />
</head>
<body>
	<div id="header">
		<div class="header-top">
			<div class="container">
				<div class="pull-left auto-width-left">
					<ul class="top-menu menu-beta l-inline">
						<li><a href=""><i class="fa fa-home"></i> 90-92 Lê Thị Riêng, Bến Thành, Quận 1</a></li>
						<li><a href=""><i class="fa fa-phone"></i> 0163 296 7751</a></li>
					</ul>
				</div>
				<div class="pull-right auto-width-right">
					<ul class="top-details menu-beta l-inline">
						<li><a href="#"><i class="fa fa-user"></i>Tài khoản</a></li>
						<li><a href="#">Đăng kí</a></li>
						<li><a href="pages/product_list.jsp">Đăng nhập</a></li>
					</ul>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-top -->
		<div class="header-body">
			<div class="container beta-relative">
				<div class="pull-left">
					<a href="index.html" id="logo"><img src="assets/dest/images/logo-cake.png" width="200px" alt=""></a>
				</div>
				<div class="pull-right beta-components space-left ov">
					<div class="space10">&nbsp;</div>
					<div class="beta-comp">
						<form role="search" method="get" id="searchform" action="/">
					        <input type="text" value="" name="s" id="s" placeholder="Nhập từ khóa..." />
					        <button class="fa fa-search" type="submit" id="searchsubmit"></button>
						</form>
					</div>

					<div class="beta-comp">
						<div class="cart">
							<div class="beta-select"><i class="fa fa-shopping-cart"></i> Giỏ hàng (Trống) <i class="fa fa-chevron-down"></i></div>
							<div class="beta-dropdown cart-body">
							<%      float tongTien=0;
									Order cart=new Order();
									if(session.getAttribute("cart")!=null)
									     {
									        cart=(Order)session.getAttribute("cart");%>
							   <%     for(Item item :cart.getItems()){ %>
								<div class="cart-item">
									<div class="media">
										<a class="pull-left" href="#"><img src="image/product/<%=item.getProduct().getImage() %>" alt=""></a>
										<div class="media-body">
											<span class="cart-item-title"><%=item.getProduct().getName() %></span>
											<span class="cart-item-options">Size: XS; Colar: Navy</span>
											<span class="cart-item-amount"><%=item.getQuantity()%>*<span><%=item.getPrice() %></span></span>
										</div>
									</div>
								</div>
								<%tongTien+=item.getQuantity()*item.getPrice();%>
							<%}} %>
								<div class="cart-caption">
									<div class="cart-total text-right">Tổng tiền: <span class="cart-total-value"><%=tongTien%>đ</span></div>
									<div class="clearfix"></div>
           
									<div class="center">
										<div class="space10">&nbsp;</div>
										<%  if(tongTien>0){ %>
										<a href="pages/checkout.jsp " class="beta-btn primary text-center">Đặt hàng <i class="fa fa-chevron-right"></i></a>
									   <%   }else{   %>
									     <a href="pages/index.jsp" class="beta-btn primary text-center">Đặt hàng <i class="fa fa-chevron-right"></i></a>
									     
									    <%} %>
								</div>
							</div>
						</div> <!-- .cart -->
					</div>
				</div>
				<div class="clearfix"></div>
			</div> <!-- .container -->
		</div> <!-- .header-body -->
		<div class="header-bottom" style="background-color: #0277b8;">
			<div class="container">
				<a class="visible-xs beta-menu-toggle pull-right" href="#"><span class='beta-menu-toggle-text'>Menu</span> <i class="fa fa-bars"></i></a>
				<div class="visible-xs clearfix"></div>
				<nav class="main-menu">
					<ul class="l-inline ov">
						<li><a href="pages/index.jsp">Trang chủ</a></li>
						<li><a href="pages/type_products.jsp">Sản phẩm</a>
							<ul class="sub-menu">
							<% DanhMucDAO temp=new DanhMucDAO();
							for(type_products loaisp :temp.getTypeProduct("SELECT * FROM type_products")){ %>
								<li><a href="pages/type_products.jsp?id_type=<%=loaisp.getId()%>"><%= loaisp.getName() %></a></li>
								<% } %>
							</ul>
						</li>
						<li><a href="about.html">Giới thiệu</a></li>
						<li><a href="contacts.html">Liên hệ</a></li>
					</ul>
					<div class="clearfix"></div>
				</nav>
			</div> <!-- .container -->
		</div> <!-- .header-bottom -->
	</div> <!-- #header -->
</body>
</html>