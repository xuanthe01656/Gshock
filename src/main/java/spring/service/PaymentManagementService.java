package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.PaymentManagementDAO;
import spring.model.AccountATMAdmin;
import spring.model.PaymentManagement;

@Service
public class PaymentManagementService {
	@Autowired
	private PaymentManagementDAO paymentManagementDAO;

	public int addAcc(PaymentManagement paymentManagement) {
		return paymentManagementDAO.addAcc(paymentManagement);
	}

	public List<PaymentManagement> getListAcc() {
		return paymentManagementDAO.getListAcc();
	}

	public PaymentManagement getObjPayment(int id) {
		return paymentManagementDAO.getObjPayment(id);
	}

	public int confirmPay(int status, int id, String notes) {
		return paymentManagementDAO.confirmPay(status,id, notes);
	}

	public List<PaymentManagement> getListByUser(int id_user) {
		return paymentManagementDAO.getListByUser(id_user);
	}

	public PaymentManagement getObjPayments(int id) {
		return paymentManagementDAO.getObjPayments(id);
	}

	public List<PaymentManagement> getListAccByKey(String key) {
		return paymentManagementDAO.getListAccByKey(key);
	}
}
