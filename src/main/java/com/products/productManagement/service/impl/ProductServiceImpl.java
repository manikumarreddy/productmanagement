package com.products.productManagement.service.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.stereotype.Component;

import com.products.productManagement.controller.ProductCacheManager;
import com.products.productManagement.model.Product;
import com.products.productManagement.service.ProductService;

import org.apache.log4j.Logger;
import org.ehcache.Cache;

@Component
public class ProductServiceImpl implements ProductService{

	private static final Logger logger = Logger.getLogger(ProductCacheManager.class);
	  
	 
	 
	public Product create(Product product) throws Exception {
		try{
			Cache<Integer,Object> cache=ProductCacheManager.getCache();
			cache.put(product.getProductId(),product);
			logger.debug("Create Cache to string>>>>>"+cache.toString());		
		}catch(Exception e){
			throw new Exception("Failed to Create Product ");
		}
		return product;
	}

	public Product update(Product product) throws Exception{
		try{
			Cache<Integer,Object> cache=ProductCacheManager.getCache();
			cache.put(product.getProductId(),product);
			logger.debug("Update Cache to string>>>>>"+cache.toString());
		}catch(Exception e){
			throw new Exception("Failed to Update Product "+e);
		}
		return product;
	}

	public String delete(int productId) throws Exception{
		try{
			Cache<Integer,Object> cache=ProductCacheManager.getCache();
			cache.remove(productId);
			logger.debug("delete Cache to string >>>>>"+cache.toString());
		}catch(Exception e){
			throw new Exception("Failed to Delete Product "+e);
		}
		return "success";
	}

	public List<Product> getAllProducts() throws Exception{
		List<Product> pList=new ArrayList<Product>();
		try{
			logger.debug("Product Service >>>getAllProducts");			
			Cache<Integer,Object> cache=ProductCacheManager.getCache();	    
		    Iterator<org.ehcache.Cache.Entry<Integer, Object>> it = cache.iterator();
		    while(it.hasNext()){
		    	org.ehcache.Cache.Entry<Integer, Object> cacheMap = (org.ehcache.Cache.Entry<Integer, Object>)it.next();
		    	Product p=new Product();
		        p=(Product)cacheMap.getValue();
		        logger.debug("Product Service >>>getAllProducts:::productId"+cacheMap.getKey());
		        pList.add(p);
		   }
		}catch(Exception e){
			throw new Exception("Unable to retrive Product list");
		}
		return pList;		
		
	}

}
