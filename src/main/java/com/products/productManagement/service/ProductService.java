/**
 * 
 */
package com.products.productManagement.service;

import java.util.List;

import com.products.productManagement.model.Product;

/**
 * @author mr770w
 *
 */
public interface ProductService {
	
	public Product create(Product product) throws Exception;
	
	public Product update(Product product) throws Exception;

	public String delete(int productId) throws Exception;

	public List<Product> getAllProducts() throws Exception;
}
