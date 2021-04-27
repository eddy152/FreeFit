package co.team.security.service;

import java.util.List;

import co.team.admin.service.AdminVO;
import co.team.security.service.security.UserDbService;
import co.team.security.service.security.UserEntity;
import co.team.security.service.security.UserRoleEntity;
import co.team.trainer.service.TrainerVO;
import co.team.user.service.UserVO;

public interface MemberService extends UserDbService {
	public UserEntity getUser(String loginUserId);
	public List<UserRoleEntity> getUserRoles(String loginUserId);

	public List<AdminVO> getAdmin(AdminVO member);//전체조회
	public AdminVO getProfileInfo(String id);//프로필정보 단건조회(id)
	public String getOwnerId(AdminVO member);//아이디만 조회
	public String comparePw(AdminVO member);
	public void addOwnerMember(AdminVO member); //회원가입
	public void addTrainerMember(TrainerVO member);//트레이너가입
	public void addUserMember(UserVO member); //유저가입
	public String userCheck(String loginUserId) throws NullPointerException;//유저아이디체크
	public String rememberId(MemberVO member) throws NullPointerException;
	public MemberVO getAllBy(MemberVO vo) throws NullPointerException;
	public int setPassword(MemberVO vo);
	public Integer updateOwner(AdminVO member);
	
	public List<AdminVO> ownerFitnesses(AdminVO member); //id로 거르는 리스트
	public AdminVO selectedFitness(AdminVO member); // fitness_id 단건조회
	public Integer addFitness(AdminVO member);
	public Integer updateFitness(AdminVO member);
	public Integer deleteFitness(AdminVO member);
	public List<AdminVO> ownerMemberships(AdminVO member); //멤버쉽 id로 거름
	public List<AdminVO> ownerPayments(String id); 
	public AdminVO selectedMembership(AdminVO member); //멤버십 mem_reg_id 로 거름
	
	public int getPayment(String admin_id);
	public void newPayment(KakaoPayApprovalVO vo);
	
}