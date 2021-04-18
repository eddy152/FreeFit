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
	private String tel_number; //전화번호
	private String zipcode; //우편번호
	private String address; //주소
	private String address_detail; //주소상세

	private Integer all_point; //총 포인트
	private String fitness_name; //헬스클럽 이름
	private Integer business_number; //사업자번호
	
	private String membership_name; //멤버쉽이름
	private Date membership_date; //멤버쉽시작날짜
	private Date membership_end; //멤버쉽끝나는날짜
	private Integer dday; //멤버쉽남은시간
	
	
	
}
