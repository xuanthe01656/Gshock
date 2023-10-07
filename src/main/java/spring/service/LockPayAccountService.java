package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.LockPayAccountDAO;
import spring.model.LockPayAccount;

@Service
public class LockPayAccountService {
	@Autowired
	private LockPayAccountDAO lockPayAccountDAO;

	public int createdAccLockxu(int id) {
		return lockPayAccountDAO.createdAccLockxu(id);
	}

	public LockPayAccount getAccLockxu(int id_user) {
		return lockPayAccountDAO.getAccLockxu(id_user);
	}

	public int upAmount(int lockxu, int id) {
		return lockPayAccountDAO.upAmount(lockxu, id);
	}

	public int setLockxu(int id_user, int newLockxu) {
		return lockPayAccountDAO.setLockxu(id_user, newLockxu);
	}

	public List<LockPayAccount> getListLockxu() {
		return lockPayAccountDAO.getListLockxu();
	}

}
