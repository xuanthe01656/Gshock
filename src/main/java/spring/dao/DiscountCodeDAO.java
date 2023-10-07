package spring.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.DiscountCode;

@Repository
public class DiscountCodeDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public DiscountCode getCode(String code) {
		String sql = "SELECT * FROM `discount_code` WHERE `discount_code`=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(DiscountCode.class),code);
	}
}
