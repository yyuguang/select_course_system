package com.lnzz.service;

import com.lnzz.pojo.CourseType;
import java.util.List;

/**
 * ClassName：CourseTypeService
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/16 17:11
 * @Description:
 */
public interface CourseTypeService {
    CourseType saveCourseType(CourseType courseType);

    List<CourseType> listCourseType();

    CourseType updateCourseType(Long id, CourseType courseType);

    CourseType getCourseType(Long id);

}
