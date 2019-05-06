<%@page import="java.util.ArrayList"%>
<%@page import="DAO.SanPhamMoi"%>
<%@page import="model.products" %>
<%@page import="DAO.SanPhamById" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href='http://fonts.googleapis.com/css?family=Dosis:300,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="../assets/dest/css/font-awesome.min.css">
	<link rel="stylesheet" href="../assets/dest/vendors/colorbox/example3/colorbox.css">
	<link rel="stylesheet" title="style" href="../assets/dest/css/style.css">
	<link rel="stylesheet" href="../assets/dest/css/animate.css">
	<link rel="stylesheet" title="style" href="../assets/dest/css/huong-style.css">
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>
		<div class="inner-header">
		<div class="container">
			<div class="pull-left">
				<h6 class="inner-title">Product</h6>
			</div>
			
<%
String sql="SELECT * FROM products where id="+request.getParameter("id");
	SanPhamById temp=new SanPhamById();
	     products sp=temp.getSanPhamById(sql);
   
%>
			<div class="pull-right">
				<div class="beta-breadcrumb font-large">
					<a href="index.html">Home</a> / <span><%=sp.getName() %></span>
				</div>
			</div>
			<div class="clearfix"></div>
		</div>
	</div>

	<div class="container">
		<div id="content">
			<div class="row">
				<div class="col-sm-9">

					<div class="row">
						<div class="col-sm-4">
							<img src="../image/product/<%=sp.getImage() %>" alt="">
						</div>
						<div class="col-sm-8">
							<div class="single-item-body">
								<p class="single-item-title"><%=sp.getName() %></p>
								<p class="single-item-price">
									<span><%=sp.getUnit_price() %></span>
								</p>
							</div>

							<div class="clearfix"></div>
							<div class="space20">&nbsp;</div>

							<div class="single-item-desc">
								<p><%=sp.getDescription() %></p>
							</div>
							<div class="space20">&nbsp;</div>

							<p>Options:</p>
							<div class="single-item-options">
								
								<select class="wc-select" name="color">
									<option>Color</option>
									<option value="Red">Red</option>
									<option value="Green">Green</option>
									<option value="Yellow">Yellow</option>
									<option value="Black">Black</option>
									<option value="White">White</option>
								</select>
								
								<a class="add-to-cart" href="#"><i class="fa fa-shopping-cart"></i></a>
								<div class="clearfix"></div>
							</div>
						</div>
					</div>

					<div class="space40">&nbsp;</div>
					<div class="woocommerce-tabs">
						<ul class="tabs">
							<li><a href="#tab-description">Description</a></li>
							<li><a href="#tab-reviews">Reviews (0)</a></li>
						</ul>

						<div class="panel" id="tab-description">
							<p><%=sp.getDescription() %></p>
						</div>
						<div class="panel" id="tab-reviews">
							<p>No Reviews</p>
						</div>
					</div>
					<div class="space50">&nbsp;</div>
					<div class="beta-products-list">
						<h4>Sản Phẩm bạn có thể quan tâm</h4>
 <%
 SanPhamMoi temp1 =new SanPhamMoi();
      sql="SELECT * FROM products ";
         ArrayList<products> sp1= temp1.getSanPhamMoi(sql);
         sp1=temp1.getSanPhamMoibyPage(sp1,1, 3);
      sql="SELECT * FROM products where  new=1";
      ArrayList<products> spNew= temp1.getSanPhamMoi(sql);
                spNew=temp1.getSanPhamMoibyPage(spNew,1,4);
        sql="SELECT * FROM products where  promotion_price>0";
         ArrayList<products> spKM= temp1.getSanPhamKhuyenMai(sql);
          spKM=temp1.getSanPhamMoibyPage(spKM,1,4);
 %>
                
						<div class="row">
						  <% for(products sp2:sp1){ %>
							<div class="col-sm-4">
								<div class="single-item">
									<div class="single-item-header">
										<a href="product.html"><img height="300px" src="../image/product/<%=sp2.getImage() %>" alt=""></a>
									</div>
									<div class="single-item-body">
										<p class="single-item-title"><%=sp2.getName() %></p>
										<p class="single-item-price">
											<span><%=sp2.getUnit_price() %></span>
										</p>
									</div>
									<div class="single-item-caption">
										<a class="add-to-cart pull-left" href="product.html"><i class="fa fa-shopping-cart"></i></a>
										<a class="beta-btn primary" href="product.html">Details <i class="fa fa-chevron-right"></i></a>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
							<%} %>
						</div>
					</div> <!-- .beta-products-list -->
				</div>
				<div class="col-sm-3 aside">
					<div class="widget">
						<h3 class="widget-title">Sản phẩm khuyến mãi</h3>
						<div class="widget-body">
							<div class="beta-sales beta-lists">
							<% for(products sp3:spKM){%>
								<div class="media beta-sales-item">
									<a class="pull-left" href="product.html"><img   src="../image/product/<%=sp3.getImage() %>" alt=""></a>
									<div class="media-body">
										<%=sp3.getName() %>
										<span class="beta-sales-price"><%=sp3.getUnit_price() %></span>
									</div>
								</div>
								<%} %>
								</div>
						</div>
					</div> <!-- best sellers widget -->
					<div class="widget">
						<h3 class="widget-title">Sản Phẩm Mới</h3>
						<div class="widget-body">
							<div class="beta-sales beta-lists">
							<% for(products sp4:spNew){ %>
								<div class="media beta-sales-item">
									<a class="pull-left" href="product.html"><img src="../image/product/<%=sp4.getImage() %>" alt=""></a>
									<div class="media-body">
										<%=sp4.getName() %>
										<span class="beta-sales-price"><%=sp4.getUnit_price() %></span>
									</div>
								</div>
								<%} %>
								</div>
								
						</div>
					</div> <!-- best sellers widget -->
				</div>
			</div>
		</div> <!-- #content -->
	</div> <!-- .container -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<jsp:include page="/layout/script.jsp"></jsp:include>
	<script type="text/javascript">
    $(function() {
        // this will get the full URL at the address bar
        var url = window.location.href;

        // passes on every "a" tag
        $(".main-menu a").each(function() {
            // checks if its the same on the address bar
            if (url == (this.href)) {
                $(this).closest("li").addClass("active");
				$(this).parents('li').addClass('parent-active');
            }
        });
    });


</script>
<script>
	 jQuery(document).ready(function($) {
                'use strict';

// color box

//color
      jQuery('#style-selector').animate({
      left: '-213px'
    });

    jQuery('#style-selector a.close').click(function(e){
      e.preventDefault();
      var div = jQuery('#style-selector');
      if (div.css('left') === '-213px') {
        jQuery('#style-selector').animate({
          left: '0'
        });
        jQuery(this).removeClass('icon-angle-left');
        jQuery(this).addClass('icon-angle-right');
      } else {
        jQuery('#style-selector').animate({
          left: '-213px'
        });
        jQuery(this).removeClass('icon-angle-right');
        jQuery(this).addClass('icon-angle-left');
      }
    });
				});
	</script>
</body>
</html>