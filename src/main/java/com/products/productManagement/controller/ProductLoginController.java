/**
 * 
 */
package com.products.productManagement.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.products.productManagement.model.Product;
import com.products.productManagement.service.ProductService;

/**
 * @author mr770w
 *
 */
@Controller
@ComponentScan(basePackages = { "com.products.*" })
public class ProductLoginController {

	private static final Logger logger = Logger.getLogger(ProductLoginController.class);
	
	@Autowired 
	private Properties propertiesFactory;
	
	@Autowired
	private ProductService productService;
	
	
	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String init(Model model) {
		logger.debug("Product Controller>>>initLoad");
		model.addAttribute("msg", "Please Enter Your Login Details");
		return "main";
	}

	@RequestMapping(method = RequestMethod.POST)
	public String submit(Model model, @ModelAttribute("loginBean") ProductLoginBean productLoginBean) {
		logger.debug("Product Controller>>>login");
		if (productLoginBean != null && productLoginBean.getUserName() != null & productLoginBean.getPassword() != null) {
			if ((productLoginBean.getUserName().equals(propertiesFactory.getProperty("pm.userName1")) && productLoginBean.getPassword().equals(propertiesFactory.getProperty("pm.password1")))
				|| (productLoginBean.getUserName().equals(propertiesFactory.getProperty("pm.userName2")) && productLoginBean.getPassword().equals(propertiesFactory.getProperty("pm.password2")))) {
				model.addAttribute("msg", productLoginBean.getUserName());
				return "home";
			} else {
				model.addAttribute("error", "Invalid Details");
				return "login";
			}
		} else {
			model.addAttribute("error", "Please enter Details");
			return "login";
		}
	}
	
	@ResponseBody
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public Product create(Model model, @ModelAttribute("productBean") Product product) {
		logger.debug("Product Controller>>>Create");
		Product prod=null;
		try{
			if (product != null && product.getProductId()!= 0 & product.getProductName() != null) {			
				prod= productService.create(product);
			} 
		}catch(Exception e){
			e.printStackTrace();
		}
		return prod;
	}
	
	@ResponseBody
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public Product update(Model model, @ModelAttribute("productBean") Product product) {
		logger.debug("Product Controller>>>update");
		Product prod=null;
		try{
			if (product != null && product.getProductId()>0) {			
				prod=productService.update(product);
			} 
		}catch(Exception e){
			e.printStackTrace();
		}
		return prod;
	}
	
	@ResponseBody
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String delete(Model model, @ModelAttribute("productBean") Product product) {
		logger.debug("Product Controller>>>delete");
		String message="";
		try{
			if (product != null && product.getProductId()>0) {			
				message= productService.delete(product.getProductId());
			} 
		}catch(Exception e){
			e.printStackTrace();
		}
		return message;
	}
	
	@ResponseBody	
	@RequestMapping(path="/products", method=RequestMethod.GET)
	public List<Product> getAllProducts(){
		logger.debug("Product Controller>>>getProductList");
		List<Product> pList=new ArrayList<Product>();
		try{
			pList=productService.getAllProducts();
		}catch(Exception e){
			e.printStackTrace();
		}
		return pList;
	}
	
}
