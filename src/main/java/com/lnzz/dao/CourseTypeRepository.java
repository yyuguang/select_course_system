package com.lnzz.dao;

import com.lnzz.pojo.CourseType;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * ClassName：CourseTypeRepository
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/16 17:10
 * @Description:
 */
public interface CourseTypeRepository extends JpaRepository<CourseType,Long> {
}
