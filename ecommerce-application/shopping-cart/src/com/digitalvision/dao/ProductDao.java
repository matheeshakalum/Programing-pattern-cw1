package com.digitalvision.dao;

import java.io.InputStream;
import java.util.List;

import com.digitalvision.beans.ProductBean;
import com.digitalvision.beans.WishListBean;

public interface ProductDao {

	public String addProduct(String prodName,String prodType,String prodInfo, double prodPrice, int prodQuantity, InputStream prodImage);
	
	public String addProduct(ProductBean product);
	
	public String removeProduct(String prodId);
	
	public String updateProduct(ProductBean prevProduct, ProductBean updatedProduct);
	
	public String updateProductPrice(String prodId, double updatedPrice);
	
	public List<ProductBean> getAllProducts();
	
	public byte[] getImage(String prodId);
	
	public ProductBean getProductDetails(String prodId);
	
	public String updateProductWithoutImage(String prevProductId, ProductBean updatedProduct);
	
	public double getProductPrice(String prodId);
	
	public boolean sellNProduct(String prodId,int n);
	
	public int getProductQuantity(String prodId);
	
}
