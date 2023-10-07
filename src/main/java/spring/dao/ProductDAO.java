package spring.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.apache.tools.ant.taskdefs.Definer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import spring.constant.Defines;
import spring.model.Categories;
import spring.model.Product;
import spring.model.Suppliers;
@Repository
public class ProductDAO {

	@Autowired
	private JdbcTemplate jdbcTemplate;
	
	public List<Product> getListPro(){
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id;";
		List<Product> listPro = jdbcTemplate.query(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("suppliers.id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"),rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("product.id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"), rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("product.suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}});
		return listPro;
	}
	public List<Product> getListPro(int offset){
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id ORDER BY `product`.`created_date` DESC LIMIT ?,?";
		List<Product> listPro = jdbcTemplate.query(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"),rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"),	rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}}, offset, Defines.ROW_COUNT);
		return listPro;
	}
	
	public Product getProBySKU(String sku) {
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id WHERE `product_sku`=?";
		Product pro = jdbcTemplate.queryForObject(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"),rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"),	rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}}, sku);
		return pro;
	}
	public Product getProUnBySKU(String sku, int id) {
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id WHERE `product_sku`=? AND `product`.`id`!=?";
		Product pro = jdbcTemplate.queryForObject(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"),rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"),	rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}}, sku, id);
		return pro;
	}
	public int addProduct(Product product) {
		String sql ="INSERT INTO `product`(`product_sku`, `name`, `amount`, `cost`, `price`, `the_product_set_includes`, `product_information`, `shipping_policy`, `return_warranty`, `payments`, `discount`, `images`,`cat_lv1_id`, `cat_lv2_id`, `suppliers_id`, `country_id`, `created_at`, `created_date`) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		return jdbcTemplate.update(sql, product.getProduct_sku(), product.getName(), product.getAmount(), product.getCost(), product.getPrice(), product.getThe_product_set_includes(), product.getProduct_information(), product.getShipping_policy(), product.getReturn_warranty(), product.getPayments(), product.getDiscount(), product.getImages(), product.getCat_lv1_id(), product.getCat_lv2_id(), product.getSuppliers_id(), product.getCountry_id(), product.getCreated_at(), product.getCreated_date());
	}
	public Product getProById(int id) {
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id WHERE `product`.`id`=?";
		Product pro = jdbcTemplate.queryForObject(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"),rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"),	rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}}, id);
		return pro;
	}
	public int editProduct(Product product, int id) {
		String sql = "UPDATE `product` SET `product_sku`=?,`name`=?,`amount`=?,`cost`=?,`price`=?,`the_product_set_includes`=?,`product_information`=?,`shipping_policy`=?,`return_warranty`=?,`payments`=?,`images`=?,`cat_lv1_id`=?,`cat_lv2_id`=?,`suppliers_id`=?,`updated_at`=? WHERE `id`=?;";
		return jdbcTemplate.update(sql, product.getProduct_sku(), product.getName(), product.getAmount(), product.getCost(), product.getPrice(), product.getThe_product_set_includes(), product.getProduct_information(), product.getShipping_policy(), product.getReturn_warranty(), product.getPayments(), product.getImages(), product.getCat_lv1_id(), product.getCat_lv2_id(), product.getSuppliers_id(), product.getUpdated_at(), id);
	}
	
	public int editProductNotImg(Product product, int id) {
		String sql = "UPDATE `product` SET `product_sku`=?,`name`=?,`amount`=?,`cost`=?,`price`=?,`the_product_set_includes`=?,`product_information`=?,`shipping_policy`=?,`return_warranty`=?,`payments`=?, `cat_lv1_id`=?,`cat_lv2_id`=?,`suppliers_id`=?,`updated_at`=? WHERE `id` =?;";
		return jdbcTemplate.update(sql, product.getProduct_sku(), product.getName(), product.getAmount(), product.getCost(), product.getPrice(), product.getThe_product_set_includes(), product.getProduct_information(), product.getShipping_policy(), product.getReturn_warranty(), product.getPayments(), product.getCat_lv1_id(), product.getCat_lv2_id(), product.getSuppliers_id(), product.getUpdated_at(), id);
	}
	
	public int delPro(int id) {
		String sql="DELETE FROM `product` WHERE id=?";
		return jdbcTemplate.update(sql, id);
	}
	public int deProByCat(int id) {
		String sql="DELETE FROM `product` WHERE cat_lv1_id=? OR cat_lv2_id=?";
		return jdbcTemplate.update(sql, id, id);
	}
	public List<Product> getListProByCat(int id) {
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id WHERE cat_lv1_id=? OR cat_lv2_id=?";
		List<Product> listPro = jdbcTemplate.query(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("suppliers.id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"),rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("product.id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"), rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("product.suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}}, id, id);
		return listPro;
	}
	public List<Product> getListProSellHeightByCatName(String name) {
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id WHERE quantity_sold>=? AND categories.catChilName=?;";
		List<Product> listPro = jdbcTemplate.query(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("suppliers.id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"),rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("product.id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"), rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("product.suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}},200, name);
		return listPro;
	}
	public List<Product> getListProByCatName(String string) {
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id WHERE categories.catChilName=? OR categories.catPrName=? ORDER BY product.created_date DESC ;";
		List<Product> listPro = jdbcTemplate.query(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("suppliers.id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"), rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("product.id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"), rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("product.suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}}, string, string);
		return listPro;
	}
	public List<Product> getListProByCatId(int id) {
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id WHERE product.cat_lv1_id=? OR product.cat_lv2_id=? ORDER BY product.created_date DESC ;";
		List<Product> listPro = jdbcTemplate.query(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("suppliers.id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"), rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("product.id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"), rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("product.suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}}, id, id);
		return listPro;
	}
	public List<Product> getListProByCatName(String string, int offset) {
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id WHERE categories.catChilName=? OR categories.catPrName=? ORDER BY product.created_date DESC LIMIT ?,?;";
		List<Product> listPro = jdbcTemplate.query(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("suppliers.id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"), rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("product.id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"), rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("product.suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}}, string,string, offset, Defines.ROW_COUNT);
		return listPro;
	}
	public List<Product> getListProByCatId(int id, int offset) {
		String sql="SELECT * FROM `product` INNER JOIN `suppliers` ON product.suppliers_id=suppliers.id INNER JOIN (SELECT a.id AS catLv1Id, a.name AS catPrName,a.image AS imagesPr,a.logo AS logoPr, a.parent_id AS parent_idPr, b.id AS catLv2Id, b.name AS catChilName,b.image AS imagesChil,b.logo AS logoChil, b.parent_id AS parent_idChil FROM category a, category b WHERE a.id = b.parent_id) AS categories ON product.cat_lv1_id = categories.catLv1Id AND product.cat_lv2_id = categories.catLv2Id WHERE product.cat_lv1_id=? OR product.cat_lv2_id=? ORDER BY product.created_date DESC LIMIT ?,?;";
		List<Product> listPro = jdbcTemplate.query(sql, new RowMapper<Product>() {
			@Override
			public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
				Suppliers sup = new Suppliers(rs.getInt("suppliers.id"), rs.getString("supplier_code"), rs.getString("supplier_name"), rs.getString("supplier_phone"), rs.getString("supplier_email"), rs.getString("supplier_addr"), rs.getString("tax_code"), rs.getString("notes"), rs.getTimestamp("created"),  rs.getTimestamp("updated"),  rs.getInt("user_init"), rs.getInt("user_upd"));
				Categories cat = new Categories(rs.getInt("categories.catLv1Id"), rs.getString("categories.catPrName"), rs.getString("categories.imagesPr"), rs.getString("categories.logoChil"), rs.getInt("parent_idPr"));
				Product pro = new Product(rs.getInt("product.id"), rs.getString("product_sku"), rs.getString("name"), rs.getInt("amount"), rs.getInt("quantity_sold"), rs.getInt("cost"), rs.getInt("price"), rs.getString("the_product_set_includes"), rs.getString("product_information"), rs.getString("shipping_policy"),	rs.getString("return_warranty"), rs.getString("payments"), rs.getInt("discount"), rs.getString("images"), rs.getInt("view"), rs.getInt("cat_lv1_id"), rs.getInt("cat_lv2_id"), rs.getInt("product.suppliers_id"), rs.getInt("country_id"), rs.getInt("created_at"),	rs.getInt("updated_at"), rs.getTimestamp("created_date"), rs.getInt("is_deleted"), cat, sup);
				return pro;
			}}, id, id,offset, Defines.ROW_COUNT);
		return listPro;
	}
}
