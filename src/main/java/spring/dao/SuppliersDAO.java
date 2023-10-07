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

import spring.model.Suppliers;

@Repository
public class SuppliersDAO {
	@Autowired
	JdbcTemplate jdbcTemplate;

	public List<Suppliers> getListSupplier() {
		List<Suppliers> list = new ArrayList<>();
		String sql = "SELECT * FROM `suppliers`;";
		list = jdbcTemplate.query(sql, new RowMapper<Suppliers>() {

			@Override
			public Suppliers mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				return sup;
			}
		});
		return list;
	}

	public int addSupplier(Suppliers suppliers, int id) {
		String sql ="INSERT INTO `suppliers`(`supplier_code`, `supplier_name`, `supplier_phone`, `supplier_email`, `supplier_addr`, `tax_code`, `notes`, `user_init`) VALUES (?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, suppliers.getSupplier_code(), suppliers.getSupplier_name(), suppliers.getSupplier_phone(), suppliers.getSupplier_email(), suppliers.getSupplier_addr(), suppliers.getTax_code(), suppliers.getNotes(), id);
	}
	
}
