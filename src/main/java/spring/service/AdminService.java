package spring.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import spring.dao.AdminDAO;
import spring.model.Admin;
import spring.model.Roles;

@Service
public class AdminService {
	@Autowired
	private AdminDAO adminDAO;
	
	public List<Admin> getListAdmin(){
		return adminDAO.getListAdmin();
	}
	
	public List<Roles> getRoles(){
		return adminDAO.getRoles();
	}
	
	public Admin getAdminByAdminname(String name) {
		return adminDAO.getAdminByAdminname(name);
	}

	public Admin getAdByName(String name) {
		return adminDAO.getAdminByAdminname(name);
	}

	public int editProfile(Admin admin, int id) {
		return adminDAO.editProfile(admin, id);
	}

	public int changePass(Admin admin) {
		return adminDAO.changePass(admin);
	}

	public int upAvata(Admin admin) {
		return adminDAO.upAvata(admin);
	}

	public Object getAdminByEmail(String email, int id) {
		
		return adminDAO.getAdminByEmail(email, id);
	}

	public Object getAdminByEmail(String email) {
		
		return adminDAO.getAdminByEmail(email);
	}

	public int addAdmin(Admin admin) {
		
		return adminDAO.addAdmin(admin);
	}
}
