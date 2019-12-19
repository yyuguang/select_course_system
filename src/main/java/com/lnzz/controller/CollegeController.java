package com.lnzz.controller;

import com.lnzz.pojo.College;
import com.lnzz.service.CollegeService;
import com.lnzz.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * ClassName：CollegeController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 17:40
 * @Description:
 */
@Controller
@RequestMapping("/college")
public class CollegeController {
    @Autowired
    private CollegeService collegeService;

    @GetMapping("/listCollege")
    public String listCollege(Model model) {
        List<College> collegeList = collegeService.listCollege();
        model.addAttribute("collegeList", collegeList);
        return "college-info";
    }

    @PostMapping("/save")
    @ResponseBody
    public Result saveCollege(College college) {
        College c = collegeService.saveCollege(college);
        if (c == null) {
            return new Result(false, "新增失败");
        }
        return new Result(true, "新增成功");
    }

    @GetMapping("/getCollege")
    @ResponseBody
    public Result getCollege(Long id) {
        College college = collegeService.getCollege(id);
        if (college == null) {
            return new Result(false, "查询无数据");
        }
        return new Result(true, "查询成功", college);
    }

    @GetMapping("/findAllCollege")
    @ResponseBody
    public Result findAllCollege(){
        List<College> collegeList = collegeService.listCollege();
        if(collegeList.isEmpty()){
            return new Result(false, "暂无院系数据");
        }
        return new Result(true, "查询成功", collegeList);
    }

    @PostMapping("/updateCollege")
    @ResponseBody
    public Result updateCollege(Long id, College college) {
        College c = collegeService.updateCollege(id, college);
        if (c == null) {
            return new Result(false, "更新失败");
        }
        return new Result(true, "更新成功");
    }
}
