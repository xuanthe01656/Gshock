package spring.service;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

import spring.dao.CategoriesDAO;
import spring.model.Categories;

@Service
public class CategoriesService {
	
	@Autowired
	private CategoriesDAO categoriesDAO;
	
	public List<Categories> getListCat(){
		
		return categoriesDAO.getListCat();
	}
	
//	public List<Categories> getListCatPr(){
//		
//		return categoriesDAO.getListCat();
//	}
	
	public int addCat(Categories categories, int prId) {
		return categoriesDAO.addCat(categories, prId);
	}

	public Categories getCatById(int id) {
		return categoriesDAO.getCatById(id);
	}

	public int editCat(Categories categories, int id) {
		return categoriesDAO.editCat(categories, id);
	}

	public List<Categories> getListCatUnName(String name) {
		return categoriesDAO.getListCatUnName(name);
	}

	public Categories getCatByPrIdName(int parent_id, String name) {
		return categoriesDAO.getCatByPrIdName(parent_id, name);
	}

	public Categories getCatByName(String name) {
		return categoriesDAO.getCatByName(name);
	}

	public List<Categories> getListCatPr() {
		return categoriesDAO.getListCatPr();
	}
	
	public List<Categories> getListCatByPrId(int id) {
		return categoriesDAO.getListCatByPrId(id);
	}

	public int delCat(int id) {
		return categoriesDAO.delCat(id);
	}
	
	public int delCatByPrId(int id) {
		return categoriesDAO.delCatByPrId(id);
	}

	public List<Categories> getListCatUnByPrId() {
		return categoriesDAO.getListCatUnByPrId();
	}
}
