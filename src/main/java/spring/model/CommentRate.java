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
public class CommentRate {
	private int id;
	private int product_id;
	private String comment;
	private String name;
	private String email;
	private String phone;
	private int like_comment;
	private String ip_like;
	private String id_user_like;
	private String images;
	private String rate;
	private String comment_at;
	private Timestamp comment_date;
	private int parent_id;	

}
