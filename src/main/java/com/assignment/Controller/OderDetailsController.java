package com.assignment.Controller;

import java.util.ArrayList;
import java.util.Arrays;
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

import com.assignment.Dao.OrderDetailDAO;
import com.assignment.Entity.Categories;
import com.assignment.Entity.OderDetails;
import com.assignment.Entity.Oders;
import com.assignment.Entity.Products;

@Controller
@RequestMapping("admin")
public class OderDetailsController {
	@Autowired
	OrderDetailDAO orderDetailDao;
	
	@RequestMapping("qloderdetails")
	public String oderDetails(Model model,@RequestParam("pageoderdetail")Optional<Integer> p) {
		List<OderDetails> items = orderDetailDao.findAll();
		model.addAttribute("itemleg4", items);
		try {
			Pageable pageable  = PageRequest.of(p.orElse(0), 4);
			Page<OderDetails> listOderDetail = orderDetailDao.findAll(pageable);
			model.addAttribute("pageoderdetail",listOderDetail);
		} catch (Exception e) {
			// TODO: handle exception
			Pageable pageable = PageRequest.of(0, 4);
			Page<OderDetails> listOderDetail = orderDetailDao.findAll(pageable);
			model.addAttribute("pageoderdetail",listOderDetail);
		}
		OderDetails  item = new OderDetails();
		model.addAttribute("itemoderdetails",item);
		return "home-admin/oderdetails";
	}
	
	@ModelAttribute("statusdeli")
	String [] getStatusdelii() {
		String[] statusdeli =  {"Chờ xác nhận","Đang giao","Đã đến nơi"};
		return statusdeli;
	}
	
	@RequestMapping(value = "createOderDetails", method = RequestMethod.POST)
	public String createOder(@ModelAttribute("itemoderdetails") OderDetails oderdetails, BindingResult result) {
		//oderdetails.setStatusdeli(getStatusdelii());
		String a =  oderdetails.getStatusdeli();
		oderdetails.setStatusdeli(a);;
		orderDetailDao.save(oderdetails);	
		return "redirect:/admin/qloderdetails";
	}
	@RequestMapping("updateOderDetails")
	public String updateOderDetails(OderDetails items) {
		orderDetailDao.save(items);
		return "redirect:/admin/qloderdetails";
	}

	@RequestMapping(value = "deleteOderDetails/{id}")
	public String deleteAcc(@PathVariable("id") Long id) {
		orderDetailDao.deleteById(id);
		return "redirect:/admin/qloderdetails";
	}
	
	
	@ModelAttribute("oder")
	public List<Oders> oder() {
		List<Oders> items = orderDetailDao.findOder();
		List<Oders> category = new ArrayList<>();
		for (Oders a : items) {
			category.add(new Oders(a.getOderId(), null, null, null, null));
		}
		return category;
	}
	@ModelAttribute("product")
	public List<Products> product() {
		List<Products> items = orderDetailDao.findProducts();
		List<Products> category = new ArrayList<>();
		for (Products a : items) {
			category.add(new Products(a.getProductId(),a.getName(), null, null, null, null, null, null));
		}
		return category;
	}
}
