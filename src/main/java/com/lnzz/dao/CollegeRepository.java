package com.lnzz.dao;

import com.lnzz.pojo.College;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * ClassName：CollegeRepository
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 17:37
 * @Description:
 */
public interface CollegeRepository extends JpaRepository<College,Long> {
}
