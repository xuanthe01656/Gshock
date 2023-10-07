package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.SuppliersDAO;
import spring.model.Suppliers;

@Service
public class SuppliersService {
	@Autowired
	private SuppliersDAO suppliersDAO;

	public List<Suppliers> getListSupplier() {
		return suppliersDAO.getListSupplier();
	}

	public int addSupplier(Suppliers suppliers, int id) {
		return suppliersDAO.addSupplier(suppliers, id);
	}
	
}
