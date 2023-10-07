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
public class Suppliers {
	private int id;	
	private String supplier_code;
	private String supplier_name;
	private String supplier_phone;
	private String supplier_email;
	private String supplier_addr;
	private String tax_code;
	private String notes;
	private Timestamp created;
	private Timestamp updated;
	private int user_init;
	private int user_upd;
}
