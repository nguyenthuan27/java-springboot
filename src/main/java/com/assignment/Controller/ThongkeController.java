package com.assignment.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.assignment.Dao.CategoryDAO;
import com.assignment.Entity.Reporttype;
import com.assignment.Entity.RepostTime;
@Controller
@RequestMapping("admin")
public class ThongkeController {
	@Autowired
	CategoryDAO categoriDao;
	
	@RequestMapping("thongke")
	public String thongke(Model model) {
		
		List<Reporttype> report = categoriDao.findType();
		model.addAttribute("reporttype", report);
		return "home-admin/thongke1";
	}
	@RequestMapping("thongketop")
	public String thongketop(Model model) {
		List<RepostTime> reporttime = categoriDao.findtime();
		model.addAttribute("reporttime", reporttime);
		return "home-admin/thongke2";
	}
}
