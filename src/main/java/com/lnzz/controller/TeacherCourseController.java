package com.lnzz.controller;

import com.lnzz.pojo.Course;
import com.lnzz.pojo.CourseType;
import com.lnzz.pojo.Sc;
import com.lnzz.pojo.Student;
import com.lnzz.service.CourseService;
import com.lnzz.service.CourseTypeService;
import com.lnzz.service.ScService;
import com.lnzz.service.StudentService;
import com.lnzz.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * ClassName：TeacherCourseController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/16 16:25
 * @Description:
 */
@Controller
@RequestMapping("/teacher")
public class TeacherCourseController {
    @Autowired
    private CourseService courseService;
    @Autowired
    private CourseTypeService courseTypeService;
    @Autowired
    private StudentService studentService;
    @Autowired
    private ScService scService;

    @GetMapping("/listTeacherCourse")
    public String listTeacherCourse(Model model, HttpSession session,HttpServletRequest request) {
        Student student = (Student) session.getAttribute("LOGIN_USER");
        List<Course> teacherList = courseService.findAllByCourseTeacher_StuId(student.getStuId());
        model.addAttribute("teacherList", teacherList);
        model.addAttribute("student", student);

        List<CourseType> courseTypeList = courseTypeService.listCourseType();
        model.addAttribute("courseTypeList", courseTypeList);

        String selectCourseId = request.getParameter("selectCourseId");
        if(selectCourseId !=null){
            Course course = courseService.getCourse(Long.parseLong(selectCourseId));
            session.setAttribute("COURSE",course);
            List<Student> studentList = studentService.findStudentSelectCourseByCourseId(Long.parseLong(selectCourseId));
            model.addAttribute("course",course);
            model.addAttribute("studentList",studentList);
        }

        return "teacher-course";
    }

    @PostMapping("/save")
    @ResponseBody
    public Result save(@RequestBody Course course) {
        Course c = courseService.saveCourse(course);
        if (c == null) {
            return new Result(false, "新增失败");
        }
        return new Result(true, "新增成功");
    }

    @PostMapping("/getTeacherCourseById")
    @ResponseBody
    public Result getTeacherCourseById(Long id) {
        Course course = courseService.getCourse(id);
        if (course == null) {
            return new Result(false, "查询失败");
        }
        return new Result(true, "查询成功", course);
    }

    @PostMapping("/updateTeacherCourse")
    @ResponseBody
    public Result updateTeacherCourse(Long id, Course course) {
        int i = courseService.updateTeacherCourse(id, course);
        if (i == 0) {
            return new Result(false, "更新失败");
        }
        return new Result(true, "更新成功");
    }

    @GetMapping("/getScById")
    @ResponseBody
    public Result getScById(Sc sc, HttpSession session) {
        Course course = (Course) session.getAttribute("COURSE");
        Sc scByCourseIdAndStudentId = scService.getScByCourseIdAndStudentId(course.getCourseId(), sc.getStudentId());
        if (scByCourseIdAndStudentId == null) {
            return new Result(false, "暂无数据");
        }
        return new Result(true, "查询成功", scByCourseIdAndStudentId);
    }

    @PostMapping("/updateScoreByByCourseIdAndStudentId")
    @ResponseBody
    public Result updateScoreByByCourseIdAndStudentId(Sc sc, HttpSession session){
        Course course = (Course) session.getAttribute("COURSE");
        int i = scService.updateScoreByByCourseIdAndStudentId(course.getCourseId(), sc.getStudentId(),sc.getScore());
        if(i == 0){
            return new Result(false, "更新失败");
        }
        return new Result(true, "更新成功");
    }

}
