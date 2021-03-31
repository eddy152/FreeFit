package co.team.board.service.impl;

import java.util.List;

import co.team.board.service.UserQnaBoardVO;

public interface UserQnaBoardMapper {

	
	//단건조회
    public UserQnaBoardVO getUserQnaBoard(UserQnaBoardVO vo);

    //전체조회
    public List<UserQnaBoardVO> getUserQnaBoardList(UserQnaBoardVO vo);
    
    //등록
    public int insertUserQnaBoard(UserQnaBoardVO vo);
    
    //수정
    public int updateUserQnaBoard(UserQnaBoardVO vo);
    
    //삭제
    public int deleteUserQnaBoad(UserQnaBoardVO vo);
}
