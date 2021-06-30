package com.assignment.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.assignment.Dao.OrderDetailDAO;
import com.assignment.Entity.OderDetails;

@Service
public class OderDetailsService {
	@Autowired
	private OrderDetailDAO oderDetailsDAO;
	public List<OderDetails> getOderDetailList(){
		return oderDetailsDAO.findAll();
	}
	public OderDetails getOderDetailById(Long id) {
		return oderDetailsDAO.findById(id).get();
	}
	public void saveUpdateOderDetails(OderDetails oders) {
		oderDetailsDAO.save(oders);
	}
	public void deleteOderDetails(Long id) {
		oderDetailsDAO.deleteById(id);
	}
}
