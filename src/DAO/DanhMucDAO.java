package DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;
import com.sun.org.apache.xml.internal.resolver.Catalog;

import model.type_products;
import web.DBConnnect;

public class DanhMucDAO implements IDanhMucDAO{

	@Override
	public ArrayList<type_products> getTypeProduct(String sql) {
		// TODO Auto-generated method stub
		Connection conn=DBConnnect.getConnnection();
		 ArrayList<type_products> temp=new ArrayList<type_products>();
		 
		try {
			PreparedStatement ps=conn.clientPrepareStatement(sql);
			ResultSet rs=(ResultSet) ps.executeQuery();
			while(rs.next())
			{
				type_products temp1=new type_products();
				temp1.setId(rs.getInt("id"));
				temp1.setName(rs.getString("name"));
				temp1.setImage(rs.getString("image"));
				temp1.setDescription(rs.getString("description"));
				temp1.setCreated_up(rs.getTimestamp("created_at"));
				temp1.setUpdate_up(rs.getTimestamp("updated_at"));
				temp.add(temp1);
				
			}
			return temp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
//public static void main(String[] args) {
//	
//	 System.out.print(new DanhMucDAO().getTypeProduct("SELECT * FROM type_products").size());
//}
}
