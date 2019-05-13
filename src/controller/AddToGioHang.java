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
		
		String id="1";
		
		
		if(req.getParameter("productId") != null)
		{
			id=req.getParameter("productId");
			//id=(String)req.getAttribute("productId");
			SanPhamById temp1=new SanPhamById();
			String sql="SELECT * FROM products where id="+id;
			products temp;
			temp=temp1.getSanPhamById(sql);
		//	req.setAttribute("minh",temp);
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
					boolean istrue=false;
					for(Item item:demo) {
						if((item.getProduct().getId())==(Integer.parseInt(id))) {
							item.setQuantity(item.getQuantity()+1);
							item.setPrice(item.getQuantity()*item.getPrice());
							istrue=true;
						
						}
					}
						if(istrue==false) {

							Item addItem=new Item();
							addItem.setPrice(temp.getUnit_price());
							addItem.setQuantity(1);
							addItem.setProduct(temp);
							demo.add(addItem);
						
						cart.setItems(demo);
						session.setAttribute("cart", cart);	
						
					}
				}
			}
			
			
		}
		
		resp.sendRedirect(req.getContextPath()+"/giohang");
		//resp.sendRedirect("checkout.jsp?id="+id);
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
