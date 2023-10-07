package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.CartDAO;
import spring.model.Cart;
import spring.model.Product;

@Service
public class CartService {
	@Autowired
	private CartDAO cartDAO;

	
	public int addPro(Product pro, int id_user, String ip) {
		return cartDAO.addPro(pro, id_user, ip);
	}

	public Cart getPro(int user_id,String ip, int id) {
		return cartDAO.getPro(user_id, ip, id);
	}

	public List<Cart> getListPro(int user_id, String ip) {
		return cartDAO.getListPro(user_id, ip);
	}

	public int delPro(int id) {
		return cartDAO.delPro(id);
	}

	public List<Cart> getListProById(int id) {
		return cartDAO.getListProById(id);
	}

	public int upQtyPro(int id, int qty) {
		return cartDAO.upQtyPro(id, qty);
	}

	public Cart getProByProId(int id_user, String ip,int id) {
		return cartDAO.getProByProId(id_user, ip, id);
	}

	public List<Cart> getListProByProId(int id_user, String ip, int id) {
		return cartDAO.getListProByProId(id_user, ip, id);
	}

	public int upStatus(int id, int i) {
		return cartDAO.upStatus(id, i);
	}

}
