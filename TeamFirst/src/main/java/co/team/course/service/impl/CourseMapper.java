package co.team.course.service.impl;

import java.util.List;

import co.team.course.service.Course_Info_VO;
import co.team.course.service.Course_TuitionVO;

public interface CourseMapper {

	public List<Course_Info_VO> getCourse(Course_Info_VO vo);
	
	public List<Course_TuitionVO> getCourse_Tuition(Course_TuitionVO vo);
	
	public int productInsert(Course_Info_VO vo);
	
	public int productInserts(Course_TuitionVO tvo);
	
	public int productUpdate(Course_Info_VO vo);

	public int productUpdates(Course_TuitionVO tvo);
	
	public int proDel(Course_Info_VO vo);
	
	public int proDel(Course_TuitionVO tvo);
	
	public Course_Info_VO  get1Course(Course_Info_VO vo);
	
	
}
