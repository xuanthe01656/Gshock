package spring.model;

import java.sql.Timestamp;

import com.itextpdf.text.Phrase;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;
@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class OrderDetail {
	private int id;
	private String order_code;
	private String fullname;
	private String email;
	private String phone;
	private String shipping_address;
	private String product_id;
	private String product_sku;
	private String product_detail;
	private String color;
	private String size;
	private int qty;
	private float price;
	private String Images;
	private float subtotal;
	private float discount;
	private float transports;
	private int tax;
	private float total;
	private String payment_methods;
	private String ship_type;
	private int order_user;
	private Timestamp order_date;
	private int status;	
	private int status_payment;
}
