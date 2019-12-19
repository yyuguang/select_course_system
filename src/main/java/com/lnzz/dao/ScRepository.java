package com.lnzz.dao;

import com.lnzz.pojo.Sc;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

/**
 * ClassName：ScRepository
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/17 14:10
 * @Description:
 */
public interface ScRepository extends JpaRepository<Sc, Long> {

    Sc getScByCourseIdAndStudentId(Long courseId, Long studentId);

    int deleteScByCourseIdAndStudentId(Long courseId, Long studentId);

    @Modifying
    @Query(nativeQuery = true, value = "update t_sc s set s.score = ?3 where s.student_id = ?2 and s.course_id =?1")
    int updateScoreByByCourseIdAndStudentId(Long courseId, Long studentId, Double score);
}
