package com.assignment.Dao;

import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment.Entity.Categories;
import com.assignment.Entity.Products;
import com.assignment.Entity.Reporttype;
import com.assignment.Entity.RepostTime;

public interface CategoryDAO extends JpaRepository<Categories, String> {
	@Query("SELECT p FROM Categories p WHERE p.name LIKE ?1")
	Page<Categories> findByKeywords(String keywords, Pageable pageable);

	@Query("select p from Categories p")
	List<Categories> findCategory();

	@Query("select  new Reporttype(p.products.name,p.oders.createDate,sum(p.quantity),sum(p.price)) from OderDetails p  GROUP BY p.products.name,p.oders.createDate")
	List<Reporttype> findType();

	@Query("select  DISTINCT new RepostTime(p.oders.createDate,COUNT(p.oders.oderId),sum(p.quantity),sum(p.price)) from OderDetails p GROUP BY p.oders.createDate")
	List<RepostTime> findtime();

}
