package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.AccountATMAdmin;

@Repository
public class AccountATMAdminDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<AccountATMAdmin> getListAcc() {
		String sql = "SELECT * FROM `account_atm_admin`";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(AccountATMAdmin.class));
	}

	public int addAccATM(AccountATMAdmin accountATMAdmin, int id) {
		String sql = "INSERT INTO `account_atm_admin`(`id_admin`,`name`, `bank_name`, `account_number`, `imgQr`) VALUES (?,?,?,?,?)";
		return jdbcTemplate.update(sql, id, accountATMAdmin.getName(), accountATMAdmin.getBank_name(), accountATMAdmin.getAccount_number(), accountATMAdmin.getImgQr());
	}
	
}
