package co.team.admin.service.impl;

import org.springframework.stereotype.Repository;

import co.team.admin.service.AdminVO;

@Repository
public interface AdminMapper {
//	public List<AdminVO> getAdmin(AdminVO vo);
//	public int insertAdmin(AdminVO vo);

	public void addOwnerMember(AdminVO member); // 회원가입

	public String getOwnerId(AdminVO member); // 아이디 주고 admin단건조회

	public AdminVO getProfileInfo(String id); // 아이디 받아서 프로필정보뿌려줌

	public Integer updateOwner(AdminVO member); // 정보 변경

	public String comparePw(AdminVO member);

}
