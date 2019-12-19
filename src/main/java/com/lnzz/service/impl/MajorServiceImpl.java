package com.lnzz.service.impl;

import com.lnzz.dao.MajorRepository;
import com.lnzz.pojo.Major;
import com.lnzz.service.MajorService;
import com.lnzz.util.NotFoundException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * ClassName：MajorServiceImpl
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/13 17:53
 * @Description:
 */
@Service
public class MajorServiceImpl implements MajorService {
    @Autowired
    private MajorRepository majorRepository;
    @Override
    public Major saveMajor(Major major) {
        major.setCreateTime(new Date());
        return majorRepository.save(major);
    }

    @Override
    public List<Major> listMajor() {
        return majorRepository.findAll();

    }

    @Override
    public Major updateMajor(Long id, Major major) {
        Major m = majorRepository.getOne(id);
        major.setCreateTime(m.getCreateTime());
        major.setCollege(m.getCollege());
        if(m==null){
            throw new NotFoundException("不存在该条记录");
        }
        BeanUtils.copyProperties(major, m);
        return majorRepository.save(m);

    }

    @Override
    public Major getMajor(Long id) {
        return majorRepository.getOne(id);
    }

    @Override
    public List<Major> findAllByCollege_Id(Long id) {
        return majorRepository.findAllByCollege_Id(id);
    }
}
