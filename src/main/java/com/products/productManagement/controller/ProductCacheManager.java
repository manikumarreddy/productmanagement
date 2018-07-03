/**
 * 
 */
package com.products.productManagement.controller;

import java.net.URL;

import org.apache.log4j.Logger;
import org.ehcache.config.builders.CacheConfigurationBuilder;
import org.ehcache.config.builders.CacheManagerBuilder;
import org.ehcache.config.builders.ResourcePoolsBuilder;
import org.springframework.stereotype.Controller;

import org.ehcache.Cache;
import org.ehcache.CacheManager;

/**
 * @author mr770w
 *
 */
	
public class ProductCacheManager {
	   private static final Logger logger = Logger.getLogger(ProductCacheManager.class);
	   private static Cache<Integer, Object> productCache;
	   private static ProductCacheManager manager= new ProductCacheManager();
	   
	   private ProductCacheManager(){
		   logger.debug("ProductCacheManager Controller>>>Contructor");		  
		   CacheManager cacheManager = CacheManagerBuilder.newCacheManagerBuilder()
			          .withCache("preConfigured",
			               CacheConfigurationBuilder.newCacheConfigurationBuilder(Integer.class, Object.class,
			                                              ResourcePoolsBuilder.heap(100))
			               .build())
			          .build(true);

			      Cache<Integer, Object> preConfigured
			          = cacheManager.getCache("preConfigured", Integer.class, Object.class);

			      productCache = cacheManager.createCache("products",
			          CacheConfigurationBuilder.newCacheConfigurationBuilder(Integer.class, Object.class,
			                                        ResourcePoolsBuilder.heap(100)).build());
	   }
	   
	   public static Cache<Integer,Object> getCache(){
		   logger.debug("ProductCacheManager Controller>>>getcache");
		   return ProductCacheManager.productCache;
	   }
	  
}
