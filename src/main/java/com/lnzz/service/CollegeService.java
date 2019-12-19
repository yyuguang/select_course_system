package com.lnzz.service;

import com.lnzz.pojo.College;

import java.util.List;

/**
 * ClassName：CollegeService
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 17:38
 * @Description:
 */
public interface CollegeService {
    College saveCollege(College college);

    List<College> listCollege();

    College updateCollege(Long id, College college);

    College getCollege(Long id);


}
