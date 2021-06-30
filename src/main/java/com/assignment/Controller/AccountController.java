package com.assignment.Controller;

import java.io.File;
import java.util.List;
import java.util.Optional;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.assignment.Dao.AccountDAO;
import com.assignment.Entity.Accounts;
import com.assignment.Entity.Categories;
import com.assignment.Service.ParamService;

@Controller
@RequestMapping("admin")
public class AccountController {

	@Autowired
	AccountDAO accdao;
	
	@Autowired
	ParamService paramService;
	@RequestMapping("qlaccount")
	public String account(Model model,@RequestParam("pageac")Optional<Integer> p) {
		List<Accounts> items = accdao.findAll();
		model.addAttribute("itemleg1", items);
		try {
			Pageable pageable  = PageRequest.of(p.orElse(0), 4);
			Page<Accounts> listAcc = accdao.findAll(pageable);
			model.addAttribute("pageac",listAcc);
		} catch (Exception e) {
			// TODO: handle exception
			Pageable pageable = PageRequest.of(0, 4);
			Page<Accounts> listAcc = accdao.findAll(pageable);
			model.addAttribute("pageac",listAcc);
		}
		Accounts  item = new Accounts();
		model.addAttribute("items",item);
		return "home-admin/qlaccount";
	}

	@RequestMapping(value = "createAccount",method =RequestMethod.POST )
	public String createAcc(@ModelAttribute("items") Accounts account, BindingResult result,@RequestParam("photo") MultipartFile multipartFile) {
//		accdao.save(account);
		System.out.println("vao1");
		
			String a = paramService.saveFile(multipartFile, "/fileImg/");
			System.out.println("link" +a);
				account.setPhoto(a);
				accdao.save(account);
				System.out.println("vao");
		return "redirect:/admin/qlaccount";
	}

	@RequestMapping(value = "updateAccount" ,method = RequestMethod.POST)
	public String updateAcc(Accounts account,BindingResult result,@RequestParam("photo") MultipartFile multipartFile) {
		String b = paramService.saveFile(multipartFile, "/fileImg/");
		System.out.println("link" + b);
		account.setPhoto(b);
		accdao.save(account);
		
		return "redirect:/admin/qlaccount";
	}

	@RequestMapping("deleteAcc/{username}")
	public String deleteAcc(@PathVariable("username") String username) {
	
		accdao.deleteById(username);
		return "redirect:/admin/qlaccount";
	}
	
}
