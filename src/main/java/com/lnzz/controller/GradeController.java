package com.lnzz.controller;

import com.lnzz.pojo.College;
import com.lnzz.pojo.Grade;
import com.lnzz.service.CollegeService;
import com.lnzz.service.GradeService;
import com.lnzz.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * ClassName：GradeController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/14 15:01
 * @Description:
 */
@Controller
@RequestMapping("/grade")
public class GradeController {
    @Autowired
    private GradeService gradeService;
    @Autowired
    private CollegeService collegeService;

    @GetMapping("/listGrade")
    public String listGrade(Long majorId, Model model, HttpSession session) {
        List<Grade> gradeList;
        if(majorId!=null){
            session.setAttribute("majorId",majorId);
        }
        Object obc = session.getAttribute("majorId"); //controller一直走两次，没有办法，出此下策
        if(obc == null){
            gradeList = gradeService.listGrade();
        }else{
            gradeList = gradeService.findAllByMajor_Id((Long) obc);
        }
        model.addAttribute("gradeList", gradeList);
        List<College> collegeList = collegeService.listCollege();
        model.addAttribute("collegeList", collegeList);
        return "grade-info";
    }

    @PostMapping("/save")
    @ResponseBody
    public Result saveGrade(Grade grade) {
        Grade g = gradeService.saveGrade(grade);
        if (g == null) {
            return new Result(false, "新增失败");
        }
        return new Result(true, "新增成功");
    }

    @GetMapping("/getGrade")
    @ResponseBody
    public Result getGrade(Long id) {
        Grade grade = gradeService.getGrade(id);
        if (grade == null) {
            return new Result(false, "查询无数据");
        }
        return new Result(true, "查询成功", grade);
    }

    @PostMapping("/updateGrade")
    @ResponseBody
    public Result updateGrade(Long id, Grade grade) {
        Grade g = gradeService.updateGrade(id, grade);
        if (g == null) {
            return new Result(false, "更新失败");
        }
        return new Result(true, "更新成功");
    }

    @GetMapping("/findAllByMajorId")
    @ResponseBody
    public Result findAllByMajorId(Long id){
        List<Grade> major = gradeService.findAllByMajor_Id(id);
        if(major.isEmpty()){
            return new Result(true, "该专业下暂无班级");
        }

        return new Result(true, "查询成功",major);
    }
}

