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
	
	@Override
	public String addItemtoWishList(String username, String pid)
	{
		String status= "Product added failed to the wish list";
		
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		int rs;
	
		try {
			
			ps=con.prepareStatement("insert into wishlist (username,pid) values (?,?)");
			ps.setString(1, username);
			ps.setString(2, pid);
			rs = ps.executeUpdate();
				
			status= "Product added successfully to the wish list";

		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);

	
	return status;
	
	}
	
	@Override
	public boolean isAvailable(String username, String pid)
	{
		boolean status=false;
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			ps=con.prepareStatement("select * from wishlist where username=? and pid=?");
			ps.setString(1, username);
			ps.setString(2, pid);
			rs = ps.executeQuery();
			
			if( rs.next()==true)
			{
				status=true;
			}
			else
			{
				status=false;
			}
				
		
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		DBUtil.closeConnection(rs);
		
	
		return status;
	}
	
	@Override
	public String removeItem(String username, String pid)
	{
		String status= "Product removing failed from the wish list";
		
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		int rs;
	
		try {
			
			ps=con.prepareStatement("Delete from wishlist where username=? and pid=?");
			ps.setString(1, username);
			ps.setString(2, pid);
			rs = ps.executeUpdate();
				
			status= "Product has been removed from the wish list";

		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		DBUtil.closeConnection(con);
		DBUtil.closeConnection(ps);
		
		return status;
	}
	

}
