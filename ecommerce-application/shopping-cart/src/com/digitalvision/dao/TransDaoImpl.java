package com.digitalvision.dao;

import java.io.Console;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.digitalvision.beans.OrderBean;
import com.digitalvision.beans.TransactionBean;
import com.digitalvision.utility.DBUtil;

public class TransDaoImpl implements TransDao{

	@Override
	public String getUserId(String transId) {
		String userId = "";
		
		Connection con = DBUtil.provideConnection();
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = con.prepareStatement("select username from transactions where transid=?");
			
			ps.setString(1, transId);
			
			rs = ps.executeQuery();
			
			if(rs.next())
				userId = rs.getString(1);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	
		
		return userId;
	}
	
	@Override
	public List<TransactionBean> getAllTransactionByUserId(String userId) {
		List<TransactionBean> transactionList = new ArrayList<TransactionBean>();
		
		Connection con = DBUtil.provideConnection();
		
		PreparedStatement ps = null;
		ResultSet rs = null;
		
		try {
			
			ps = con.prepareStatement("select * from transactions where username=?");
			
			ps.setString(1, userId);
			
			rs = ps.executeQuery();
			
			
			while(rs.next()) {
				
				TransactionBean order = new TransactionBean(rs.getString("transid"),rs.getString("username"),rs.getTimestamp("time"),rs.getDouble("amount"),rs.getString("shipAddress"),rs.getString("status"));
				
				transactionList.add(order);
				
				System.out.println(order);

			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		
		
		return transactionList;
	}

}
