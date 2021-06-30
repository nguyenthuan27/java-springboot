	package com.assignment.Dao;




import java.util.List;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.assignment.Entity.Accounts;


public interface AccountDAO extends JpaRepository<Accounts, String>{
	@Query("SELECT p FROM Accounts p WHERE p.username LIKE ?1")
	Page<Accounts> findByKeywords(String keywords, Pageable pageable);
	
	 @Modifying
	 @Query("delete from Accounts u where u.username = ?1")
	 List<Accounts> deleteUsersByUserName(String username);
	 
	 Accounts findByUsernameAndPassword(String username, String password);
}
