package com.lnzz.controller;

import com.lnzz.pojo.CourseType;
import com.lnzz.service.CourseTypeService;
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
 * ClassName：CourseTypeController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/16 17:14
 * @Description:
 */
@Controller
@RequestMapping("/courseType")
public class CourseTypeController {
    @Autowired
    private CourseTypeService courseTypeService;

    @GetMapping("/listCourseType")
    public String listCourseType(Model model) {
        List<CourseType> courseTypeList = courseTypeService.listCourseType();
        model.addAttribute("courseTypeList", courseTypeList);
        return "course-type";
    }
    @PostMapping("/save")
    @ResponseBody
    public Result saveCourseType(CourseType courseType) {
        CourseType c = courseTypeService.saveCourseType(courseType);
        if (c == null) {
            return new Result(false, "新增失败");
        }
        return new Result(true, "新增成功");
    }

    @GetMapping("/getCourseType")
    @ResponseBody
    public Result getCourseType(Long id) {
        CourseType courseType = courseTypeService.getCourseType(id);
        if (courseType == null) {
            return new Result(false, "查询无数据");
        }
        return new Result(true, "查询成功", courseType);
    }

    @GetMapping("/findAllCourseType")
    @ResponseBody
    public Result findAllCourseType(){
        List<CourseType> courseTypeList = courseTypeService.listCourseType();
        if(courseTypeList.isEmpty()){
            return new Result(false, "暂无分类数据");
        }
        return new Result(true, "查询成功", courseTypeList);
    }

    @PostMapping("/updateCourseType")
    @ResponseBody
    public Result updateCourseType(Long id, CourseType courseType) {
        CourseType c = courseTypeService.updateCourseType(id, courseType);
        if (c == null) {
            return new Result(false, "更新失败");
        }
        return new Result(true, "更新成功");
    }
}

