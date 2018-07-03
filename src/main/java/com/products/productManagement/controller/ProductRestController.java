package com.products.productManagement.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.products.productManagement.model.Product;
import com.products.productManagement.service.ProductService;

@RestController
public class ProductRestController {
	
	@Autowired
	private ProductService productService;
	/*
	@RequestMapping(path="/products", method=RequestMethod.GET)
	public List<Product> getAllProducts(){
		return productService.getAllProducts();
	}
   
	/*@RequestMapping(value = "/employee/{id}", method = RequestMethod.GET)
	public Product getEmployeeById(@PathVariable("id") long id){
		return productService.getProductById(id);
	}*/

}