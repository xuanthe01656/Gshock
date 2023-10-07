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
public class AccountATMAdmin {
	private int id;
	private int id_admin;
	private String name;
	private String bank_name;
	private String account_number;
	private String imgQr;
	private Timestamp created_date;
}
