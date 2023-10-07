package spring.model;

import javax.validation.constraints.NotEmpty;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Categories {
	private int id;
	@NotEmpty
	private String name;
	private String image;
	private String logo;
	private int parent_id;
	
}
