package controller;
import model.Item;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import DAO.SanPhamById;
import model.Item;
import model.Order;
import model.products;
@WebServlet("/pages/addtoCart")
public class AddToGioHang extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int quantity=1;
		
		int id=1;
		if(req.getParameter("productId")!=null)
		id=Integer.parseInt(req.getParameter("productId"));
		if(req.getParameter("productId") != null)
		{
			SanPhamById temp1=new SanPhamById();
			String sql="SELECT * FROM products where id="+id;
			products temp;
			temp=temp1.getSanPhamById(sql);
			if(temp!=null)
			{
				HttpSession session=req.getSession();
				if(session.getAttribute("cart")==null) {
					Order cart=new Order();
					List<Item> demo=new ArrayList<Item>();
					Item item=new Item();
					item.setQuantity(1);
					item.setPrice(temp.getUnit_price());
					item.setProduct(temp);
					demo.add(item);
					cart.setItems(demo);
					session.setAttribute("cart", cart);					
				}else {
					Order cart=new Order();
					cart=(Order)session.getAttribute("cart");
					List<Item> demo=cart.getItems();
					
					for(Item item:demo) {
						if(item.getProduct().getId()==id) {
							item.setQuantity(item.getQuantity()+1);
							item.setPrice(item.getQuantity()*item.getPrice());
							
						}
						cart.setItems(demo);
						session.setAttribute("cart", cart);	
						
					}
				}
			}
			
			
		}
		resp.sendRedirect(req.getContextPath()+"/giohang");
			
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
