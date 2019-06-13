package DAO;

import java.sql.SQLException;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.ResultSet;

import model.products;
import web.DBConnnect;

public class DeleteSanPham implements IDeleteSanPham{

	@Override
	public void Del(String sql) {
		
		Connection conn=DBConnnect.getConnnection();
		
		PreparedStatement ps;
		try {
			ps = conn.clientPrepareStatement(sql);
			 ps.execute();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		// TODO Auto-generated method stub
		
	}

}
