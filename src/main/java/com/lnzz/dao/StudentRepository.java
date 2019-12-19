package com.lnzz.dao;

import com.lnzz.pojo.Student;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import java.util.Date;
import java.util.List;

/**
 * ClassName：StudentRepository
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 11:09
 * @Description:
 */
public interface StudentRepository extends JpaRepository<Student, Long> {
    Student findStudentByStuCodeAndStuPasswordAndRole(String stuCode, String stuPassword, Integer role);

    @Modifying
    @Query(nativeQuery = true, value = "update t_student set stu_phone = ?2,stu_email=?3,update_time=?4 where stu_id =?1 ")
    int updateStudent(Long id, String stuPhone, String stuEmail, Date updateTime);

    @Modifying
    @Query(nativeQuery = true, value = "update t_student set stu_img = ?2,update_time=?3 where stu_id =?1 ")
    int updateStudentImg(Long id, String stuImg, Date updateTime);

    @Modifying
    @Query(nativeQuery = true, value = "update t_student set stu_password = ?2,update_time=?3 where stu_id =?1 ")
    int updateStudentPassWord(Long id, String password, Date updateTime);

    @Modifying
    @Query(nativeQuery = true, value = "select * from t_student stu where stu.stu_id in (select s.student_id from t_sc s where s.course_id = ?1) ")
    List<Student> findStudentSelectCourseByCourseId(Long courseId);

    List<Student> findAllByStuType(int stuType);

    List<Student> findAllByStuTypeAndCollege_Id(int stuType,Long id);

}
