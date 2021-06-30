package com.assignment.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.assignment.Dao.AccountDAO;
import com.assignment.Entity.Accounts;
import com.assignment.Service.SessionService;

@Controller
@RequestMapping("customer")
public class CustomerController {
	@Autowired
	SessionService sessionService;
	
	@Autowired
	AccountDAO accDao;
	@RequestMapping("home")
	public String home() {
		return "home/index";
	}
	@RequestMapping("profile")
	public String profile(Model model,@ModelAttribute("profileuser") Accounts acc,BindingResult result){
		//String a = sessionService.get("username");
		 acc = accDao.findById(sessionService.get("username")).get();
		System.out.println(acc.getFullname());
		model.addAttribute("profileuser", acc);
		return "home/profile";
	}
}
