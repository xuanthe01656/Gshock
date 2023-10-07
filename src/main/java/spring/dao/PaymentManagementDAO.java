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

import spring.model.AccountATM;
import spring.model.AccountATMAdmin;
import spring.model.PaymentManagement;
import spring.model.Users;

@Repository
public class PaymentManagementDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int addAcc(PaymentManagement paymentManagement) {
		String sql = "INSERT INTO `payment_management`(`id_user`, `id_acc_receive_money`, `id_acc_withdrawal_money`,`method`, `payment_amount`, `withdrawal_amount`, `content_payment`) VALUES (?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, paymentManagement.getId_user(), paymentManagement.getId_acc_receive_money(), paymentManagement.getId_acc_withdrawal_money(),paymentManagement.getMethod(), paymentManagement.getPayment_amount(),paymentManagement.getWithdrawal_amount(), paymentManagement.getContent_payment());
	}

	public List<PaymentManagement> getListAcc() {
		List<PaymentManagement> list = new ArrayList<>();
		String sql = "SELECT * FROM `payment_management` INNER JOIN `account_atm_admin` ON payment_management.id_acc_receive_money=account_atm_admin.id OR payment_management.id_acc_receive_money= 0 INNER JOIN `account_atm` ON payment_management.id_user=account_atm.user_id OR payment_management.id_user!=account_atm.user_id INNER JOIN user ON payment_management.id_user = user.id GROUP BY payment_management.id ORDER BY payment_management.created_date DESC";
		list = jdbcTemplate.query(sql, new RowMapper<PaymentManagement>() {

			@Override
			public PaymentManagement mapRow(ResultSet rs, int rowNum) throws SQLException {
				Users user = new Users(rs.getInt("user.id"), rs.getString ("username"), rs.getString ("password"), rs.getString ("user.name"), rs.getString ("email"), rs.getString ("phone"), rs.getString ("address"),rs.getString ("city"),rs.getString ("user.created_date"),rs.getString ("update_date"),rs.getString("update_at"),rs.getInt ("user.status"),rs.getInt("enable"),rs.getInt("role_id"));
				AccountATM accATM = new AccountATM(rs.getInt("account_atm.id"), rs.getInt("account_atm.user_id"), rs.getString("account_atm.name"), rs.getString("account_atm.bank_name"), rs.getString("bank_branch"), rs.getString("account_atm.account_number"), rs.getTimestamp("account_atm.created_date"));
				AccountATMAdmin accATMAD = new AccountATMAdmin(rs.getInt("account_atm_admin.id"), rs.getInt("account_atm_admin.id_admin"), rs.getString("account_atm_admin.name"), rs.getString("account_atm_admin.bank_name"), rs.getString("account_atm_admin.account_number"), rs.getString("imgQr"), rs.getTimestamp("account_atm_admin.created_date"));
				PaymentManagement paymentManager = new PaymentManagement(rs.getInt("payment_management.id"),rs.getInt("payment_management.id_user"),rs.getInt("id_acc_receive_money"), rs.getInt("id_acc_withdrawal_money"),rs.getString("method"), rs.getFloat("payment_amount"), rs.getFloat("payment_management.withdrawal_amount"), rs.getNString("content_payment"),rs.getTimestamp("payment_management.created_date"), rs.getInt("payment_management.status"), rs.getString("notes"),  accATM, accATMAD, user);
				return paymentManager;
			}
			
		});
		return list;
	}

	public PaymentManagement getObjPayment(int id) {
		String sql = "SELECT * FROM `payment_management`INNER JOIN `account_atm_admin` ON payment_management.id_acc_receive_money=account_atm_admin.id OR payment_management.id_acc_receive_money= 0 INNER JOIN `account_atm` ON payment_management.id_user=account_atm.user_id OR payment_management.id_user!=account_atm.user_id INNER JOIN user ON payment_management.id_user = user.id WHERE payment_management.id=? GROUP BY payment_management.id;";
		PaymentManagement obj = new PaymentManagement();
		obj = jdbcTemplate.queryForObject(sql, new RowMapper<PaymentManagement>() {

			@Override
			public PaymentManagement mapRow(ResultSet rs, int rowNum) throws SQLException {
				Users user = new Users(rs.getInt("user.id"), rs.getString ("username"), rs.getString ("password"), rs.getString ("user.name"), rs.getString ("email"), rs.getString ("phone"), rs.getString ("address"),rs.getString ("city"),rs.getString ("user.created_date"),rs.getString ("update_date"),rs.getString ("update_at"),rs.getInt ("user.status"),rs.getInt("enable"),rs.getInt("role_id"));
				AccountATM accATM = new AccountATM(rs.getInt("account_atm.id"), rs.getInt("account_atm.user_id"), rs.getString("account_atm.name"), rs.getString("account_atm.bank_name"), rs.getString("bank_branch"), rs.getString("account_atm.account_number"), rs.getTimestamp("account_atm.created_date"));
				AccountATMAdmin accATMAD = new AccountATMAdmin(rs.getInt("account_atm_admin.id"), rs.getInt("account_atm_admin.id_admin"),rs.getString("account_atm_admin.name"), rs.getString("account_atm_admin.bank_name"), rs.getString("account_atm_admin.account_number"), rs.getString("imgQr"), rs.getTimestamp("account_atm_admin.created_date"));
				PaymentManagement paymentManager = new PaymentManagement(rs.getInt("payment_management.id"), rs.getInt("payment_management.id_user"),rs.getInt("id_acc_receive_money"), rs.getInt("id_acc_withdrawal_money"),rs.getString("method"), rs.getFloat("payment_amount"), rs.getFloat("payment_management.withdrawal_amount"), rs.getNString("content_payment"),rs.getTimestamp("payment_management.created_date"), rs.getInt("payment_management.status"), rs.getString("notes"),  accATM, accATMAD, user);
				return paymentManager;
			}
			
		}, id);
		return obj;
	}
	public PaymentManagement getObjPayments(int id) {
		String sql = "SELECT * FROM `payment_management` WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(PaymentManagement.class), id);
	}
	public int confirmPay(int status, int id, String notes) {
		String sql = "UPDATE `payment_management` SET `status`=?,`notes`=? WHERE id=? ;";
		return jdbcTemplate.update(sql,status, notes, id);
	}

	public List<PaymentManagement> getListByUser(int id_user) {
		List<PaymentManagement> list = new ArrayList<>();
		String sql = "SELECT * FROM `payment_management` INNER JOIN `account_atm_admin` ON payment_management.id_acc_receive_money=account_atm_admin.id OR payment_management.id_acc_receive_money= 0 INNER JOIN `account_atm` ON payment_management.id_user=account_atm.user_id OR payment_management.id_user!=account_atm.user_id INNER JOIN user ON payment_management.id_user = user.id WHERE payment_management.id_user = ? GROUP BY payment_management.id;";
		list = jdbcTemplate.query(sql, new RowMapper<PaymentManagement>() {

			@Override
			public PaymentManagement mapRow(ResultSet rs, int rowNum) throws SQLException {
				Users user = new Users(rs.getInt("user.id"), rs.getString ("username"), rs.getString ("password"), rs.getString ("user.name"), rs.getString ("email"), rs.getString ("phone"), rs.getString ("address"),rs.getString ("city"),rs.getString ("user.created_date"),rs.getString ("update_date"),rs.getString ("update_at"),rs.getInt ("user.status"),rs.getInt("enable"),rs.getInt("role_id"));
				AccountATM accATM = new AccountATM(rs.getInt("account_atm.id"), rs.getInt("account_atm.user_id"), rs.getString("account_atm.name"), rs.getString("account_atm.bank_name"), rs.getString("bank_branch"), rs.getString("account_atm.account_number"), rs.getTimestamp("account_atm.created_date"));
				AccountATMAdmin accATMAD = new AccountATMAdmin(rs.getInt("account_atm_admin.id"), rs.getInt("account_atm_admin.id_admin"), rs.getString("account_atm_admin.name"), rs.getString("account_atm_admin.bank_name"), rs.getString("account_atm_admin.account_number"), rs.getString("imgQr"), rs.getTimestamp("account_atm_admin.created_date"));
				PaymentManagement paymentManager = new PaymentManagement(rs.getInt("payment_management.id"),rs.getInt("payment_management.id_user"),rs.getInt("id_acc_receive_money"), rs.getInt("id_acc_withdrawal_money"),rs.getString("method"), rs.getFloat("payment_amount"), rs.getFloat("payment_management.withdrawal_amount"), rs.getNString("content_payment"),rs.getTimestamp("payment_management.created_date"), rs.getInt("payment_management.status"), rs.getString("notes"),  accATM, accATMAD, user);
				return paymentManager;
			}
			
		}, id_user);
		return list;
	}

	public List<PaymentManagement> getListAccByKey(String key) {
		List<PaymentManagement> list = new ArrayList<>();
		String sql = "SELECT * FROM `payment_management` INNER JOIN `account_atm_admin` ON payment_management.id_acc_receive_money=account_atm_admin.id OR payment_management.id_acc_receive_money= 0 INNER JOIN `account_atm` ON payment_management.id_user=account_atm.user_id OR payment_management.id_user!=account_atm.user_id INNER JOIN user ON payment_management.id_user = user.id WHERE `user`.username LIKE ? OR `payment_management`.method LIKE ? OR `payment_management`.content_payment LIKE ? GROUP BY `payment_management`.id;";
		String keys = "%"+key+"%";
		list = jdbcTemplate.query(sql, new RowMapper<PaymentManagement>() {

			@Override
			public PaymentManagement mapRow(ResultSet rs, int rowNum) throws SQLException {
				Users user = new Users(rs.getInt("user.id"), rs.getString ("username"), rs.getString ("password"), rs.getString ("user.name"), rs.getString ("email"), rs.getString ("phone"), rs.getString ("address"),rs.getString ("city"),rs.getString ("user.created_date"),rs.getString ("update_date"),rs.getString ("update_at"),rs.getInt ("user.status"),rs.getInt("enable"),rs.getInt("role_id"));
				AccountATM accATM = new AccountATM(rs.getInt("account_atm.id"), rs.getInt("account_atm.user_id"), rs.getString("account_atm.name"), rs.getString("account_atm.bank_name"), rs.getString("bank_branch"), rs.getString("account_atm.account_number"), rs.getTimestamp("account_atm.created_date"));
				AccountATMAdmin accATMAD = new AccountATMAdmin(rs.getInt("account_atm_admin.id"), rs.getInt("account_atm_admin.id_admin"), rs.getString("account_atm_admin.name"), rs.getString("account_atm_admin.bank_name"), rs.getString("account_atm_admin.account_number"), rs.getString("imgQr"), rs.getTimestamp("account_atm_admin.created_date"));
				PaymentManagement paymentManager = new PaymentManagement(rs.getInt("payment_management.id"),rs.getInt("payment_management.id_user"),rs.getInt("id_acc_receive_money"), rs.getInt("id_acc_withdrawal_money"),rs.getString("method"), rs.getFloat("payment_amount"), rs.getFloat("payment_management.withdrawal_amount"), rs.getNString("content_payment"),rs.getTimestamp("payment_management.created_date"), rs.getInt("payment_management.status"), rs.getString("notes"),  accATM, accATMAD, user);
				return paymentManager;
			}
			
		},keys,keys,keys);
		return list;
	}
	
}
