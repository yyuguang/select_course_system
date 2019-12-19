package com.lnzz.controller;

import com.lnzz.pojo.College;
import com.lnzz.pojo.Major;
import com.lnzz.service.CollegeService;
import com.lnzz.service.MajorService;
import com.lnzz.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * ClassName：MajorController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/13 17:56
 * @Description:
 */
@Controller
@RequestMapping("/major")
public class MajorController {
    @Autowired
    private MajorService majorService;
    @Autowired
    private CollegeService collegeService;

    @GetMapping("listMajor")
    public String listMajor(Long collegeId, Model model) {
        List<Major> majorList;
        if (collegeId == null) {
            majorList = majorService.listMajor();

        } else {
            majorList = majorService.findAllByCollege_Id(collegeId);
        }
        model.addAttribute("majorList", majorList);
        List<College> collegeList = collegeService.listCollege();
        model.addAttribute("collegeList", collegeList);
        return "major-info";
    }


    @PostMapping("/save")
    @ResponseBody
    public Result saveMajor(Major major) {
        Major m = majorService.saveMajor(major);
        if (m == null) {
            return new Result(false, "新增失败");
        }
        return new Result(true, "新增成功");
    }

    @GetMapping("/getMajor")
    @ResponseBody
    public Result getMajor(Long id) {
        Major major = majorService.getMajor(id);
        if (major == null) {
            return new Result(false, "查询无数据");
        }

        return new Result(true, "查询成功", major);
    }

    @PostMapping("/updateMajor")
    @ResponseBody
    public Result updateMajor(Long id, Major major) {
        Major m = majorService.updateMajor(id, major);
        if (m == null) {
            return new Result(false, "更新失败");
        }
        return new Result(true, "更新成功");
    }

    @GetMapping("/findAllByCollegeId")
    @ResponseBody
    public Result findAllByCollegeId(Long id) {
        List<Major> majorList = majorService.findAllByCollege_Id(id);
        if (majorList.isEmpty()) {
            return new Result(false, "该院系下暂无专业");
        }
        return new Result(true, "查询成功", majorList);
    }
}