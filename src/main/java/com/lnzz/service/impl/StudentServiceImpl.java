package com.lnzz.service.impl;

import com.lnzz.dao.CollegeRepository;
import com.lnzz.dao.GradeRepository;
import com.lnzz.dao.MajorRepository;
import com.lnzz.dao.StudentRepository;
import com.lnzz.pojo.College;
import com.lnzz.pojo.Grade;
import com.lnzz.pojo.Major;
import com.lnzz.pojo.Student;
import com.lnzz.service.StudentService;
import com.lnzz.util.MD5Utils;
import com.lnzz.util.NotFoundException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.BeanWrapper;
import org.springframework.beans.BeanWrapperImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.beans.PropertyDescriptor;
import java.util.Date;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * ClassName：StudentServiceImpl
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 11:13
 * @Description:
 */
@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentRepository studentRepository;
    @Autowired
    private CollegeRepository collegeRepository;
    @Autowired
    private MajorRepository majorRepository;
    @Autowired
    private GradeRepository gradeRepository;

    private static final String IMG_FILE = "/static/images/user.jpg";

    @Override
    public Student findStudentByStuCodeAndStuPasswordAndRole(String stuCode, String stuPassword, Integer role) {
        Student student = studentRepository.findStudentByStuCodeAndStuPasswordAndRole(stuCode, MD5Utils.code(stuPassword), role);
        return student;
    }

    @Override
    public Student saveStudent(Student student) {

        student.setStuImg(IMG_FILE);
        student.setStuPassword(MD5Utils.code(student.getStuPassword()));
        student.setCreateTime(new Date());
        student.setRole(student.getStuType());
        College college = collegeRepository.getOne(student.getCollegeId().longValue());
        student.setCollege(college);
        Major major = majorRepository.getOne(student.getMajorId().longValue());
        student.setMajor(major);
        Grade grade = gradeRepository.getOne(student.getGradeId().longValue());
        student.setGrade(grade);
        return studentRepository.save(student);
    }

    @Override
    public List<Student> listStudent() {
        return studentRepository.findAll();
    }

    @Override
    public Student updateStudent(Long id, Student student) {
        Student s = studentRepository.getOne(id);
        student.setUpdateTime(new Date());
        if (s == null) {
            throw new NotFoundException("不存在该条记录");
        }
        BeanUtils.copyProperties(student, s, getNoNullProperties(student));
        return studentRepository.save(s);
    }

    /**
     * @param target 目标源数据
     * @return 将目标源中不为空的字段取出
     */
    private static String[] getNoNullProperties(Object target) {
        BeanWrapper srcBean = new BeanWrapperImpl(target);
        PropertyDescriptor[] pds = srcBean.getPropertyDescriptors();
        Set<String> noEmptyName = new HashSet<>();
        for (PropertyDescriptor p : pds) {
            Object value = srcBean.getPropertyValue(p.getName());
            if (value != null) noEmptyName.add(p.getName());
        }
        String[] result = new String[noEmptyName.size()];
        return noEmptyName.toArray(result);
    }


    @Override
    public Student getStudent(Long id) {
        return studentRepository.getOne(id);
    }

    @Transactional
    @Override
    public int updateStudent(Long id, String stuPhone, String stuEmail) {
        int count = studentRepository.updateStudent(id,stuPhone,stuEmail,new Date());
        return count;
    }

    @Transactional
    @Override
    public int updateStudentImg(Long id, String stuImg) {
        int i = studentRepository.updateStudentImg(id, stuImg,new Date());
        return i;
    }

    @Transactional
    @Override
    public int updateStudentPassWord(Long id, String stuPassword,String newPassword) {
        Student student = studentRepository.getOne(id);
        int count=0;
        if(student.getStuPassword().equals(MD5Utils.code(stuPassword))){
            count = studentRepository.updateStudentPassWord(id,MD5Utils.code(newPassword),new Date());
        }
        return count;
    }

    @Transactional
    @Override
    public List<Student> findStudentSelectCourseByCourseId(Long courseId) {
        return studentRepository.findStudentSelectCourseByCourseId(courseId);
    }

    @Override
    public List<Student> findAllByStuType(int stuType) {
        return studentRepository.findAllByStuType(stuType);
    }

    @Override
    public List<Student> findAllByStuTypeAndCollege_Id(int stuType, Long id) {
        return studentRepository.findAllByStuTypeAndCollege_Id(stuType,id);
    }


}
