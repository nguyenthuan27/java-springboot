package com.assignment.Controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.Dao.CategoryDAO;
import com.assignment.Entity.Categories;
import com.assignment.Entity.Products;
import com.assignment.Service.SessionService;


@Controller
@RequestMapping("admin")
public class CategoryController {
	@Autowired
	CategoryDAO dao;
	
	@Autowired
	SessionService sessionService;
	
	@RequestMapping("home")
	public String home() {
		return "home-admin/home";
	}
	
	@RequestMapping("category")
	public String admin(Model model,@RequestParam("page")Optional<Integer> p,@RequestParam("keywords") Optional<String> kw) {
//		Categories item = new Categories();
//		model.addAttribute("item", item);
		List<Categories> items = dao.findAll();
		model.addAttribute("itemleg", items);
		try {
			String kwords = kw.orElse(sessionService.get("keywords", ""));
			sessionService.set("keywords", kwords);
			Pageable pageable  = PageRequest.of(p.orElse(0), 4);
			Page<Categories> listCate = dao.findByKeywords("%"+kwords+"%",pageable);
			model.addAttribute("page",listCate);
		} catch (Exception e) {
			// TODO: handle exception
			Pageable pageable = PageRequest.of(0, 4);
			Page<Categories> listCate = dao.findAll(pageable);
			model.addAttribute("page",listCate);
		}
		Categories  item = new Categories();
		model.addAttribute("item",item);
		return "home-admin/qldanhmuc";
	}


	@RequestMapping("category/edit/{id}")
	public String edit(Model model, @PathVariable("id") String id) {
		Categories item = dao.findById(id).get();
		model.addAttribute("item", item);
		List<Categories> items = dao.findAll();
		model.addAttribute("items", items);
		return "redirect:/admin/category";
	}
	@RequestMapping(value = "category/create",method = RequestMethod.POST)
	public String create(Model model,@Valid @ModelAttribute("item") Categories item,
            BindingResult result) {
		if (result.hasErrors()) {
			//return "redirect:/admin/category";
			model.addAttribute("message", "Losdgs");
			System.out.println("loi");
		}else {
			dao.save(item);
			System.out.println("thanh cong");
			return "redirect:/admin/category";
		}
		return "redirect:/admin/category";
	}

	@RequestMapping("update")
	public String update(Categories item) {
		dao.save(item);
		return "redirect:/admin/category";
	}
	@RequestMapping("delete/{id}")
	public String delete(@PathVariable("id") String id) {
		dao.deleteById(id);
		return "redirect:/admin/category";
	}
	
}
