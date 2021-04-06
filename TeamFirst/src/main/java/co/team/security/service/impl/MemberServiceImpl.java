package co.team.security.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.admin.service.AdminVO;
import co.team.security.service.MemberRoleVO;
import co.team.security.service.MemberService;
import co.team.security.service.MemberVO;
import co.team.security.service.security.UserEntity;
import co.team.security.service.security.UserRoleEntity;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	@Autowired
	MemberRoleMapper memberRoleMapper;
	@Override
	public UserEntity getUser(String loginUserId) {
		System.out.println("★memberserviceimpl loginuserid=" +loginUserId);
		MemberVO member = memberMapper.getMemberById(loginUserId);
		        return new UserEntity(member.getId(), member.getPassword());
	}
	@Override
	public List<UserRoleEntity> getUserRoles(String loginUserId) {
		List<MemberRoleVO> memberRoles = memberRoleMapper.getRolesById(loginUserId);
		List<UserRoleEntity> list = new ArrayList<>();

		for (MemberRoleVO memberRole : memberRoles) {
			list.add(new UserRoleEntity(loginUserId, memberRole.getRole_name()));
		}
		return list;
	}
	@Override
	public void addAdminMember(AdminVO member, boolean b) {
		// TODO Auto-generated method stub
		
	}

	



}