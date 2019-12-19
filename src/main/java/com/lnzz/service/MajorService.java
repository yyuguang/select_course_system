package com.lnzz.service;

import com.lnzz.pojo.Major;

import java.util.List;

/**
 * ClassName：MajorService
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/13 17:52
 * @Description:
 */
public interface MajorService {
    Major saveMajor(Major major);

    List<Major> listMajor();

    Major updateMajor(Long id, Major major);

    Major getMajor(Long id);

    /**
     * 各院系所属专业
     * @param id
     * @return
     */
    List<Major> findAllByCollege_Id(Long id);
}
