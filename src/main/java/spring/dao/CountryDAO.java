package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Country;

@Repository
public class CountryDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<Country> getListCountry() {
		String sql = "SELECT * FROM `country`";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Country.class));
	}

	public int addCountry(Country country) {
		String sql="INSERT INTO `country`(`name`) VALUES (?)";
		return jdbcTemplate.update(sql, country.getName());
	}
	
	
}
