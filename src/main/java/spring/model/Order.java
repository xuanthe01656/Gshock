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
public class Order {
	private int id;
	private String order_code;
	private String product_id;
	private String product_name;
	private int qty;
	private int total;
	private String payment_methods;
	private String ship_type;
	private String data;
	private int user_id;
	private Timestamp order_date;
	private int status;	
	private int status_payment;

}
