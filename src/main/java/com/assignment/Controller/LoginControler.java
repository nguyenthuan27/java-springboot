package com.assignment.Controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.assignment.Dao.AccountDAO;
import com.assignment.Entity.Accounts;
import com.assignment.Entity.Oders;
import com.assignment.Service.CookieService;
import com.assignment.Service.ParamService;
import com.assignment.Service.SessionService;

@Controller
public class LoginControler {
	@Autowired
	ParamService paramService;

	@Autowired
	AccountDAO acdao;

	@Autowired
	SessionService sessionService;

	@Autowired
	CookieService cookieService;

	@RequestMapping("login")
	public String login(Model model) {

		return "account/test/login";
	}

	@RequestMapping(value = "dangnhap", method = RequestMethod.POST)
	public String dangnhap(Model model) {
		String un = paramService.getString("username", "");
		String pw = paramService.getString("password", "");
		boolean rmm = paramService.getBoolean("remember", false);
		Accounts acc = acdao.findById(un).get();
		if (acc != null && acc.getPassword().equals(pw)) {
			model.addAttribute("message", "thanh cong");
			model.addAttribute("imguser", acc.getPhoto());
			sessionService.set("username", un);
			if (rmm == true) {
				cookieService.add("username", un, 10);
				System.out.println("cookie");
			}
			return "redirect:/customer/home";
		}
 
		model.addAttribute("message", "Đăng nhập thất bại");
		return "redirect:/admin/login";
	}
	@RequestMapping("logout")
	public String dangxuat() {
		sessionService.set("", "");
		return "account/test/login";
	}

	
}
