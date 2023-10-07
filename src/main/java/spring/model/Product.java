package spring.model;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Product {
	private int id;
	private String product_sku;
	private String name;
	private int amount	;
	private int quantity_sold	;	
	private int cost	;
	private int price	;
	private String the_product_set_includes	;
	private String product_information	;	
	private String shipping_policy		;
	private String return_warranty	;
	private String payments	;
	private int discount	;
	private String images	;
	private int view	;
	private int cat_lv1_id	;
	private int cat_lv2_id	;
	private int suppliers_id	;
	private int country_id	;
	private int created_at	;
	private int updated_at	;	
	private Timestamp created_date;
	private int is_deleted ;
	private Categories categories;
	private Suppliers suppliers;
}
