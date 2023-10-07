package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Notification;

@Repository
public class NotificationDAO {
	@Autowired
	private JdbcTemplate dbJdbcTemplate;

	public int addNotification(String notification, String position) {
		String sql = "INSERT INTO `notification`(`notification_name`, `position`) VALUES (?,?)";
		return dbJdbcTemplate.update(sql,notification, position);
	}
	
	public int upStatus(int status, int id) {
		String sql = "UPDATE `notification` SET `status`=? WHERE `id`=?";
		return dbJdbcTemplate.update(sql,status, id);
	}

	public List<Notification> getListNotification() {
		String sql = "SELECT * FROM `notification` WHERE `status`=0 ORDER BY `created_date` DESC";
		return dbJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Notification.class));
	}
	public List<Notification> getListNotificationReaded() {
		String sql = "SELECT * FROM `notification` WHERE `status`=1 ORDER BY `created_date` DESC";
		return dbJdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Notification.class));
	}
	
}
