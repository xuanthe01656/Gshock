package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.AccountATMAdminDAO;
import spring.model.AccountATMAdmin;

@Service
public class AccountATMAdminService {
	@Autowired
	private AccountATMAdminDAO accountATMAdminDAO;

	public List<AccountATMAdmin> getListAcc() {
		return accountATMAdminDAO.getListAcc();
	}

	public int addAccATM(AccountATMAdmin accountATMAdmin, int id) {
		return accountATMAdminDAO.addAccATM(accountATMAdmin, id);
	}
}
