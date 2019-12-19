package com.lnzz.dao;

import com.lnzz.pojo.Major;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

/**
 * ClassName：MajorRepository
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/13 17:50
 * @Description:
 */
public interface MajorRepository extends JpaRepository<Major, Long> {
    List<Major> findAllByCollege_Id(Long id);
}
