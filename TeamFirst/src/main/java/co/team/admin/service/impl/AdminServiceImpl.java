package co.team.admin.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.admin.service.AdminService;
import co.team.admin.service.AdminVO;

@Service
public class AdminServiceImpl implements AdminService {
@Autowired AdminMapper dao;

@Override
public List<AdminVO> getAdmin(AdminVO vo) {
	
	return dao.getAdmin(vo);
}

@Override
public int insertAdmin(AdminVO vo) {
	dao.insertAdmin(vo);
	return 0;
}

}
