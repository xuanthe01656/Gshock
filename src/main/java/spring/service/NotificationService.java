package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.NotificationDAO;
import spring.model.Notification;

@Service
public class NotificationService {
	@Autowired
	private NotificationDAO notificationDAO;

	public int addNotification(String notification, String position) {
		return notificationDAO.addNotification(notification, position);
	}
	public int upStatus(int status, int id) {
		return notificationDAO.upStatus(status, id);
	}
	public List<Notification> getLisNotification() {
		return notificationDAO.getListNotification();
	}
}
