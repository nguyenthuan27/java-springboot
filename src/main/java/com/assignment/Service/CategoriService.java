package com.assignment.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.Dao.CategoryDAO;
import com.assignment.Entity.Categories;

@Service
public class CategoriService {
	@Autowired
	private CategoryDAO  categoryDAO;
	public List<Categories> getCategoriList(){
		return categoryDAO.findAll();
	}
	public Categories getCategoriById(String id) {
		return categoryDAO.findById(id).get();
	}
	public void saveUpdateCategory(Categories categories) {
		categoryDAO.save(categories);
	}
	public void deleteCategory(String id) {
		categoryDAO.deleteById(id);
	}
	
	
}
