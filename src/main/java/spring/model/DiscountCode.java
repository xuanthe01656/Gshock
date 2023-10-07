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
public class DiscountCode {
	private int id;
	private int category_id;
	private String discount_code;
	private int reduced_price;
	private Timestamp created_date;
	private Timestamp date_end;
}
