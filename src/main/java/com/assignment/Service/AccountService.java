package com.assignment.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.Dao.AccountDAO;
import com.assignment.Entity.Accounts;

@Service
public class AccountService {
	@Autowired
	private AccountDAO accountDAO;

	public List<Accounts> getAccountList() {
		return accountDAO.findAll();
	}

	public Accounts getAccountById(String username) {
		return accountDAO.findById(username).get();
	}

	public void saveUpdateAccount(Accounts accounts) {
		accountDAO.save(accounts);
	}

	public void deleteAccount(String username) {
		accountDAO.deleteById(username);
	}

	public Accounts login(String username, String password) {
		Accounts acc = accountDAO.findByUsernameAndPassword(username, password);
		return acc;
	}
}
