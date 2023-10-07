package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.AccountATM;

@Repository
public class AccountATMDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public boolean existAcc(String account_number) {
		String sql = "SELECT * FROM `account_atm` WHERE `account_number`=?";
		if(jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AccountATM.class), account_number).size()>0) {
			return true;
		}
		return false;
	}

	public int addAcc(AccountATM accountATM, int id_user) {
		String sql = "INSERT INTO `account_atm`(`user_id`, `name`, `bank_name`, `bank_branch`, `account_number`) VALUES (?,?,?,?,?)";
		return jdbcTemplate.update(sql, id_user, accountATM.getName(), accountATM.getBank_name(), accountATM.getBank_branch(), accountATM.getAccount_number());
	}

	public List<AccountATM> getListByUser(int id_user) {
		String sql= "SELECT * FROM `account_atm` WHERE `user_id`=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AccountATM.class), id_user);
	}

	public List<AccountATM> getListAcc() {
		String sql= "SELECT * FROM `account_atm`";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AccountATM.class));
	}
}
