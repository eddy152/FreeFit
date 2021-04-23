package co.team.gym.service;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor

	public class GymVO {
	
	private String id;// 어드민 id
	
	private String fitness_name; //헬스장이름
	
	private String address; //주소
	
	private String address_detail; //상세주소
	
	private String tel_number; 
	
	private String email; 
	
	private int business_number; // 사업자번호
	
	private String name;
	
	private String membership_name; //멤버쉽 이름
}
