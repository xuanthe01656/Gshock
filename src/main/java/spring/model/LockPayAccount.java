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
public class LockPayAccount {
	private int id;
	private int user_id;
	private String name;
	private int surplus;
	private Timestamp created_date;
	private Users users;
}
