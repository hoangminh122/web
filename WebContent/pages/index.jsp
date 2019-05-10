<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.products" %>
<%@ page import="DAO.SanPhamMoi" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Trang chủ</title>
<base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/web/" />
<link href='http://fonts.googleapis.com/css?family=Dosis:300,400' rel='stylesheet' type='text/css'>
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="http://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="assets/dest/css/font-awesome.min.css">
	<link rel="stylesheet" href="assets/dest/vendors/colorbox/example3/colorbox.css">
	<link rel="stylesheet" href="assets/dest/rs-plugin/css/settings.css">
	<link rel="stylesheet" href="assets/dest/rs-plugin/css/responsive.css">
	<link rel="stylesheet" title="style" href="assets/dest/css/style.css">
	<link rel="stylesheet" href="assets/dest/css/animate.css">
	<link rel="stylesheet" title="style" href="assets/dest/css/huong-style.css">
	<link rel="stylesheet" title="style" href="assets/dest/css/minh.css">
	
	
            
       
</head>
<body>
 
	<jsp:include page="/layout/header.jsp"></jsp:include>
	<jsp:include page="/layout/slide.jsp"></jsp:include>
	<% SanPhamMoi temp=new SanPhamMoi();
	   ArrayList<products> spmoi= temp.getSanPhamMoi("SELECT * FROM products where new=1");
	   int a,b;
	   if(request.getParameter("start")!=null && request.getParameter("end")!=null){
	   a=Integer.parseInt(request.getParameter("start")) ;
	    b=Integer.parseInt(request.getParameter("end")) ;
	   }else{
		   a=0;
		   b=4;
		 
	   }
	   ArrayList<products> spmoiByPage=temp.getSanPhamMoibyPage(spmoi, a, b);
	   
	    
	%>
	
	<div class="container">
		<div id="content" class="space-top-none">
			<div class="main-content">
				<div class="space60">&nbsp;</div>
				<div class="row">
					<div class="col-sm-12">
						<div class="beta-products-list">
							<h4>Sản Phẩm Mới</h4>
							<div class="beta-products-details">
								<p class="pull-left"><%=spmoi.size() %> tìm thấy</p>
								<div class="clearfix"></div>
							</div>

							<div class="row" >
								<% for(products sp : spmoiByPage){ %>
								<div class="col-sm-3" >
									<div class="single-item">
										<div class="single-item-header">
											<a href="product.html"><img style="height:350px;"src="image/product/<%=sp.getImage() %>"  alt=""></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title"><%=sp.getName() %></p>
											<p class="single-item-price">
												<span><%=sp.getUnit_price() %>đ</span>
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="pages/addtoCart?productId=<%=sp.getId()%>"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="product.html">Details <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
						
            
               <% } %>
			</div>
		</div> <!-- .beta-products-list -->
		    	<div class="space50">&nbsp;</div>
 <ul class="pagination">
                 <%
                 int i;
                   int a1,b1;
                 int limit=spmoi.size()/4;
                 if(limit*4<spmoi.size())
                 {
                	 limit+=1;
                 }
                 for(i=1;i<=limit;i++)
                 {
                	 a1=(i-1)*4;
                	 b1=i*4;
                	 if(b1>spmoi.size())
                		 b1=spmoi.size();
                 
                 %>
                 <li class="info"><a href="index.jsp?start=<%=a1%>&end=<%=b1%>"><%=i %></a></li>
                 <%} %>
                 </ul>
	<% SanPhamMoi temp11=new SanPhamMoi();
	   ArrayList<products> spmoi11= temp.getSanPhamMoi("SELECT * FROM products where promotion_price>0");
	   int a111,b111,k=1;
	   if(request.getParameter("start11")!=null && request.getParameter("end11")!=null ){
	   a111=Integer.parseInt(request.getParameter("start11")) ;
	    b111=Integer.parseInt(request.getParameter("end11")) ;
	   
	   }else{                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
		   a111=0;
		   b111=8;
		
		 
	   }
	   ArrayList<products> spmoiByPage11=temp.getSanPhamMoibyPage(spmoi11, a111, b111);
	   
	    
	%>
						<div class="beta-products-list">
							<h4>Top Products</h4>
							<div class="beta-products-details">
								<p class="pull-left"><%=a111 %> sản phẩm tìm thấy</p>
								<div class="clearfix"></div>
							</div>
							<%
							if(((b111-a111)/4)==2)k=2;
							else if(((b111-a111)/4)==1)k=2;
							else k=1;
							for(int j2=0;j2<k;j2++){ 
							int l=0;%>
							<div class="row">
							<% for(int j1=(4*j2);j1<b111-a111;j1++){ %>
								<div class="col-sm-3">
									<div class="single-item">
										<div class="single-item-header">
											<a href="product.html"><img style="height:350px;" src="image/product/<%=spmoiByPage11.get(j1).getImage() %>" alt=""></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title"><%=spmoiByPage11.get(j1).getName() %></p>
											<p class="single-item-price">
												<span><%=spmoiByPage11.get(j1).getUnit_price() %>đ</span>
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="pages/addtoCart?productId=<%=sp.getId()%>"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="product.html">Details <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
								<%l++;if(l==4)break; %>
								<%}%>
							</div>
								<%} %>
							
							<div class="space40">&nbsp;</div>
						</div> <!-- .beta-products-list -->
						 <ul class="pagination">
                 <%
                 int i11;
                   int a11,b11;
                 int limit11=spmoi11.size()/8;
                 if(limit11*8<spmoi11.size())
                 {
                	 limit11+=1;
                 }
                 for(i11=1;i11<=limit;i11++)
                 {
                	 a11=(i11-1)*8;
                	 b11=i11*8;
                	 if(b11>spmoi11.size())
                		 b11=spmoi11.size();
                 
                 %>
                 <li class="info"><a href="index.jsp?start11=<%=a11%>&end11=<%=b11%>"><%=i11 %></a></li>
                 <%} %>
                 </ul>
					</div>
				</div> <!-- end section with sidebar and main content -->


			</div> <!-- .main-content -->
		</div> <!-- #content -->
	</div> <!-- .container -->
	<jsp:include page="/layout/footer.jsp"></jsp:include>
	<jsp:include page="/layout/script.jsp"></jsp:include>
	
	<script>
	$(document).ready(function($) {    
		$(window).scroll(function(){
			if($(this).scrollTop()>150){
			$(".header-bottom").addClass('fixNav')
			}else{
				$(".header-bottom").removeClass('fixNav')
			}}
		)
	})
	</script>
</body>
</html>