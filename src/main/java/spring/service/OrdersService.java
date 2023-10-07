package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.OrdersDAO;
import spring.model.Order;
import spring.model.OrderDetail;

@Service
public class OrdersService {
	@Autowired
	private OrdersDAO ordersDAO;

	public int addOrderDetail(OrderDetail orderDetail) {
		return ordersDAO.addOrderDetail(orderDetail);
	}
	public int addOrder(OrderDetail orderDetail) {
		return ordersDAO.addOrder(orderDetail);
	}
	public List<Order> getLisOrder() {
		return ordersDAO.getlistOrder();
	}
	public List<Order> getLisOrder(int offset) {
		return ordersDAO.getlistOrder(offset);
	}
	public List<OrderDetail> getListOrderByCode(String code) {
		return ordersDAO.getlistOrderDetailByCode(code);
	}
	public int upStatusOrder(int status, String order_code) {
		return ordersDAO.upStatusOrder(status, order_code);
	}
	public int upStatusOrderDetail(int status, String order_code) {
		return ordersDAO.upStatusOrderDetail(status, order_code);
	}
	public int upStatusPaymentOrder(int status, String order_code) {
		return ordersDAO.upStatusOrder(status, order_code);
	}
	public int upStatusPaymentOrderDetail(int status, String order_code) {
		return ordersDAO.upStatusOrderDetail(status, order_code);
	}
	public List<OrderDetail> getLisOrderDetail() {
		return ordersDAO.getListOrderDetail();
	}
	public List<OrderDetail> getListByKeyWord(String key) {
		return ordersDAO.getListByKeyWord(key);
	}
	public List<Order> getListOrderByKeyWord(String key) {
		return ordersDAO.getListOrderByKeyWord(key);
	}
	public List<Order> getListOrderByKeyWord(String key, int offset) {
		return ordersDAO.getListOrderByKeyWord(key, offset);
	}
	public List<OrderDetail> getListOrderDetailByUser(int id_user) {
		return ordersDAO.getListOrderDetailByUser(id_user);
	}
	public List<Order> getListOrderByUser(int id_user) {
		return ordersDAO.getListOrderByUser(id_user);
	}
	
}
