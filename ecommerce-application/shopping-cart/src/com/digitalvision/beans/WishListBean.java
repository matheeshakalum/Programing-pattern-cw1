package com.digitalvision.beans;

import java.io.Serializable;

public class WishListBean implements Serializable{
	
	public WishListBean() {};
	
	private String username;
	private String pid;
	
	public WishListBean(String username, String pid) {
		super();
		this.username = username;
		this.pid = pid;
	}

	//getters & setters
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	
	public String getPid() {
		return pid;
	}
	public void setPid(String pid) {
		this.pid = pid;
	}

	
	
	
}
