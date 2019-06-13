<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="model.products" %>
<%@ page import="DAO.SanPhamMoi" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
     <base href="${fn:substring(url, 0, fn:length(url) - fn:length(uri))}${req.contextPath}/web/" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="Khóa Học Lập Trình Laravel Framework 5.x Tại Khoa Phạm">
    <meta name="author" content="">
    <title>Admin</title>

    <!-- Bootstrap Core CSS -->
    <link href="bower_components/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="bower_components/metisMenu/dist/metisMenu.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="bower_components/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- DataTables CSS -->
    <link href="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="bower_components/datatables-responsive/css/dataTables.responsive.css" rel="stylesheet">
</head>

<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="index.html">Admin Area - Khoa Phạm</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-bar-chart-o fa-fw"></i> Category<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">List Category</a>
                                </li>
                                <li>
                                    <a href="#">Add Category</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-cube fa-fw"></i>Sản Phẩm<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="pages/product_list.jsp?start=0&end=4">Danh Sách Sản Phẩm</a>
                                </li>
                                <li>
                                    <a href="pages/product_add.jsp">Thêm Sản Phẩm</a>
                                </li>
                                 <li>
                                    <a href="pages/product_edit.jsp">Cập Nhật Sản Phẩm</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-users fa-fw"></i> User<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="#">List User</a>
                                </li>
                                <li>
                                    <a href="#">Add User</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
          <div class="container-fluid">
   <% SanPhamMoi temp=new SanPhamMoi();
	   ArrayList<products> spmoi= temp.getSanPhamMoi("SELECT * FROM products");
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
                <div class="row">
                    <div class="col-lg-8">
                        <h1 class="page-header">
                            <small>Danh sách</small>
                        </h1>
                    </div>
                    <!-- /.col-lg-12 -->
                    <table class="table table-striped table-bordered table-hover" id="dataTables-example">
                        <thead>
                            <tr align="center">
                                <th>ID</th>
                                <th>Sản Phẩm</th>
                                <th>Mô Tả</th>
                                <th>giá mới</th>
                                <th>giá khuyến mãi</th>
                                <th>Hình ảnh</th>
                               
                                <th>Delete</th>
                                <th>Edit</th>
                            </tr>
                        </thead>
                        <tbody>
                          <% for(products sp : spmoiByPage){ %>
                            <tr class="even gradeC" align="center">
                                <td><%=sp.getId() %></td>
                                <td><%=sp.getName() %></td>
                                <td><%=sp.getDescription() %></td>
                                <td><%=sp.getUnit_price() %></td>
                                 <td><%=sp.getName() %></td>
                                  <td><img src="image/product/<%=sp.getImage() %>" style="width:100px;height: 100px" /></td>
                               
                                <td class="center"><i class="fa fa-trash-o  fa-fw"></i><a href="Del?productId=<%=sp.getId()%>"> Delete</a></td>
                                <td class="center"><i class="fa fa-pencil fa-fw"></i> <a href="{{route('admin_getupdatesp',$sp->id)}}">Edit</a></td>
                            </tr>
                        <% } %>

                        </tbody>
                    </table>
                </div>
                <!-- /.row -->
            </div>
        </div>
        <!-- /#page-wrapper -->
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
                 <li class="info"><a href="pages/product_list.jsp?start=<%=a1%>&end=<%=b1%>"><%=i %></a></li>
                 <%} %>
                 </ul>

    </div>
    <!-- /#wrapper -->

    <!-- jQuery -->
    <script src="bower_components/jquery/dist/jquery.min.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="bower_components/bootstrap/dist/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="bower_components/metisMenu/dist/metisMenu.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="dist/js/sb-admin-2.js"></script>

    <!-- DataTables JavaScript -->
    <script src="bower_components/DataTables/media/js/jquery.dataTables.min.js"></script>
    <script src="bower_components/datatables-plugins/integration/bootstrap/3/dataTables.bootstrap.min.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
                responsive: true
        });
    });
    </script>
</body>

</html>
