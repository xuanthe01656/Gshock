package spring.model;

import java.sql.Timestamp;

import javax.persistence.Entity;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
@Data
@AllArgsConstructor
@NoArgsConstructor

@Entity
@Table(name = "admin")
public class Admin {
	private int id;
	private String username;
	private String password;
	private String remember_token;
	private String fullname;
	private String email;
	private String phone;
	private String address;
	private String images;
	private Timestamp created_date;
	private int role_id;
	private int enable;
	private Roles role;
	
}
