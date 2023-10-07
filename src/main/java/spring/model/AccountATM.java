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
public class AccountATM {
	private int id;
	private int user_id;
	private String name;
	private String bank_name;
//	private String sort_name;
	private String bank_branch;
	private String account_number;
	private Timestamp created_date;
}
