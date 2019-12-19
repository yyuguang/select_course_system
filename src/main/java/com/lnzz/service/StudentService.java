package com.lnzz.service;

import com.lnzz.pojo.Student;

import java.util.List;

/**
 * ClassName：StudentService
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 11:12
 * @Description:
 */
public interface StudentService {
    Student findStudentByStuCodeAndStuPasswordAndRole(String stuCode,String stuPassword,Integer role);

    Student saveStudent(Student student);

    List<Student> listStudent();

    Student updateStudent(Long id, Student student);

    Student getStudent(Long id);

    /**
     * 学生/教师更新学生信息
     * @param id
     * @param stuPhone
     * @param stuEmail
     * @return
     */
    int updateStudent(Long id, String stuPhone, String stuEmail);

    /**
     * 更新头像
     * @param id
     * @param stuImg
     * @return
     */
    int updateStudentImg(Long id,String stuImg);

    /**
     * 修改密码
     * @param id
     * @param stuPassword
     * @param newPassword
     * @return
     */
    int updateStudentPassWord(Long id, String stuPassword,String newPassword);

    /**
     * 查询选择某一门课程的全部学生
     * @param courseId
     * @return
     */
    List<Student> findStudentSelectCourseByCourseId(Long courseId);

    /**
     * 管理员查看学生教师信息
     * @param stuType
     * @return
     */
    List<Student> findAllByStuType(int stuType);

    List<Student> findAllByStuTypeAndCollege_Id(int stuType,Long id);
}
