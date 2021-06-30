package com.assignment.Controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.multipart.MultipartFile;

import com.assignment.Dao.CategoryDAO;
import com.assignment.Dao.ProductDAO;
import com.assignment.Entity.Accounts;
import com.assignment.Entity.Categories;
import com.assignment.Entity.Products;
import com.assignment.Service.ParamService;

@Controller
@RequestMapping("admin")
public class ProductController {
	@Autowired
	ProductDAO productDao;

	@Autowired
	ParamService paramService;

	@RequestMapping("qlproducts")
	public String admin(Model model, @RequestParam("pagepr") Optional<Integer> p) {
		List<Products> items = productDao.findAll();
		model.addAttribute("itemleg2", items);
		try {
			Pageable pageable = PageRequest.of(p.orElse(0), 4);
			Page<Products> listPro = productDao.findAll(pageable);
			model.addAttribute("pagepr", listPro);
		} catch (Exception e) {
			// TODO: handle exception
			Pageable pageable = PageRequest.of(0, 4);
			Page<Products> listPro = productDao.findAll(pageable);
			model.addAttribute("pagepr", listPro);
		}
		Products item = new Products();
		model.addAttribute("itempr", item);
		return "home-admin/qlproducts";
	}

//	@RequestMapping("qlproducts/sort")
//	public String sort(Model model, @RequestParam("field") Optional<String> field,BindingResult result) {
//		Sort sort = Sort.by(Direction.DESC, field.orElse("price"));
//		model.addAttribute("field", field.orElse("price").toUpperCase());
//		List<Products> items = productDao.findAll(sort);
//		model.addAttribute("pagepr", items);
//		return "home-admin/qlproducts";
//	}
	
	
	
	
	@RequestMapping(value = "createProduct", method = RequestMethod.POST)
	public String createProduct(@ModelAttribute("itempr") Products products, BindingResult result,@RequestParam("image") MultipartFile multipartFile) {
		String a = paramService.saveFile(multipartFile, "/fileImg/");
		System.out.println("link" +a);
		products.setImage(a);
		productDao.save(products);
		return "redirect:/admin/qlproducts";
	}
	
	@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
	public String updateProduct(Products items,BindingResult result,@RequestParam("image") MultipartFile multipartFile) {
		String b = paramService.saveFile(multipartFile, "/fileImg/");
		System.out.println("link" + b);
		items.setImage(b);
		productDao.save(items);
		return "redirect:/admin/qlproducts";
	}

	@RequestMapping("deleteProduct/{id}")
	public String deleteAcc(@PathVariable("id") Integer id) {
		productDao.deleteById(id);
		return "redirect:/admin/qlproducts";
	}
	
	@ModelAttribute("category")
	public List<Categories> categories() {
		List<Categories> items = productDao.findCategory();
		List<Categories> category = new ArrayList<>();
		for (Categories a : items) {
			category.add(new Categories(a.getCategoryId(), a.getName(), null));
		}
		return category;
	}
}
