package co.team.admin.service;


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

	private String admin_id; //어드민아이디
	private String password; //비밀번호
	private String name; //이름
	private String phone_number; //폰번호
	private String tel_number; //전화번호
	private String zipcode; //우편번호
	private String address; //주소
	private String address_detail; //주소상세
	private int role; //권한 (00:admin, 01:user(관장) session에 추가할 값
	private int all_point; //총 포인트
	private String fitness_name; //헬스클럽 이름
	private int business_number; //사업자번호
}
