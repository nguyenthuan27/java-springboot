package com.assignment.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment.Entity.Categories;
import com.assignment.Entity.Products;
public interface ProductDAO extends JpaRepository<Products, Integer>{
	@Query("select p from Categories p")
	List<Categories> findCategory();
}
