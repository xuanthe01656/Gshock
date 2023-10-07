package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.AccountATMDAO;
import spring.model.AccountATM;

@Service
public class AccountATMService {
	@Autowired
	private AccountATMDAO accountATMDAO;

	public boolean existAcc(String account_number) {
		return accountATMDAO.existAcc(account_number);
	}

	public int addAcc(AccountATM accountATM, int id_user) {
		return accountATMDAO.addAcc(accountATM, id_user);
	}

	public List<AccountATM> getListAccByUser(int id_user) {
		return accountATMDAO.getListByUser(id_user);
	}

	public List<AccountATM> getListAcc() {
		return accountATMDAO.getListAcc();
	}
}
