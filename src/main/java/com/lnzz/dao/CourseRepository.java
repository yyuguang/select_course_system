package com.lnzz.dao;

import com.lnzz.pojo.Course;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

/**
 * ClassName：CourseRepository
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/16 16:43
 * @Description:
 */
public interface CourseRepository extends JpaRepository<Course, Long> {

    /**
     * 查询教师个人所开全部课程
     *
     * @param id
     * @return
     */
    List<Course> findAllByCourseTeacher_StuId(Long id);


    @Modifying
    @Query(nativeQuery = true, value = " update t_course set course_cycle = ?2,course_credit=?3,course_name=?4,remarks=?5 where course_id = ?1 ")
    int updateTeacherCourse(Long id, String courseCycle, Double courseCredit, String courseName, String remarks);


    @Modifying
    @Query(nativeQuery = true, value = "select * from t_course c where c.course_id in (select s.course_id from t_sc s where s.student_id = ?1)")
    List<Course> findStudentSelectCourseByStudentId(Long id);


    List<Course> findAllByCourseType_Id(Long id);
}
