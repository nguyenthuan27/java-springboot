package com.assignment.Controller;

import java.util.Optional;

import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.Dao.ProductDAO;
import com.assignment.Entity.Products;
import com.assignment.Service.ProductService;
import com.assignment.Service.ShoppingCartService;
@Controller
@RequestMapping("customer")
public class ListProductController {
	@Autowired
	ProductDAO productDao;
	
	@Autowired 
	ProductService productService;
	
	@Autowired
	ShoppingCartService cartService;
	@RequestMapping("list-products")
	public String listProduct(Model model, @RequestParam("listpr") Optional<Integer> p) {
		try {
			Pageable pageable = PageRequest.of(p.orElse(0), 8);
			Page<Products> listPro = productDao.findAll(pageable);
			model.addAttribute("listpr", listPro);
		} catch (Exception e) {
			// TODO: handle exception
			Pageable pageable = PageRequest.of(0, 8);
			Page<Products> listPro = productDao.findAll(pageable);
			model.addAttribute("listpr", listPro);
		}
		Products item = new Products();
		model.addAttribute("listitem", item);
		return "home/products";
	}
//	@RequestMapping("/load/{x}")
//	public String load(Model model,@PathVariable("x") Integer aa) {
//		System.out.println(aa);
//		Products item = new Products();
//		model.addAttribute("listitem", item);
//		return "home/products";
//	}
	
}
