package co.team.admin.service.impl;

import org.springframework.stereotype.Repository;

import co.team.admin.service.AdminVO;

@Repository
public interface AdminMapper {
//	public List<AdminVO> getAdmin(AdminVO vo);
//	public int insertAdmin(AdminVO vo);

	public void addOwnerMember(AdminVO member);
	public String getOwnerId(AdminVO member);
}
