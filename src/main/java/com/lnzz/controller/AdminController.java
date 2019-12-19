package com.lnzz.controller;

import com.lnzz.pojo.College;
import com.lnzz.pojo.Course;
import com.lnzz.pojo.CourseType;
import com.lnzz.pojo.Student;
import com.lnzz.service.CollegeService;
import com.lnzz.service.CourseService;
import com.lnzz.service.CourseTypeService;
import com.lnzz.service.StudentService;
import com.lnzz.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * ClassName：AdminController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/19 13:31
 * @Description:
 */
@Controller
@RequestMapping("/admin")
public class AdminController {
    @Autowired
    private StudentService studentService;
    @Autowired
    private CollegeService collegeService;
    @Autowired
    private CourseService courseService;
    @Autowired
    private CourseTypeService courseTypeService;

    @GetMapping("/getAllStudents")
    public String getAllStudents(Model model, HttpServletRequest request) {
        List<College> collegeList = collegeService.listCollege();
        model.addAttribute("collegeList", collegeList);
        List<Student> studentList;
        String collegeId = request.getParameter("collegeId");
        if (collegeId != null) {
            studentList = studentService.findAllByStuTypeAndCollege_Id(1, Long.parseLong(collegeId));
        } else {
            studentList = studentService.findAllByStuType(1);
        }
        model.addAttribute("studentList", studentList);
        return "admin-student";
    }

    @GetMapping("/getAllTeachers")
    public String getAllTeachers(Model model, HttpServletRequest request) {
        List<College> collegeList = collegeService.listCollege();
        model.addAttribute("collegeList", collegeList);
        List<Student> studentList;
        String collegeId = request.getParameter("collegeId");
        if (collegeId != null) {
            studentList = studentService.findAllByStuTypeAndCollege_Id(2, Long.parseLong(collegeId));
        } else {
            studentList = studentService.findAllByStuType(2);
        }
        model.addAttribute("studentList", studentList);
        return "admin-teacher";
    }

    @GetMapping("/getAllCourses")
    public String getAllCourses(Model model, HttpServletRequest request) {

        List<CourseType> courseTypeList = courseTypeService.listCourseType();
        model.addAttribute("courseTypeList", courseTypeList);
        String courseTypeId = request.getParameter("courseTypeId");
        List<Course> courseList;
        if(courseTypeId != null){
            courseList = courseService.findAllByCourseType_Id(Long.parseLong(courseTypeId));
        }else{
            courseList = courseService.listCourse();
        }
        model.addAttribute("courseList",courseList);

        return "admin-course";
    }

    @PostMapping("/getStudentById")
    @ResponseBody
    public Result getStudentById(Long stuId) {
        Student student = studentService.getStudent(stuId);
        if (student == null) {
            return new Result(false, "查询失败");
        }
        return new Result(true, "查询成功", student);
    }
}
