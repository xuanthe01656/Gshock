package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.constant.Defines;
import spring.model.Order;
import spring.model.OrderDetail;

@Repository
public class OrdersDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int addOrderDetail(OrderDetail orderDetail) {
		String sql = "INSERT INTO `order_detail`( `order_code`, `fullname`, `email`, `phone`, `shipping_address`, `product_id`, `product_sku`, `product_detail`, `qty`, `price`, `Images`, `subtotal`, `discount`, `transports`, `total`, `payment_methods`, `ship_type`, `order_user`, `status`, `status_payment`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, orderDetail.getOrder_code(), orderDetail.getFullname(), orderDetail.getEmail(), orderDetail.getPhone(), orderDetail.getShipping_address(), orderDetail.getProduct_id(), orderDetail.getProduct_sku(),orderDetail.getProduct_detail(), orderDetail.getQty(), orderDetail.getPrice(), orderDetail.getImages(), orderDetail.getSubtotal(),orderDetail.getDiscount(), orderDetail.getTransports(),orderDetail.getTotal(), orderDetail.getPayment_methods(), orderDetail.getShip_type(), orderDetail.getOrder_user(),1, orderDetail.getStatus_payment());
	}
	public int addOrder(OrderDetail orderDetail) {
		String sql = "INSERT INTO `order`(`order_code`, `product_id`, `product_name`, `qty`, `total`, `payment_methods`, `ship_type`,`user_id`, `status`, `status_payment`) VALUES (?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, orderDetail.getOrder_code(), orderDetail.getProduct_id(), orderDetail.getProduct_detail(), orderDetail.getQty(), orderDetail.getTotal(), orderDetail.getPayment_methods(),orderDetail.getShip_type(),orderDetail.getOrder_user(),1, orderDetail.getStatus_payment());
	}
	public List<Order> getlistOrder() {
		String sql = "SELECT * FROM `order`";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Order.class));
	}
	
	public List<OrderDetail> getlistOrderDetailByCode(String order_code) {
		String sql = "SELECT * FROM `order_detail` WHERE order_code=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderDetail.class), order_code);
	}
	public List<Order> getlistOrder(int offset) {
		String sql = "SELECT * FROM `order` LIMIT ?,?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Order.class), offset, Defines.ROW_COUNT);
	}
	public int upStatusOrder(int status, String order_code) {
		String sql = "UPDATE `order` SET `status`=? WHERE `order_code`=?;";
		return jdbcTemplate.update(sql, status, order_code);
	}
	public int upStatusOrderDetail(int status, String order_code) {
		String sql ="UPDATE `order_detail` SET `status`=? WHERE `order_code`=? ;";
		return jdbcTemplate.update(sql, status, order_code);
	}
	public int upStatusPaymentOrder(int status, String order_code) {
		String sql = "UPDATE `order` SET `status_payment`=? WHERE `order_code`=?;";
		return jdbcTemplate.update(sql, status, order_code);
	}
	public int upStatusPaymentOrderDetail(int status, String order_code) {
		String sql ="UPDATE `order_detail` SET `status_payment`=? WHERE `order_code`=? ;";
		return jdbcTemplate.update(sql, status, order_code);
	}
	public List<OrderDetail> getListOrderDetail() {
		String sql = "SELECT * FROM `order_detail` ORDER BY `order_date` ASC";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderDetail.class));
	}
	public List<OrderDetail> getListByKeyWord(String key) {
		String sql = "SELECT * FROM `order_detail` WHERE `order_code`=? OR `fullname` LIKE ? OR `phone` LIKE ? OR `product_sku` LIKE ? OR `product_detail` LIKE ? ORDER BY `order_date` ASC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderDetail.class), key, "'%"+key+"%'","'%"+key+"%'","'%"+key+"%'","'%"+key+"%'");
	}
	public List<Order> getListOrderByKeyWord(String key) {
		String sql = "SELECT * FROM `order` WHERE `order_code`=? OR `product_name` LIKE ? OR `payment_methods` LIKE ? ORDER BY `order_date` ASC ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Order.class), key, "'%"+key+"%'","'%"+key+"%'");
	}
	public List<Order> getListOrderByKeyWord(String key, int offset) {
		String sql = "SELECT * FROM `order` WHERE `order_code`=? OR `product_name` LIKE ? OR `payment_methods` LIKE ? ORDER BY `order_date` ASC LIMIT ?,? ";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Order.class), key, "'%"+key+"%'","'%"+key+"%'", offset, Defines.ROW_COUNT);
	}
	public List<OrderDetail> getListOrderDetailByUser(int id_user) {
		String sql = "SELECT * FROM `order_detail` WHERE `order_user`=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(OrderDetail.class), id_user);
	}
	public List<Order> getListOrderByUser(int id_user) {
		String sql = "SELECT * FROM `order` WHERE `user_id`=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Order.class), id_user);
	}
	
}
