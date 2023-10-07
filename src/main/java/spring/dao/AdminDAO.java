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
import spring.model.Roles;

@Repository
public class AdminDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Admin> getListAdmin(){
		List<Admin> list = new ArrayList<>();
		String sql = "SELECT * FROM admin INNER JOIN roles ON admin.role_id=roles.id;";
		list = jdbcTemplate.query(sql, new RowMapper<Admin>() {
			@Override
			public Admin mapRow(ResultSet rs, int arg) throws SQLException {
					Roles role = new Roles(rs.getInt("roles.id"), rs.getString("roles.name"));
					Admin Admin = new Admin(rs.getInt("admin.id"), rs.getString("username"), rs.getString("password"),rs.getString("remember_token"), rs.getString("fullname"), rs.getString("email"), rs.getString("phone"), rs.getString("address"),rs.getString("images"),rs.getTimestamp("created_date"), rs.getInt("role_id"), rs.getInt("enable"), role);
				return Admin;
			}
		});
		return list;
	} 
	
	public List<Roles> getRoles(){
		String sql="SELECT * FROM roles";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Roles.class));
	}

	public Admin getAdminByAdminname(String name) {
		Admin Admin = new Admin();
		String sql ="SELECT * FROM admin INNER JOIN roles ON admin.role_id=roles.id WHERE admin.username=? ";
		Admin = jdbcTemplate.queryForObject(sql, new RowMapper<Admin>() {
			@Override
			public Admin mapRow(ResultSet rs, int arg) throws SQLException {
				Roles role = new Roles(rs.getInt("roles.id"), rs.getString("roles.name"));
				Admin Admin = new Admin(rs.getInt("admin.id"), rs.getString("username"), rs.getString("password"),rs.getString("remember_token"), rs.getString("fullname"), rs.getString("email"), rs.getString("phone"), rs.getString("address"),rs.getString("images"),rs.getTimestamp("created_date"), rs.getInt("role_id"), rs.getInt("enable"), role);
			return Admin;
			}
		}, name);
		return Admin;
	}

	public int editProfile(Admin admin, int id) {
		String sql = "UPDATE `admin` SET `fullname`=?,`email`=?,`phone`=?,`address`=?,`images`=? WHERE `id`=?";
		return jdbcTemplate.update(sql, admin.getFullname(), admin.getEmail(), admin.getPhone(), admin.getAddress(), admin.getImages(), id);
	}

	public int changePass(Admin admin) {
		String sql = "UPDATE `admin` SET `password`=? WHERE `id`=?";
		return jdbcTemplate.update(sql, admin.getPassword(), admin.getId());
	}

	public int upAvata(Admin admin) {
		String sql = "UPDATE `admin` SET `images`=? WHERE `id`=?";
		return jdbcTemplate.update(sql, admin.getImages(), admin.getId());
	}

	public Admin getAdminByEmail(String email, int id) {
		String sql = "SELECT * FROM `admin` WHERE `email`=? AND id!=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Admin.class), email, id);
	}
	public Admin getAdminByEmail(String email) {
		String sql = "SELECT * FROM `admin` WHERE `email`=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Admin.class), email);
	}

	public int addAdmin(Admin admin) {
		String sql = "INSERT INTO `admin`(`username`, `password`, `fullname`, `email`, `phone`, `address`, `role_id`) VALUES (?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, admin.getUsername(), admin.getPassword(), admin.getFullname(), admin.getEmail(), admin.getPhone(), admin.getAddress(), admin.getRole_id());
	}
}
