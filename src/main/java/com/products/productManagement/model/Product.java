/**
 * 
 */
package com.products.productManagement.model;

/**
 * @author mr770w
 *
 */
public class Product {

	private int productId;
	private String productName;
	private String description;
	private String relatedProducts; 
	private	String img; //setting image URL
	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}
	/**
	 * @param productId the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}
	/**
	 * @return the productName
	 */
	public String getProductName() {
		return productName;
	}
	/**
	 * @param productName the productName to set
	 */
	public void setProductName(String productName) {
		this.productName = productName;
	}
	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}
	/**
	 * @param description the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}
	/**
	 * @return the relatedProducts
	 */
	public String getRelatedProducts() {
		return relatedProducts;
	}
	/**
	 * @param relatedProducts the relatedProducts to set
	 */
	public void setRelatedProducts(String relatedProducts) {
		this.relatedProducts = relatedProducts;
	}
	/**
	 * @return the img
	 */
	public String getImg() {
		return img;
	}
	/**
	 * @param img the img to set
	 */
	public void setImg(String img) {
		this.img = img;
	}
	
	

}
