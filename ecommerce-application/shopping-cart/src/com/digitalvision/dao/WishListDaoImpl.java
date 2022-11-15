package com.digitalvision.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.digitalvision.beans.CartBean;
import com.digitalvision.beans.WishListBean;
import com.digitalvision.utility.DBUtil;

public class WishListDaoImpl implements WishListDao {

	@Override
	public List<WishListBean> getList(String username) {
		List<WishListBean> items = new ArrayList<WishListBean>();
		
		Connection con  = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = con.prepareStatement("select pid from wishlist where username=?");
			
			ps.setString(1, username);
			
			rs = ps.executeQuery();
			
			while(rs.next()) {
				WishListBean list = new WishListBean();
				
				list.setPid(rs.getString("pid"));
				
				items.add(list);
				
			}
			
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		
		
		return items;
	}
	
	
	

}
