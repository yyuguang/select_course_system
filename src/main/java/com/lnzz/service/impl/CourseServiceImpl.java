package com.lnzz.service.impl;

import com.lnzz.dao.CourseRepository;
import com.lnzz.dao.CourseTypeRepository;
import com.lnzz.dao.StudentRepository;
import com.lnzz.pojo.Course;
import com.lnzz.pojo.CourseType;
import com.lnzz.pojo.Student;
import com.lnzz.service.CourseService;
import com.lnzz.util.NotFoundException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.PropertyDescriptor;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * ClassName：CourseServiceImpl
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/16 16:44
 * @Description:
 */
@Service
public class CourseServiceImpl implements CourseService {
    @Autowired
    private CourseRepository courseRepository;
    @Autowired
    private CourseTypeRepository courseTypeRepository;
    @Autowired
    private StudentRepository studentRepository;

    @Override
    public Course saveCourse(Course course) {
        CourseType courseType = courseTypeRepository.getOne(course.getCourseTypeId().longValue());
        Student student = studentRepository.getOne(course.getTeacherId().longValue());
        course.setCreateTime(new Date());
        course.setCourseType(courseType);
        course.setCourseTeacher(student);
        return courseRepository.save(course);
    }

    @Override
    public List<Course> listCourse() {
        return courseRepository.findAll();
    }


    @Override
    public Course getCourse(Long id) {
        return courseRepository.getOne(id);
    }

    @Override
    public List<Course> findAllByCourseTeacher_StuId(Long id) {
        return courseRepository.findAllByCourseTeacher_StuId(id);
    }

    @Transactional
    @Override
    public int updateTeacherCourse(Long id, Course course) {
        int i = courseRepository.updateTeacherCourse(id, course.getCourseCycle(), course.getCourseCredit(), course.getCourseName(), course.getRemarks());
        if (i == 0) {
            throw new RuntimeException("更新失败");
        }
        return i;
    }

    @Override
    public List<Course> findStudentSelectCourseByStudentId(Long id) {
        return courseRepository.findStudentSelectCourseByStudentId(id);
    }

    @Override
    public List<Course> findAllByCourseType_Id(Long id) {
        return courseRepository.findAllByCourseType_Id(id);
    }


}
