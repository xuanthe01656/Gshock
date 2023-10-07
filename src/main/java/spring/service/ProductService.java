package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.ProductDAO;
import spring.model.Product;
@Service
public class ProductService {

	@Autowired
	private ProductDAO productDAO;
	
	public List<Product> getListPro(){
		return productDAO.getListPro();
	}
	
	public List<Product> getListPro(int offset){
		return productDAO.getListPro(offset);
	}
	public Product getProBySKU(String sku) {
		return productDAO.getProBySKU(sku);
	}
	
	public int addProduct(Product product) {
		return productDAO.addProduct(product);
	}

	public Product getProById(int id) {
		return productDAO.getProById(id);
	}

	public int editProduct(Product product, int id) {
		return productDAO.editProduct(product, id);
	}
	public int editProductNotImg(Product product, int id) {
		return productDAO.editProductNotImg(product, id);
	}
	public int delPro(int id) {
		return productDAO.delPro(id);
	}

	public Object getProUnBySku(String sku, int id) {
		return productDAO.getProUnBySKU(sku, id);
	}

	public int delProByCat(int id) {
		return productDAO.deProByCat(id);
	}

	public List<Product> getListProByCat(int id) {
		return productDAO.getListProByCat(id);
	}

	public List<Product> getListProSellHeightByCatName(String name) {
		return productDAO.getListProSellHeightByCatName(name);
	}

	public List<Product> getListByCatName(String string) {
		return productDAO.getListProByCatName(string);
	}

	public List<Product> getListByCatId(int id) {
		return productDAO.getListProByCatId(id);
	}
	public List<Product> getListByCatName(String string, int offset) {
		return productDAO.getListProByCatName(string, offset);
	}

	public List<Product> getListByCatId(int id, int offset) {
		return productDAO.getListProByCatId(id, offset);
	}

}
