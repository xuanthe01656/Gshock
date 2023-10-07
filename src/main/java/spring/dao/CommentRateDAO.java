package spring.dao;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import spring.model.CommentRate;

@Repository
public class CommentRateDAO {
	@Autowired
	private JdbcTemplate jdbcTemplate;

	public int addComment(CommentRate commentRate) {
		String sql = "INSERT INTO `comment_rate`(`product_id`, `comment`, `name`, `email`,`id_user_like`, `images`, `rate`, `comment_at`,`parent_id`) VALUES (?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, commentRate.getProduct_id(), commentRate.getComment(), commentRate.getName(), commentRate.getEmail(), commentRate.getId_user_like(), commentRate.getImages(), commentRate.getRate(), commentRate.getComment_at(), commentRate.getParent_id());
	}

	public List<CommentRate> getListCmt(int product_id, int prId) {
		String sql = "SELECT * FROM `comment_rate` WHERE `product_id`=? AND `parent_id`=? ORDER BY `comment_date` DESC;";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CommentRate.class),product_id, prId);
	}

	public List<CommentRate> getListCmtChil(int product_id, int parent_id) {
		String sql = "SELECT * FROM `comment_rate` WHERE `product_id`=? AND `parent_id`=? ORDER BY `comment_date` DESC;";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CommentRate.class),product_id, parent_id);
	}

	public List<CommentRate> getListAllCmt() {
		String sql = "SELECT * FROM `comment_rate` ORDER BY `comment_date` DESC;";
		return jdbcTemplate.query(sql, new BeanPropertyRowMapper<>(CommentRate.class));
	}

	public CommentRate getCmtById(int id) {
		String sql = "SELECT * FROM `comment_rate` WHERE `id`=?";
		return jdbcTemplate.queryForObject(sql, new BeanPropertyRowMapper<>(CommentRate.class), id);
	}

	public int upLike(int id, CommentRate cmt) {
		String sql = "UPDATE `comment_rate` SET `like_comment`=`like_comment`+1,`id_user_like`=? WHERE `id`=?";
		return jdbcTemplate.update(sql, cmt.getId_user_like(), id);
	}

	public int disLike(int id, CommentRate cmt) {
		String sql = "UPDATE `comment_rate` SET `like_comment`=`like_comment`-1,`id_user_like`=? WHERE `id`=?";
		return jdbcTemplate.update(sql, cmt.getId_user_like(), id);
	}
	
}
