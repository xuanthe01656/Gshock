package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Cart;
import spring.model.Product;

@Repository
public class CartDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int addPro(Product pro, int id_user, String ip) {
		String sql = "INSERT INTO `cart`(`product_id`,`product_sku`, `product_name`,`amount`,`quantity_sold`, `qty`, `price`,`images`, `user_id`,`ip`) VALUES (?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql,pro.getId(),pro.getProduct_sku(), pro.getName(),pro.getAmount(),pro.getQuantity_sold(),1,pro.getPrice(),pro.getImages(), id_user, ip);
	}

	public Cart getPro(int user_id, String ip,int id) {
		String sql = "SELECT * FROM `cart` WHERE (`user_id`=? OR `ip`=?) AND `status`=? AND product_id=? ;";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Cart.class),user_id, ip, 0, id);
	}

	public List<Cart> getListPro(int user_id, String ip) {
		String sql = "SELECT * FROM `cart` WHERE (`user_id`=? OR `ip`=?) AND `status`=? ;";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Cart.class), user_id, ip,0);
	}

	public int delPro(int id) {
		String sql = "DELETE FROM `cart` WHERE id=?";
		return jdbcTemplate.update(sql, id);
	}

	public List<Cart> getListProById(int id) {
		String sql = "SELECT * FROM `cart` WHERE id=? AND `status`=?;";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Cart.class), id,0);
	}

	public int upQtyPro(int id, int qty) {
		String sql = "UPDATE `cart` SET `qty`=? WHERE id=?;";
		return jdbcTemplate.update(sql, qty, id);
	}
	public int upStatus(int id, int status) {
		String sql = "UPDATE `cart` SET `status`=? WHERE id=?;";
		return jdbcTemplate.update(sql, status, id);
	}

	public Cart getProByProId(int id_user, String ip, int id) {
		String sql = "SELECT * FROM `cart` WHERE product_id=? AND `status`=? AND (`user_id`=? OR `ip`=?) ;";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Cart.class), id,0, id_user, ip);
	}

	public List<Cart> getListProByProId(int id_user, String ip, int id) {
		String sql = "SELECT * FROM `cart` WHERE product_id=? AND (`user_id`=? OR `ip`=?) AND `status`=?;";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Cart.class), id, id_user, ip,0);
	}
	
}
