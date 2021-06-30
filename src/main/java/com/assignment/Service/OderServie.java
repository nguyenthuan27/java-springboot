package com.assignment.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.assignment.Dao.OrderDAO;
import com.assignment.Entity.Oders;
@Service
public class OderServie {
	@Autowired
	private OrderDAO oderDAO;
	public List<Oders> getOderList(){
		return oderDAO.findAll();
	}
	public Oders getOderById(Long id) {
		return oderDAO.findById(id).get();
	}
	public void saveUpdateOders(Oders oders) {
		oderDAO.save(oders);
	}
	public void deleteOder(Long id) {
		oderDAO.deleteById(id);
	}
}
