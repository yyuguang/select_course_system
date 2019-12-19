package com.lnzz.service;

import com.lnzz.pojo.Grade;

import java.util.List;

/**
 * ClassName：ClassService
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/14 14:24
 * @Description:
 */
public interface GradeService {
    Grade saveGrade(Grade grade);

    List<Grade> listGrade();

    Grade updateGrade(Long id, Grade grade);

    Grade getGrade(Long id);

    /**
     * 查询专业下所属班级
     * @param id
     * @return
     */
    List<Grade> findAllByMajor_Id(Long id);
}
