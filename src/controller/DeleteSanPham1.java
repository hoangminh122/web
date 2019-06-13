package controller;
import DAO.DeleteSanPham;
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Del")
public class DeleteSanPham1 extends HttpServlet{
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
		int id=Integer.parseInt(req.getParameter("productId"));
		String sql="DELETE FROM products WHERE id="+id;
		DeleteSanPham temp=new DeleteSanPham();
		temp.Del(sql);
		}
		catch (Exception e) {
			// TODO: handle exception
		}
		RequestDispatcher dispatcher=req.getRequestDispatcher("pages/product_list.jsp?start=0&end=4");
		dispatcher.forward(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
