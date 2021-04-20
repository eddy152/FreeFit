package co.team.course.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import co.team.course.service.CourseService;
import co.team.course.service.Course_Info_VO;
import co.team.course.service.Course_TuitionVO;

@Service
public class CourseImpl implements CourseService {

	@Autowired
	CourseMapper courseMapper;

	@Override
	public List<Course_Info_VO> getCourse(Course_Info_VO vo) {
		return courseMapper.getCourse(vo);
	}

	@Override
	public int proDel(Course_Info_VO vo) {

		return courseMapper.proDel(vo);
	}

	@Override
	public List<Course_TuitionVO> getCourse_Tuition(Course_TuitionVO vo) {
		return null;
	}

	@Override
	public void productInsert(Course_Info_VO vo) {
		courseMapper.productInsert(vo);
	}

	@Override
	public void productInserts(Course_Info_VO vo, List<Course_TuitionVO> list) {
		String course_no = vo.getCourse_no();
		int unit_method = vo.getUnit_method_get();

		for (Course_TuitionVO fvo : list) {
			fvo.setUnit_method(unit_method);
			fvo.setCourse_no(course_no);
			courseMapper.productInserts(fvo);
		}
	}

	@Override
	public int proDel(Course_TuitionVO tvo) {

		return courseMapper.proDel(tvo);
	}

	//수정
	@Override
	public void productUpdates(Course_Info_VO vo, List<Course_TuitionVO> list) {
		String course_no = vo.getCourse_no();
		int unit_method = vo.getUnit_method_get();

		for (Course_TuitionVO fvo : list) {
			fvo.setUnit_method(unit_method);
			fvo.setCourse_no(course_no);
			courseMapper.productUpdates(fvo);
			}

	}

	@Override
	public void productUpdate(Course_Info_VO vo) {
		courseMapper.productUpdate(vo);
	}

	@Override
	public Course_Info_VO get1Course(Course_Info_VO vo) {
			
		return courseMapper.get1Course(vo);
	}

}
