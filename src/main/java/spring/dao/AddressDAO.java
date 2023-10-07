package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Address;

@Repository
public class AddressDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public List<Address> getListProvinces() {
		String sql = "SELECT * FROM `provinces`";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Address.class));
	}
	public List<Address> getListDistricts(String code) {
		String sql = "SELECT * FROM `districts` WHERE `province_code`=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Address.class), code);
		
	}
	public List<Address> getListWards(String code) {
		String sql = "SELECT * FROM `wards` WHERE `district_code`=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Address.class), code);
	}
	public Address getProvince(String code) {
		String sql = "SELECT * FROM `provinces` WHERE `code` = ?;";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Address.class), code);
	}
	public Address getDistrict(String code) {
		String sql = "SELECT * FROM `districts` WHERE `code` = ?;";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Address.class), code);
	}
	public Address getWard(String code) {
		String sql = "SELECT * FROM `wards` WHERE `code` = ?;";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Address.class), code);
	}
	
	
}
