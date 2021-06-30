package com.assignment.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.Dao.ProductDAO;
import com.assignment.Entity.Products;
@Service
public class ProductService {
	@Autowired
	private ProductDAO productDAO;
	public List<Products> getAccountList(){
		return productDAO.findAll();
	}
	public Products geProductById(Integer id) {
		return productDAO.findById(id).get();
	}
	public void saveUpdateProduct(Products products) {
		productDAO.save(products);
	}
	public void deleteProduct(Integer id) {
		productDAO.deleteById(id);
	}
}
