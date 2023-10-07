package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Users;

@Repository
public class UsersDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Users> getListUser() {
		String sql ="SELECT * FROM `user`";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Users.class));
	}

	public Users getUserByUsername(String username) {
		String sql = "SELECT * FROM `user` WHERE `username`=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Users.class), username);
	}

	public int addUser(Users user) {
		String sql ="INSERT INTO `user`(`username`, `password`, `email`) VALUES (?,?,?)";
		return jdbcTemplate.update(sql, user.getUsername(), user.getPassword(), user.getEmail());
	}

	public Users getUserByEmail(String email) {
		String sql = "SELECT * FROM `user` WHERE `email`=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Users.class), email);
	}

	public List<Users> exisUser(String email, String password) {
		String sql = "SELECT * FROM user WHERE email=? OR password=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Users.class), email, password);
	}

	public int setPass(String password, int id) {
		String sql ="UPDATE `user` SET `password`=? WHERE `id`=?";
		return jdbcTemplate.update(sql, password, id);
	}

	public int updateUser(Users users) {
		String sql ="UPDATE `user` SET `name`=?, `email` = ?, `phone`=? WHERE `id`=?";
		return jdbcTemplate.update(sql, users.getName(), users.getEmail(), users.getPhone(), users.getId());
	}

	public Users getUserById(int id_user) {
		String sql = "SELECT * FROM `user` WHERE `id`=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Users.class), id_user);
	}
	
}
