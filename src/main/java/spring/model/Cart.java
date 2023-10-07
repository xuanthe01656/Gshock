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
public class Cart {
	private int id;
	private int product_id;
	private String product_sku;
	private String product_name;
	private int amount;
	private int quantity_sold;
	private int qty;
	private int price;
	private String images;
	private int user_id;
	private String ip;
	private Timestamp created_date;
}
