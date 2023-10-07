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
public class Notification {
	private int id;
	private String notification_name;
	private String position;
	private Timestamp created_date;
	private int status;
}
