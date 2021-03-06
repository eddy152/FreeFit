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
	private String role_name;
	private Integer fitness_id;
	
	private String dat;
	private String day;
	private String week;
	private String sysdate;
	private String cnt;
	
	private String food_name;
	private String food_cnt;
	private String food_no;
	private String category;
	private String gram;
	
	private String total_calorie;
	private String user_id;
	private String diet_comment;
	private String comment_no;
	private String detail_content;
	
	private String detail_food;
	private String detail_count;
	private String detail_calorie;
}
