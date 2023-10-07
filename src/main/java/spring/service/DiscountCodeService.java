package spring.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.DiscountCodeDAO;
import spring.model.DiscountCode;

@Service
public class DiscountCodeService {
	@Autowired
	private DiscountCodeDAO discountCodeDAO;

	public DiscountCode getCode(String code) {
		return discountCodeDAO.getCode(code);
	}
	
}
