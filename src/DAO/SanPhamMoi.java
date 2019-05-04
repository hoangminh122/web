package DAO;

import java.sql.SQLException;
import java.util.ArrayList;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

import model.products;
import web.DBConnnect;

public class SanPhamMoi implements ISanPhamMoi{

	@Override
	public ArrayList<products> getSanPhamMoi(String sql) {
		Connection conn=DBConnnect.getConnnection();
		try {
			PreparedStatement ps=conn.clientPrepareStatement(sql);
			ResultSet rs=(ResultSet) ps.executeQuery();
			ArrayList<products> temp=new ArrayList<products>();
			
			while(rs.next()){
				products temp1=new products();
				temp1.setName(rs.getString("name"));
				temp1.setId_type(rs.getInt("id_type"));
				temp1.setDescription(rs.getString("description"));
				temp1.setUnit_price(rs.getFloat("unit_price"));
				temp1.setPromotion_price(rs.getFloat("promotion_price"));
				temp1.setImage(rs.getString("image"));
				temp.add(temp1);
				
			}
			return temp;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
	}

	@Override
	public ArrayList<products> getSanPhamMoibyPage(ArrayList<products> arr, int start, int end) {
		ArrayList<products> temp=new ArrayList<products>();
		for(int i=start;i<end;i++)
		{
			temp.add(arr.get(i));
		}
		return temp;
	}

	@Override
	public ArrayList<products> getSanPhamKhuyenMai(String sql) {
		ArrayList<products> temp=new ArrayList<products>();
		Connection conn=DBConnnect.getConnnection();
		PreparedStatement pr;
		try {
			pr = conn.clientPrepareStatement(sql);
			ResultSet rs=(ResultSet) pr.executeQuery();
			while(rs.next()) {
				products temp1=new products();
				temp1.setName(rs.getString("name"));
				temp1.setId_type(rs.getInt("id_type"));
				temp1.setDescription(rs.getString("description"));
				temp1.setUnit_price(rs.getFloat("unit_price"));
				temp1.setPromotion_price(rs.getFloat("promotion_price"));
				temp1.setImage(rs.getString("image"));
				temp.add(temp1);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return temp;
	}

}
