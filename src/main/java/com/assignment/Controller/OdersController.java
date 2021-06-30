package com.assignment.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.Dao.OrderDAO;
import com.assignment.Entity.Accounts;
import com.assignment.Entity.Categories;
import com.assignment.Entity.Oders;
import com.assignment.Entity.Products;

@Controller
@RequestMapping("admin")
public class OdersController {
	@Autowired 
	OrderDAO oderDao;
	
	@RequestMapping("oders")
	public String oders(Model model,@RequestParam("pageoder")Optional<Integer> p) {
		List<Oders> items = oderDao.findAll();
		model.addAttribute("itemleg3", items);
		try {
			Pageable pageable  = PageRequest.of(p.orElse(0), 4);
			Page<Oders> listOder = oderDao.findAll(pageable);
			model.addAttribute("pageoder",listOder);
		} catch (Exception e) {
			// TODO: handle exception
			Pageable pageable = PageRequest.of(0, 4);
			Page<Oders> listOder = oderDao.findAll(pageable);
			model.addAttribute("pageoder",listOder);
		}
		Oders  item = new Oders();
		model.addAttribute("itemoder",item);
		return "home-admin/qloders";
	}
	
	@RequestMapping(value = "createOder", method = RequestMethod.POST)
	public String createOder(@ModelAttribute("itemoder") Oders oders, BindingResult result) {
		oderDao.save(oders);	
		return "redirect:/admin/oders";
	}
	@RequestMapping("updateOder")
	public String updateOder(Oders oders) {
		oderDao.save(oders);
		return "redirect:/admin/oders";
	}

	@RequestMapping(value = "deleteOder/{oderId}")
	public String deleteAcc(@PathVariable("oderId") Long oderId) {
		oderDao.deleteById(oderId);
		return "redirect:/admin/oders";
	}
	
	
	@ModelAttribute("accounts")
	public List<Accounts> accounts() {
		List<Accounts> items = oderDao.findAccount();
		List<Accounts> account = new ArrayList<>();
		for (Accounts a : items) {
			account.add(new Accounts(a.getUsername(), null, null, null, null, false, false, null));
		}
		return account;
	}
}
