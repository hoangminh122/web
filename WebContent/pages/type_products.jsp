<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@page import="DAO.SanPhamMoi"%>
<%@page import="DAO.DanhMucDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.type_products"%>
<%@page import="model.products"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Laravel </title>
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
	
</head>
<body>

 <jsp:include page="/layout/header.jsp"></jsp:include>
 <div class="container">
		<div id="content" class="space-top-none">
			<div class="main-content">
				<div class="space60">&nbsp;</div>
				<div class="row">
					<div class="col-sm-3">
					<%DanhMucDAO temp= new DanhMucDAO();
					
					
		//tao menu			
					
					%>
						<ul class="aside-menu">
						<% for(type_products menu :temp.getTypeProduct("SELECT * FROM type_products")){%>
							<li><a href="#"><%=menu.getName() %></a></li>
							<%} %>
					
						</ul>
	<% SanPhamMoi temp1=new SanPhamMoi();
	  String id_type=request.getParameter("id_type");
	  String sql="SELECT * FROM products where new=1 AND id_type="+request.getParameter("id_type");
	  String sql2="SELECT * FROM products where promotion_price>0 AND id_type="+request.getParameter("id_type");
	  ArrayList<products> spmoi2= temp1.getSanPhamMoi(sql2);
	   ArrayList<products> spmoi1= temp1.getSanPhamMoi(sql);
	   int a,b,k=1,a2,b2;
	   if(request.getParameter("start")!=null && request.getParameter("end")!=null && request.getParameter("start2")!=null && request.getParameter("end2")!=null ){
	   a=Integer.parseInt(request.getParameter("start")) ;
	    b=Integer.parseInt(request.getParameter("end")) ;
	    a2=Integer.parseInt(request.getParameter("start2")) ;
	    b2=Integer.parseInt(request.getParameter("end2")) ;
	   
	   }else{   
		   if(spmoi1.size()>=3)
		   {
		   a=0;
		   b=3;
		   }
		   else{
			   a=0;
			   b=spmoi1.size();
		   }
		   if(spmoi2.size()>=3)
		   {
		   a2=0;
		   b2=3;
		   }
		   else{
			   a2=0;
			   b2=spmoi2.size();
		   }
		  
		
		 
	   }
	  
	   ArrayList<products> spmoiByPage1=temp1.getSanPhamMoibyPage(spmoi1, a, b);
	   ArrayList<products> spmoiByPage2=temp1.getSanPhamMoibyPage(spmoi2, a2, b2);
   %>
					</div>
					<div class="col-sm-9">
						<div class="beta-products-list">
							<h4>New Products</h4>
							<div class="beta-products-details">
								<p class="pull-left"><%=spmoi1.size() %>sản phẩm tìm thấy</p>
								<div class="clearfix"></div>
				
							<div class="row">
				<% for(products sp :spmoiByPage1){ %>
								<div class="col-sm-4">
									<div class="single-item">
										<div class="single-item-header">
											<a href="pages/product.jsp?id=<%=sp.getId()%>"><img height="300px" src="image/product/<%=sp.getImage() %>" alt=""></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title"><%=sp.getName() %></p>
											<p class="single-item-price">
												<span><%=sp.getUnit_price() %></span>
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="pages/addtoCart?productId=<%=sp.getId()%>"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="pages/product.jsp?id=<%=sp.getId()%>">Xem Chi Tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
							<%} %>
								</div>
						</div> <!-- .beta-products-list -->
<ul class="pagination">
                 <%
                 int i;
                  
                 int limit=spmoi1.size()/3;
                 if(limit*3<spmoi1.size())
                 {
                	 limit+=1;
                 }
                 for(i=1;i<=limit;i++)
                 {
                	 a=(i-1)*3;
                	 b=i*3;
                	 if(b>spmoi1.size())
                		 b=spmoi1.size();
                 
                 %>
                 <li class="info"><a href="type_products.jsp?id_type=<%=id_type %>&start=<%=a%>&end=<%=b%>"><%=i %></a></li>
                 <%} %>
                 </ul>
						<div class="space50">&nbsp;</div>

						<div class="beta-products-list">
							<h4>Top Products</h4>
							<div class="beta-products-details">
								<p class="pull-left"><%=spmoi2.size() %>sản phẩm tìm thấy</p>
								<div class="clearfix"></div>
							</div>
							<div class="row">
				           <% for(products sp:spmoiByPage2){ %>
								<div class="col-sm-4">
									<div class="single-item">
										<div class="single-item-header">
											<a href="pages/product.jsp?id=<%=sp.getId()%>"><img height="300px" src="image/product/<%=sp.getImage() %>" alt=""></a>
										</div>
										<div class="single-item-body">
											<p class="single-item-title"><%=sp.getName() %></p>
											<p class="single-item-price">
												<span><%=sp.getUnit_price() %></span>
											</p>
										</div>
										<div class="single-item-caption">
											<a class="add-to-cart pull-left" href="pages/addtoCart?productId=<%=sp.getId()%>"><i class="fa fa-shopping-cart"></i></a>
											<a class="beta-btn primary" href="pages/product.jsp?id=<%=sp.getId()%>">Xem Chi Tiết <i class="fa fa-chevron-right"></i></a>
											<div class="clearfix"></div>
										</div>
									</div>
								</div>
								<%} %>
							</div>
							
			<ul class="pagination">
                 <%
                
                  
                 int limit2=spmoi2.size()/3;
                 if(limit2*3<spmoi2.size())
                 {
                	 limit+=1;
                 }
                 for(int i2=1;i2<=limit2;i2++)
                 {
                	 a2=(i2-1)*3;
                	 b2=i2*3;
                	 if(b2>spmoi2.size())
                		 b2=spmoi2.size();
                 
                 %>
                 <li class="info"><a href="type_products.jsp?id_type=<%=id_type %>&start2=<%=a2%>&end2=<%=b2%>"><%=i2 %></a></li>
                 <%} %>
                 </ul>
							<div class="space40">&nbsp;</div>
							
						</div> <!-- .beta-products-list -->
					</div>
				</div> <!-- end section with sidebar and main content -->


			</div> <!-- .main-content -->
		</div> <!-- #content -->
	</div> <!-- .container -->
 
  <jsp:include page="/layout/footer.jsp"></jsp:include>
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