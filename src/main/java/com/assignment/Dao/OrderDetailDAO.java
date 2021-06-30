package com.assignment.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment.Entity.OderDetails;
import com.assignment.Entity.Oders;
import com.assignment.Entity.Products;
import com.assignment.Entity.Reporttype;
import com.assignment.Entity.myproduct;


public interface OrderDetailDAO extends JpaRepository<OderDetails, Long>{
	@Query("SELECT p from Oders p")
	List<Oders> findOder();
	
	@Query("SELECT p from Products p")
	List<Products> findProducts();
	
//	@Query("SELECT Products.name,OderDetails.price,Oders.createDate,OderDetails.quantity FROM OderDetails\r\n"
//			+ "     JOIN Oders  ON Oders.oderId= OderDetails.oderId\r\n"
//			+ "	 JOIN Products ON Products.productId = OderDetails.productId\r\n"
//			+ "     Where Oders.username LIKE?1")
//	List<OderDetails> findOderDetails(String username);
	
	@Query("select DISTINCT new myproduct(sum(p.quantity),p.products.name,sum(p.price),p.oders.createDate,p.statusdeli) from OderDetails p  Where p.oders.accounts.username LIKE?1    GROUP BY  p.products.name,p.oders.createDate,p.oders.accounts.username,p.statusdeli")
	List<myproduct> findMyProduct(String username);
}
