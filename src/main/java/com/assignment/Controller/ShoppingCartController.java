package com.assignment.Controller;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.assignment.Dao.AccountDAO;
import com.assignment.Dao.OrderDAO;
import com.assignment.Dao.OrderDetailDAO;
import com.assignment.Dao.ProductDAO;
import com.assignment.Entity.Accounts;
import com.assignment.Entity.ItemCart;
import com.assignment.Entity.OderDetails;
import com.assignment.Entity.Oders;
import com.assignment.Entity.Products;
import com.assignment.Entity.myproduct;
import com.assignment.Service.ProductService;
import com.assignment.Service.SessionService;
import com.assignment.Service.ShoppingCartService;



@Controller
@RequestMapping("customer")
public class ShoppingCartController {
	@Autowired
	ProductService productService;
	
	@Autowired
	ProductDAO productDao;
	@Autowired
	ShoppingCartService cartService;
	
	@Autowired
	OrderDAO oderDao;
	
	@Autowired
	AccountDAO accdao;
	
	@Autowired
	OrderDetailDAO oderDetailsDao;
	
	@Autowired 
	ShoppingCartService shopcartService;
	
	@Autowired
	SessionService sessionService;
	@RequestMapping("shopcart")
	public String usercart(Model model) {
		model.addAttribute("carts",cartService.getAllItems());
		model.addAttribute("total", cartService.getAmount());
		System.out.println(cartService.getAllItems());
		return "home/mycart";
	}
	@RequestMapping("oderDetails")
	public String oderDetails(Model model) {
		String a = sessionService.get("username");
		System.out.println(a);
		List<myproduct> listCart = oderDetailsDao.findMyProduct(a);
		model.addAttribute("listmycart", listCart);
		
		return "home/oderDetails";
	}
	@GetMapping("add/{id}")
	public String addCart(@PathVariable("id") Integer id) {
		Products product = productService.geProductById(id);
		if (product !=null) {
			ItemCart item = new ItemCart();
			item.setProId(product.getProductId());
			item.setName(product.getName());
			item.setPrice(product.getPrice());
			item.setImage(product.getImage());
			item.setQty(1);
			cartService.add(item);
		}
		
		return "redirect:/customer/shopcart";
	}  
	@PostMapping("update")
	public String update(@RequestParam("id") Integer id,@RequestParam("") Integer qty)  {
		cartService.update(id, qty);
		return "redirect:/customer/shopcart";
	}
	@GetMapping("delete/{id}")
	public String remove(@PathVariable("id") Integer id)  {
		cartService.remove(id);
		return "redirect:/customer/shopcart";
	}
	
	@PostMapping("oderfromcart")
	public String oderCart(@ModelAttribute("itemodercart") Oders item, BindingResult result) {
		String a= sessionService.get("username");
		item.setAccounts(accdao.findById(a).get());
		
		Collection<ItemCart> cart = shopcartService.getAllItems();
		oderDao.save(item);
	    System.out.println(item.getOderId());
		for (ItemCart n : cart) {
		OderDetails oderDetails = new OderDetails();
		oderDetails.setProducts(productDao.findById(n.getProId()).get());
		oderDetails.setPrice(n.getPrice());
		oderDetails.setStatusdeli("Chờ xác nhận");
		oderDetails.setQuantity(n.getQty());
		oderDetails.setOders(oderDao.findById(item.getOderId()).get());
		oderDetailsDao.save(oderDetails);
		System.out.println("aa"+n);
	}
		return "redirect:/customer/oderDetails";
	}
}
