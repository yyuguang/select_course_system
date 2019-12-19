package com.lnzz.service.impl;

import com.lnzz.dao.CollegeRepository;
import com.lnzz.pojo.College;
import com.lnzz.service.CollegeService;
import com.lnzz.util.NotFoundException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * ClassName：CollegeServiceImpl
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 17:38
 * @Description:
 */
@Service
public class CollegeServiceImpl implements CollegeService {
    @Autowired
    private CollegeRepository collegeRepository;

    @Transactional
    @Override
    public College saveCollege(College college) {
        college.setCreateTime(new Date());
        return collegeRepository.save(college);
    }

    @Override
    public List<College> listCollege() {
        return collegeRepository.findAll();
    }

    @Override
    public College updateCollege(Long id, College college){
        College c = collegeRepository.getOne(id);
        college.setCreateTime(c.getCreateTime());
        if (c == null) {
            throw new NotFoundException("不存在该条记录");
        }

        BeanUtils.copyProperties(college, c);

        return collegeRepository.save(c);
    }

    @Override
    public College getCollege(Long id) {
        return collegeRepository.getOne(id);
    }
}
