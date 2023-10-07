package spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.model.Admin;
import spring.model.LockPayAccount;
import spring.model.Roles;
import spring.model.Users;

@Repository
public class LockPayAccountDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int createdAccLockxu(int id) {
		String sql = "INSERT INTO `lock_pay`(`user_id`) VALUES (?)";
		return jdbcTemplate.update(sql, id);
	}

	public LockPayAccount getAccLockxu(int id_user) {
		String sql = "SELECT * FROM `lock_pay` WHERE user_id=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(LockPayAccount.class), id_user);
	}

	public int upAmount(int lockxu, int id) {
		String sql = "UPDATE `lock_pay` SET `surplus`=`surplus`+? WHERE id= ?;";
		return jdbcTemplate.update(sql, lockxu, id);
	}

	public int setLockxu(int id_user, int newLockxu) {
		String sql = "UPDATE `lock_pay` SET `surplus`=? WHERE user_id=? ;";
		return jdbcTemplate.update(sql, newLockxu, id_user);
	}

	public List<LockPayAccount> getListLockxu() {
		List<LockPayAccount> list = new ArrayList<>(); 
		String sql = "SELECT * FROM `lock_pay` INNER JOIN user ON lock_pay.user_id = user.id";
		list = jdbcTemplate.query(sql, new RowMapper<LockPayAccount>() {
			@Override
			public LockPayAccount mapRow(ResultSet rs, int arg) throws SQLException {
					Users users = new Users(rs.getInt("user.id"), rs.getString("user.username"),rs.getString("user.password"),rs.getString("user.name"),rs.getString("user.email"),rs.getString("user.phone"),rs.getString("user.address"),rs.getString("user.city"),rs.getString("user.created_date"),rs.getString("user.update_date"),rs.getString("user.update_at"),rs.getInt("user.status"),rs.getInt("enable"),rs.getInt("user.role_id"));
					LockPayAccount lockPayAccount = new LockPayAccount(rs.getInt("lock_pay.id"), rs.getInt("lock_pay.user_id"), rs.getString("lock_pay.name"),rs.getInt("lock_pay.surplus"), rs.getTimestamp("lock_pay.created_date"),users);
				return lockPayAccount;
			}
		});
		return list;
	}
}
