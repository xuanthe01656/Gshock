package spring.service;

import java.util.ArrayList;
import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.UsersDAO;
import spring.model.Admin;
import spring.model.Users;

@Service
public class UsersService {
	@Autowired
	private UsersDAO usersDAO;

	public List<Users> getListUser() {
		return usersDAO.getListUser();
	}

	public Users getUserByUsername(String username) {
		return usersDAO.getUserByUsername(username);
	}

	public int addUser(Users user) {
		return usersDAO.addUser(user);
	}

	public Users getUserByEmail(String email) {
		return usersDAO.getUserByEmail(email);
	}

	public List<Users> exisUser(String email, String password) {
		return usersDAO.exisUser(email, password) ;
	}

	public int setPass(String password, int id) {
		
		return usersDAO.setPass(password, id);
	}

	public int updateUser(Users users) {
		return usersDAO.updateUser(users);
	}

	public Users getUserById(int id_user) {
		return usersDAO.getUserById(id_user);
	}
	
}
