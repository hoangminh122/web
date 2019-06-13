<%@page import="model.products"%>
<%@page import="java.util.List"%>
<%@page import="model.Item"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="model.Order" %>
    <%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Xuất đơn hàng</title>
<base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/web/" />
<link href='http://fonts.googleapis.com/css?family=Dosis:300,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href=assets/dest/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/dest/vendors/colorbox/example3/colorbox.css">
	<link rel="stylesheet" href="assets/dest/rs-plugin/css/settings.css">
	<link rel="stylesheet" href="assets/dest/rs-plugin/css/responsive.css">
	<link rel="stylesheet" title="style" href="assets/dest/css/style.css">
	<link rel="stylesheet" href="assets/dest/css/animate.css">
	<link rel="stylesheet" title="style" href="assets/dest/css/huong-style.css">
</head>
<body>
	<jsp:include page="/layout/header.jsp"></jsp:include>

	
		<div class="container">
		<div id="content">
			
			<form action="dathang" method="post" class="beta-form-checkout">
				<div class="row">
					<div class="col-sm-6">
						<h4>Đặt hàng</h4>
						<div class="space20">&nbsp;</div>

						<div class="form-block">
							<label for="name">Họ tên*</label>
							<input type="text" id="name" name="name" placeholder="Họ tên" required>
						</div>
						<div class="form-block">
							<label>Giới tính </label>
							<input name="gender" id="gender" type="radio" class="input-radio" name="gender" value="nam" checked="checked" style="width: 10%"><span style="margin-right: 10%">Nam</span>
							<input  name="gender" id="gender" type="radio" class="input-radio" name="gender" value="nữ" style="width: 10%"><span>Nữ</span>
										
						</div>

						<div class="form-block">
							<label for="email">Email*</label>
							<input type="email" name="name" id="email" required placeholder="expample@gmail.com">
						</div>

						<div class="form-block">
							<label for="address">Địa chỉ*</label>
							<input  name="address" type="text" id="address" placeholder="Street Address" required>
						</div>
						

						<div class="form-block">
							<label for="phone">Điện thoại*</label>
							<input  name="phone" type="text" id="phone" required>
						</div>
						
						<div class="form-block">
							<label for="notes">Ghi chú</label>
							<textarea  name="notes" id="notes"></textarea>
						</div>
					</div>	<%       float tongTien=0;
									Order cart=new Order();
									if(session.getAttribute("cart")!=null)
									     {
									        cart=(Order)session.getAttribute("cart");%>
					<div class="col-sm-6">
						<div class="your-order">
							<div class="your-order-head"><h5>Đơn hàng của bạn <%=cart.getItems().size() %></h5></div>
							<div class="your-order-body" style="padding: 0px 10px">
								<div class="your-order-item">
									<div>
									<!--  one item	 -->
								
									     
									     
		             <%     for(Item item :cart.getItems()){
		          
		       
		                                   %>
		          
										<div class="media">
											<img width="25%" src="image/product/<%=item.getProduct().getImage() %>" alt="" class="pull-left">
											<div class="media-body">
												<p class="font-large"><%=item.getProduct().getName() %></p>
												
												<span class="color-gray your-order-info"><%=item.getQuantity()%>*<%=item.getPrice() %>đ</span>
											</div>
										</div>
										<%tongTien+=item.getQuantity()*item.getPrice();%>
			 <%} %> <%} %> 
									<!-- end one item -->
									</div>
									<div class="clearfix"></div>
								</div>
								<div class="your-order-item">
									<div class="pull-left"><p class="your-order-f18">Tổng tiền:<%=tongTien%>đ</p></div>
									<div class="pull-right"><h5 class="color-black"></h5></div>
									<div class="clearfix"></div>
								</div>
							</div>
							<div class="your-order-head"><h5>Hình thức thanh toán</h5></div>
							
							<div class="your-order-body">
								<ul class="payment_methods methods">
									<li class="payment_method_bacs">
										<input id="payment_method_bacs" type="radio" class="input-radio" name="payment_method" value="COD" checked="checked" data-order_button_text="">
										<label for="payment_method_bacs">Thanh toán khi nhận hàng </label>
										<div class="payment_box payment_method_bacs" style="display: block;">
											Cửa hàng sẽ gửi hàng đến địa chỉ của bạn, bạn xem hàng rồi thanh toán tiền cho nhân viên giao hàng
										</div>						
									</li>

									<li class="payment_method_cheque">
										<input id="payment_method_cheque" type="radio" class="input-radio" name="payment_method" value="ATM" data-order_button_text="">
										<label for="payment_method_cheque">Chuyển khoản </label>
										<div class="payment_box payment_method_cheque" style="display: none;">
											Chuyển tiền đến tài khoản sau:
											<br>- Số tài khoản: 3535353535
											<br>- Chủ TK: Hoang minh
											<br>- Ngân hàng ACB, Chi nhánh TPHCM
										</div>						
									</li>
									
								</ul>
							</div>

							<input class="btn btn-primary" type="submit" value="Đặt hàng"> </div>
						</div> <!-- .your-order -->
					</div>
				</div>
			</form>
		</div> <!-- #content -->
	</div> <!-- .container -->
	<jsp:include page="/layout/script.jsp"></jsp:include>
	<jsp:include page="/layout/footer.jsp"></jsp:include>
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