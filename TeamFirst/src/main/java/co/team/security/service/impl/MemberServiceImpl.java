package co.team.security.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.team.admin.service.AdminVO;
import co.team.admin.service.impl.AdminMapper;
import co.team.security.service.KakaoPayApprovalVO;
import co.team.security.service.MemberRoleVO;
import co.team.security.service.MemberService;
import co.team.security.service.MemberVO;
import co.team.security.service.security.UserEntity;
import co.team.security.service.security.UserRoleEntity;
import co.team.trainer.service.TrainerVO;
import co.team.trainer.service.impl.TrainerMapper;
import co.team.user.service.UserVO;
import co.team.user.service.impl.UserMapper_hy;

@Service
public class MemberServiceImpl implements MemberService {

	// 로그인용
	@Autowired
	MemberMapper memberMapper;
	@Autowired
	MemberRoleMapper memberRoleMapper;

	// 회원가입용
	@Autowired
	AdminMapper adminMapper;
	@Autowired
	TrainerMapper trainerMapper;
	@Autowired
	UserMapper_hy userMapper;

	// 아이디, 비밀번호 확인
	@Override
	@Transactional
	public UserEntity getUser(String loginUserId) {
		System.out.println("serviceIMPL : " + loginUserId);
		MemberVO member = memberMapper.getMemberById(loginUserId);

		return new UserEntity(member.getId(), member.getPassword());
	}

	// 권한 가져오기
	@Override
	@Transactional
	public List<UserRoleEntity> getUserRoles(String loginUserId) {
		List<MemberRoleVO> memberRoles = memberRoleMapper.getRolesById(loginUserId);
		List<UserRoleEntity> list = new ArrayList<>();

		for (MemberRoleVO memberRole : memberRoles) {
			list.add(new UserRoleEntity(loginUserId, memberRole.getRole_name()));

		}
		return list;
	}

	///////////////////////////////////////////////////////////

	// service 에서
	@Override
	@Transactional(readOnly = false)
	public void addOwnerMember(AdminVO member) {
		adminMapper.addOwnerMember(member);
		String memberId = adminMapper.getOwnerId(member);
		memberRoleMapper.addGuestRole(memberId);
		memberRoleMapper.addOwnerRole(memberId);
	}

	@Override
	@Transactional(readOnly = false)
	public void addTrainerMember(TrainerVO member) {
		trainerMapper.addTrainerMember(member);
		String memberId = trainerMapper.getTrainerId(member);
		memberRoleMapper.addTrainerRole(memberId);

	}

	@Override
	@Transactional(readOnly = false)
	public void addUserMember(UserVO member) {
		userMapper.addUserMember(member);
		String memberId = userMapper.getUserId(member);
		memberRoleMapper.addUserRole(memberId);

	}

	// 아이디 중복체크
	@Override
	@Transactional
	public String userCheck(String loginUserId) throws NullPointerException {
		String memberId = "";
		try {
			MemberVO member = memberMapper.getMemberById(loginUserId);
			memberId = member.getId();
		} catch (NullPointerException e) {

		}
		return memberId;
	}

	@Override
	@Transactional
	public String rememberId(MemberVO member) throws NullPointerException {
		String id = "";
		try {
			id = memberMapper.rememberId(member).getId();

		} catch (NullPointerException e) {

		}
		return id;
	}

	@Override
	@Transactional
	public MemberVO getAllBy(MemberVO vo) throws NullPointerException {

		vo = memberMapper.getAllBy(vo);

		return vo;
	}

	@Override
	public int setPassword(MemberVO vo) {

		return memberMapper.setPassword(vo);
	}

	@Override
	public AdminVO getProfileInfo(String id) {
		return adminMapper.getProfileInfo(id);
	}

	@Override
	public Integer updateOwner(AdminVO member) {
		return adminMapper.updateOwner(member);
	}

	@Override
	public List<AdminVO> getAdmin(AdminVO member) {
		return adminMapper.getAdmin(member);
	}

	@Override
	public String getOwnerId(AdminVO member) {
		return null;
	}

	@Override
	public List<AdminVO> ownerFitnesses(AdminVO member) {
		return adminMapper.ownerFitnesses(member);
	}

	@Override
	public AdminVO selectedFitness(AdminVO member) {
		return adminMapper.selectedFitness(member);
	}

	@Override
	public Integer addFitness(AdminVO member) {
		return adminMapper.addFitness(member);
	}

	@Override
	public Integer updateFitness(AdminVO member) {
		return adminMapper.updateFitness(member);
	}

	@Override
	public Integer deleteFitness(AdminVO member) {
		return adminMapper.deleteFitness(member);
	}

	@Override
	public String comparePw(AdminVO member) {
		return adminMapper.comparePw(member);
	}

	@Override
	public List<AdminVO> ownerMemberships(AdminVO member) {
		return adminMapper.ownerMemberships(member);
	}

	@Override
	public AdminVO selectedMembership(AdminVO member) {
		return adminMapper.selectedMembership(member);
	}

	@Override
	public int getPayment(String admin_id) {
		
		return adminMapper.getPayment(admin_id);
	}

	@Override
	public void newPayment(KakaoPayApprovalVO vo) {
		adminMapper.newPayment(vo);
		
	}

	@Override
	public List<AdminVO> ownerPayments(String id) {
		// TODO Auto-generated method stub
		return adminMapper.ownerPayments(id);
	}

}