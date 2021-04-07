package co.team.food.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class FoodVO {
	private String real_diet_no;
	private String take_date;
	private String real_diet_content;
	private String calorie;
	
	private String diet_no;
	private String trainer_id;
	private String diet_title;
	private String diet_content;
	private String reg_date;
	
	private String id;
	private String password;
	private String phone_number;
	private String name;
	private String age;
	private String height;
	private String weight;
	private String notice;
	private String gender;
	private String mem_reg_id;
}
