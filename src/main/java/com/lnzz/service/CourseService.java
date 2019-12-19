package com.lnzz.service;

import com.lnzz.pojo.Course;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

/**
 * ClassName：CourseService
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/16 16:43
 * @Description:
 */
public interface CourseService {
    Course saveCourse(Course course);

    List<Course> listCourse();

    Course getCourse(Long id);

    List<Course> findAllByCourseTeacher_StuId(Long id);

    int updateTeacherCourse(Long id,Course course);

    /**
     * 查询学生已选所有课程
     * @param id
     * @return
     */
    List<Course> findStudentSelectCourseByStudentId(Long id);

    /**
     * 课程名称类型条件筛选
     * @param id
     * @return
     */
    List<Course> findAllByCourseType_Id(Long id);

}
