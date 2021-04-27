package co.team.admin.service.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import co.team.admin.service.AdminVO;
import co.team.security.service.KakaoPayApprovalVO;

@Repository
public interface AdminMapper {
//	public List<AdminVO> getAdmin(AdminVO vo);
//	public int insertAdmin(AdminVO vo);
	public List<AdminVO> getAdmin(AdminVO member);

	public AdminVO getProfileInfo(String id); // 아이디 받아서 프로필정보뿌려줌

	public String getOwnerId(AdminVO member); // 아이디 주고 admin단건조회

	public String comparePw(AdminVO member);// 비번비교

	public List<AdminVO> ownerFitnesses(AdminVO member);// 피트니스리스트(id)

	public AdminVO selectedFitness(AdminVO member);// 피트니스단건조회(fitness_id)

	public void addOwnerMember(AdminVO member); // 회원가입

	public Integer updateOwner(AdminVO member); // 정보 변경

	public Integer addFitness(AdminVO member);// 피트니스 등록

	public Integer updateFitness(AdminVO member); // 피트니스 업데이트

	public Integer deleteFitness(AdminVO member); // 피트니스 삭제

	public List<AdminVO> ownerMemberships(AdminVO member); // 멤버쉽 id로 거름
	public List<AdminVO> ownerPayments(String id); // 멤버쉽 id로 거름
	public AdminVO selectedMembership(AdminVO member); // 멤버십 mem_reg_id 로 거름

	public int getPayment(String admin_id);

	public void newPayment(KakaoPayApprovalVO vo);
	
}
