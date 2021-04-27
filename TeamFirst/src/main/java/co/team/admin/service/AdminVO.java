package co.team.admin.service;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


//admin vo

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class AdminVO {

	private String id; //어드민아이디
	private String password; //비밀번호
	private String newPW;
	private String name; //이름
	private String email; //이메일
	private String phone_number; //폰번호
	private Integer all_point; //총 포인트
	private Integer business_number; //사업자번호
	
	
	
	private String fitness_name; //헬스클럽 이름
	private String tel_number; //전화번호
	private String zipcode; //우편번호
	private String address; //주소
	private String address_detail; //주소상세
	
	
	private Integer fitness_id; //피트니스 테이블 아이디
	private String admin_id;
	private String mem_reg_id;
	private String membership_no;
	private String membership_name; //멤버쉽이름
	private String membership_start;
	private String membership_end;
	private Integer dday; //멤버쉽남은시간
	private String membership_price;
	private Integer active;
	
	private Integer payment_number;
	private String item_name;
	private String payment_date;
	private Integer amount;
	
	
}
