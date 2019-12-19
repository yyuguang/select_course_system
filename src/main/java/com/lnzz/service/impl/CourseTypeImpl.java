package com.lnzz.service.impl;

import com.lnzz.dao.CourseTypeRepository;
import com.lnzz.pojo.CourseType;
import com.lnzz.service.CourseTypeService;
import com.lnzz.util.NotFoundException;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

/**
 * ClassName：CourseTypeImpl
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/16 17:11
 * @Description:
 */
@Service
public class CourseTypeImpl implements CourseTypeService {
    @Autowired
    private CourseTypeRepository courseTypeRepository;
    @Override
    public CourseType saveCourseType(CourseType courseType) {
        courseType.setCreateTime(new Date());
        return courseTypeRepository.save(courseType);
    }

    @Override
    public List<CourseType> listCourseType() {
        return courseTypeRepository.findAll();
    }

    @Override
    public CourseType updateCourseType(Long id, CourseType courseType) {
        CourseType c = courseTypeRepository.getOne(id);
        courseType.setCreateTime(c.getCreateTime());
        if (c == null) {
            throw new NotFoundException("不存在该条记录");
        }

        BeanUtils.copyProperties(courseType, c);

        return courseTypeRepository.save(c);
    }

    @Override
    public CourseType getCourseType(Long id) {
        return courseTypeRepository.getOne(id);
    }
}
