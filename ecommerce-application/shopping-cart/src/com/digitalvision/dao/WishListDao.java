package com.digitalvision.dao;

import java.util.List;

import com.digitalvision.beans.CartBean;
import com.digitalvision.beans.WishListBean;

public interface WishListDao {
	
	public List<WishListBean> getList (String username);

}
