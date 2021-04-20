package co.team.course.service;

import java.util.List; 

import co.team.trainer.service.TrainerVO; 

public interface CourseService {
	public List<Course_Info_VO> getCourse(Course_Info_VO vo);
	
	public List<Course_TuitionVO> getCourse_Tuition(Course_TuitionVO vo);
	
	public int proDel(Course_Info_VO vo);
	
	public int proDel(Course_TuitionVO tvo);
	
	public void productInsert(Course_Info_VO vo);

	public void productInserts(Course_Info_VO vo, List<Course_TuitionVO> list);

	public void productUpdate(Course_Info_VO vo);

	public void productUpdates(Course_Info_VO vo, List<Course_TuitionVO> list);
	
	public Course_Info_VO  get1Course(Course_Info_VO vo);
	

		
	
	
	
	
}
