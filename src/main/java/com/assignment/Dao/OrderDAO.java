package com.assignment.Dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.assignment.Entity.Accounts;
import com.assignment.Entity.Oders;
import com.assignment.Entity.Reporttype;
import com.assignment.Entity.RepostTime;


public interface OrderDAO extends JpaRepository<Oders, Long>{
	@Query("select p from Accounts p")
	List<Accounts> findAccount();
	
	
}
