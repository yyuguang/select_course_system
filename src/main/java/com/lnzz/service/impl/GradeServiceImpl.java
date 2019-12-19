package com.lnzz.service.impl;

import com.lnzz.dao.GradeRepository;
import com.lnzz.pojo.Grade;
import com.lnzz.pojo.Major;
import com.lnzz.service.GradeService;
import com.lnzz.util.NotFoundException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * ClassName：ClassServiceImpl
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/14 14:24
 * @Description:
 */
@Service
public class GradeServiceImpl implements GradeService {
    @Autowired
    private GradeRepository gradeRepository;


    @Override
    public Grade saveGrade(Grade grade) {
        grade.setCreateTime(new Date());
        return gradeRepository.save(grade);
    }

    @Override
    public List<Grade> listGrade() {
        return gradeRepository.findAll();
    }

    @Override
    public Grade updateGrade(Long id, Grade grade) {
        Grade g = gradeRepository.getOne(id);
        grade.setCreateTime(g.getCreateTime());
        grade.setCollege(g.getCollege());
        grade.setMajor(g.getMajor());
        if (g == null) {
            throw new NotFoundException("不存在该条记录");
        }
        BeanUtils.copyProperties(grade,g);
        return gradeRepository.save(g);
    }

    @Override
    public Grade getGrade(Long id) {
        return gradeRepository.getOne(id);
    }

    @Override
    public List<Grade> findAllByMajor_Id(Long id) {
        return gradeRepository.findAllByMajor_Id(id);
    }

}
