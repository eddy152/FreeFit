package co.team.spring.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.spring.service.DeptService;
import co.team.spring.service.DeptVO;

@Service
public class DeptServiceImpl implements DeptService {
@Autowired DeptMapper dao;
	@Override
	public DeptVO getDept(DeptVO vo) {
		return dao.getDept(vo);
	}

}
