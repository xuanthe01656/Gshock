package spring.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.Categories;

@Repository
public class CategoriesDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Categories> getListCat() {
		String sql = "SELECT * FROM `category`";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Categories.class));
	}
	
	public List<Categories> getListCatPr() {
		String sql = "SELECT * FROM `category` WHERE parent_id=0";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Categories.class));
	}
	
	public List<Categories> getListCatChil(int id) {
		String sql = "SELECT * FROM `category` WHERE parent_id=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Categories.class), id);
	}
	
	public List<Categories> getListCatByPrId(int id) {
		String sql = "SELECT * FROM `category` WHERE parent_id=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Categories.class), id);
	}
	
	public int addCat(Categories categories, int prId) {
		String sql="INSERT INTO `category`(`name`,`image`,`logo`,`parent_id`) VALUES (?,?,?,?)";
		return jdbcTemplate.update(sql, categories.getName(), categories.getImage(),categories.getLogo(), prId);
	}

	public Categories getCatById(int id) {
		String sql="SELECT * FROM `category` WHERE id=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Categories.class), id);
	}

	public int editCat(Categories categories, int id) {
		String sql="UPDATE `category` SET `name`=?, `image`=?, `logo`=? WHERE id=?";
		return jdbcTemplate.update(sql, categories.getName(),categories.getImage(),categories.getLogo(), id);
	}

	public List<Categories> getListCatUnName(String name) {
		String sql = "SELECT * FROM `category` WHERE name!=?";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Categories.class), name);
	}

	public Categories getCatByPrIdName(int parent_id, String name) {
		String sql = "SELECT * FROM `category` WHERE name=? AND parent_id=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Categories.class), name, parent_id);
	}

	public Categories getCatByName(String name) {
		String sql = "SELECT * FROM `category` WHERE name =?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(Categories.class), name);
	}

	public int delCat(int id) {
		String sql = "DELETE FROM `category` WHERE id=?";
		return jdbcTemplate.update(sql, id);
	}
	public int delCatByPrId(int id) {
		String sql = "DELETE FROM `category` WHERE parent_id=?";
		return jdbcTemplate.update(sql, id);
	}

	public List<Categories> getListCatUnByPrId() {
		String sql = "SELECT * FROM `category` WHERE parent_id!=0";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(Categories.class));
	}
}
