package com.digitalvision.dao;

import java.util.List;

import com.digitalvision.beans.OrderBean;
import com.digitalvision.beans.TransactionBean;

public interface OrderDao {
	
	public String paymentSuccess(String userName,double paidAmount);

	public boolean addOrder(OrderBean order);
	
	public boolean addTransaction(TransactionBean transaction);
	
	public int countSoldItem(String prodId);
	
	public List<OrderBean> getAllOrders();
	
	public List<OrderBean> getAllOrders(String transId);
	
	
}
