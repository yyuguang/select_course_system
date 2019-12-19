package com.lnzz.service.impl;

import com.lnzz.dao.ScRepository;
import com.lnzz.pojo.Sc;
import com.lnzz.service.ScService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * ClassName：ScServiceImpl
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/17 14:12
 * @Description:
 */
@Service
@Transactional
public class ScServiceImpl implements ScService {
    @Autowired
    private ScRepository scRepository;


    @Override
    public Sc saveSc(Sc sc) {
        sc.setScore(0.0);
        sc.setCreateTime(new Date());
        return scRepository.save(sc);
    }

    @Override
    public Sc getSc(Long id) {
        return scRepository.getOne(id);
    }


    @Override
    public Sc getScByCourseIdAndStudentId(Long courseId, Long studentId) {
        return scRepository.getScByCourseIdAndStudentId(courseId, studentId);
    }

    @Override
    public int deleteScByCourseIdAndStudentId(Long courseId, Long studentId) {
        int i = scRepository.deleteScByCourseIdAndStudentId(courseId, studentId);
        return i;
    }

    @Transactional
    @Override
    public int updateScoreByByCourseIdAndStudentId(Long courseId, Long studentId, Double score) {
        int i = scRepository.updateScoreByByCourseIdAndStudentId(courseId, studentId, score);
        return i;
    }

}
