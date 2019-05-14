package DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

import model.products;
import web.DBConnnect;

public class SanPhamById implements ISanPhamById{

	@Override
	public products getSanPhamById(String sql) {
		// TODO Auto-generated method stub
		Connection conn=DBConnnect.getConnnection();
		
			PreparedStatement ps;
			try {
				ps = conn.clientPrepareStatement(sql);
				ResultSet rs=(ResultSet) ps.executeQuery();
				products temp1=new products();
				
				while(rs.next()){
					temp1.setId(rs.getInt("id"));
					temp1.setName(rs.getString("name"));
				temp1.setId_type(rs.getInt("id_type"));
				temp1.setDescription(rs.getString("description"));
				temp1.setUnit_price(rs.getFloat("unit_price"));
				temp1.setPromotion_price(rs.getFloat("promotion_price"));
				temp1.setImage(rs.getString("image"));
				}
				return temp1;
				

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
						
	}
	public static void main(String[] args) {
		SanPhamById demo=new SanPhamById();
		products demo1=demo.getSanPhamById("Select *from products where id=1");
		if(demo1!=null)
			System.out.println("ok");
	}

}
