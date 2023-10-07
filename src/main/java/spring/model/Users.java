package spring.model;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString

@Entity
@Table(name = "user")
public class Users {
	private int id;
	private String username;
	private String password;
	private String name;
	private String email;
	private String phone;
	private String address;
	private String city;
	private String created_date;
	private String update_date;
	private String update_at;
	private int status;
	private int enable;
	private int role_id;
//	private Roles roles;

}
