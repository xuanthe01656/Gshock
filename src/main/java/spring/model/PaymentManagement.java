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
public class PaymentManagement {
	private int id;
	private int id_user;
	private int id_acc_receive_money;
	private int id_acc_withdrawal_money;
	private String method;
	private float payment_amount;
	private float withdrawal_amount;
	private String content_payment;
	private Timestamp created_date;
	private int status;
	private String notes;
	private AccountATM accountATM;
	private AccountATMAdmin accountATMAdmin;
	private Users users;
	
}
