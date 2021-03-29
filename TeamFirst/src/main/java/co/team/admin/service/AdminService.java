package co.team.admin.service;

import java.util.List;

public interface AdminService {
	public List<AdminVO> getAdmin(AdminVO vo);
	public int insertAdmin(AdminVO vo);
}
