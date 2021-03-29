package co.team.admin.service.impl;

import java.util.List;

import org.springframework.ui.Model;

import co.team.admin.service.AdminVO;


public interface AdminMapper {
	public List<AdminVO> getAdmin(AdminVO vo);
	public int insertAdmin(AdminVO vo);
}
