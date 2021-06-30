package com.assignment.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.assignment.Entity.Accounts;
import com.assignment.Entity.Categories;
import com.assignment.Entity.OderDetails;
import com.assignment.Entity.Oders;
import com.assignment.Entity.Products;
import com.assignment.Service.AccountService;
import com.assignment.Service.CategoriService;
import com.assignment.Service.OderDetailsService;
import com.assignment.Service.OderServie;
import com.assignment.Service.ProductService;

@RestController
@RequestMapping("admin")
public class AjaxController {
	@Autowired
	CategoriService categoriService;

	@Autowired
	AccountService accountService;

	@Autowired
	ProductService productService;

	@Autowired
	OderServie oderService;
	
	@Autowired
	OderDetailsService oderDetailsService;
	
//	@GetMapping("category-demo")
//	public ResponseEntity<List<Categories>> getCategoriList() {
//		List <Categories> categories = categoriService.getCategoriList();
//		System.out.println(categories.get(0).getName());
//		return new ResponseEntity<List<Categories>>(categories,HttpStatus.OK);
//
//	}
	// Category
	@GetMapping("category-demo/{id}")
	public ResponseEntity<Categories> getCategoris(@PathVariable String id) {
		return new ResponseEntity<Categories>(categoriService.getCategoriById(id), HttpStatus.OK);
	}

//	@PostMapping("category-demo/save")
//	public ResponseEntity<Void> saveorUpdateCategories(@RequestBody Categories categories){
//		categoriService.saveUpdateCategory(categories);
//		return new ResponseEntity<Void>(HttpStatus.OK);
//	}
	@DeleteMapping("category-demo/delete/{id}")
	public ResponseEntity<Void> deleteCategory(@PathVariable String id) {
		categoriService.deleteCategory(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	// Account
//	
	@GetMapping("account-ajax/{username}")
	public ResponseEntity<Accounts> getAccount(@PathVariable String username) {
		return new ResponseEntity<Accounts>(accountService.getAccountById(username), HttpStatus.OK);
	}

	@DeleteMapping("account-ajax/delete/{username}")
	public ResponseEntity<Void> deleteAccount(@PathVariable String username) {
		accountService.deleteAccount(username);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}

	// Product
//	
	@GetMapping("products-ajax/{id}")
	public ResponseEntity<Products> getProduct(@PathVariable Integer id) {
		return new ResponseEntity<Products>(productService.geProductById(id), HttpStatus.OK);
	}

	@DeleteMapping("products-ajax/delete/{id}")
	public ResponseEntity<Void> deleteProduct(@PathVariable Integer id) {
		productService.deleteProduct(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	//Oders
	@GetMapping("oders-ajax/{id}")
	public ResponseEntity<Oders> getOders(@PathVariable Long id) {
		return new ResponseEntity<Oders>(oderService.getOderById(id), HttpStatus.OK);
	}

	@DeleteMapping("oders-ajax/delete/{id}")
	public ResponseEntity<Void> deleteOder(@PathVariable Long id) {
		oderService.deleteOder(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
	
	//OderDetails
	@GetMapping("odersDetails-ajax/{id}")
	public ResponseEntity<OderDetails> getOderDetails(@PathVariable Long id) {
		return new ResponseEntity<OderDetails>(oderDetailsService.getOderDetailById(id), HttpStatus.OK);
	}

	@DeleteMapping("odersDetails-ajax/delete/{id}")
	public ResponseEntity<Void> deleteOderDetails(@PathVariable Long id) {
		oderDetailsService.deleteOderDetails(id);
		return new ResponseEntity<Void>(HttpStatus.OK);
	}
}
