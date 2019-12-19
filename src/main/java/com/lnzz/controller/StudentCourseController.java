package com.lnzz.controller;

import com.lnzz.pojo.Course;
import com.lnzz.pojo.CourseType;
import com.lnzz.pojo.Sc;
import com.lnzz.pojo.Student;
import com.lnzz.service.CourseService;
import com.lnzz.service.CourseTypeService;
import com.lnzz.service.ScService;
import com.lnzz.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


/**
 * ClassName：StudentCourseController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/17 14:06
 * @Description:
 */
@Controller
@RequestMapping("/studentCourse")
public class StudentCourseController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private ScService scService;
    @Autowired
    private CourseTypeService courseTypeService;

    @GetMapping("/listStudentCourse")
    public String listStudentCourse(Model model,
                                    HttpSession session, HttpServletRequest request) {
        String courseTypeId = request.getParameter("courseTypeId");
        List<Course> courseList;
        if (courseTypeId != null) {
            courseList = courseService.findAllByCourseType_Id(Long.parseLong(courseTypeId));
        } else {
            courseList = courseService.listCourse();
        }
        model.addAttribute("courseList", courseList);


        //查询学生已选课程
        Student student = (Student) session.getAttribute("LOGIN_USER");
        List<Course> selectCourseList = courseService.findStudentSelectCourseByStudentId(student.getStuId());
        model.addAttribute("selectCourseList", selectCourseList);

        //查询所有课程类型
        List<CourseType> courseTypeList = courseTypeService.listCourseType();
        model.addAttribute("courseTypeList", courseTypeList);

        return "student-course";
    }

    @PostMapping("/studentSelectCourse")
    @ResponseBody
    public Result studentSelectCourse(Sc sc, HttpSession session) {
        Student student = (Student) session.getAttribute("LOGIN_USER");
        //判断年级是否对应
        Course course = courseService.getCourse(sc.getCourseId());
        if (!course.getCourseGrade().equals(student.getGrade().getClassGrade())) {
            return new Result(false, "选课失败，请选择与你对应的年级课程");
        }

        //查询是否已选择本门课程
        Sc scByCourseIdAndStudentId = scService.getScByCourseIdAndStudentId(sc.getCourseId(), student.getStuId());
        if (scByCourseIdAndStudentId != null) {
            return new Result(false, "该课程已选，请勿重复选择");
        } else {
            sc.setStudentId(student.getStuId());
            Sc s = scService.saveSc(sc);
            if (s == null) {
                return new Result(false, "选课失败");
            }
            return new Result(true, "选课成功");
        }

    }

    @PostMapping("/cancelStudentCourse")
    @ResponseBody
    public Result cancelStudentCourse(Long courseId, HttpSession session) {
        Student student = (Student) session.getAttribute("LOGIN_USER");
        int i = scService.deleteScByCourseIdAndStudentId(courseId, student.getStuId());
        if (i == 0) {
            return new Result(false, "退选失败");
        }
        return new Result(true, "退选成功");
    }

    @GetMapping("/getScById")
    @ResponseBody
    public Result getScById(Sc sc, HttpSession session) {
        Student student = (Student) session.getAttribute("LOGIN_USER");
        Sc scByCourseIdAndStudentId = scService.getScByCourseIdAndStudentId(sc.getCourseId(), student.getStuId());
        if (scByCourseIdAndStudentId == null) {
            return new Result(false, "暂无数据");
        }
        return new Result(true, "查询成功", scByCourseIdAndStudentId);
    }

}
