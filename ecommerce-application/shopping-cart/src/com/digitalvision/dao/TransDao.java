package com.digitalvision.dao;

import java.util.List;

import com.digitalvision.beans.TransactionBean;

public interface TransDao {

	public String getUserId(String transId);
	public List<TransactionBean> getAllTransactionByUserId(String userId);
}
