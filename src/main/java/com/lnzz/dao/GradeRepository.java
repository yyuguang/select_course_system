package com.lnzz.dao;

import com.lnzz.pojo.Grade;
import com.lnzz.pojo.Major;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * ClassName：ClassRepository
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/14 14:24
 * @Description:
 */
public interface GradeRepository extends JpaRepository<Grade, Long> {

    List<Grade> findAllByMajor_Id(Long id);


}
