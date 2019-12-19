package com.lnzz.controller;

import com.lnzz.pojo.Student;
import com.lnzz.service.StudentService;
import com.lnzz.util.Result;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.Assert;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.UUID;

/**
 * ClassName：StudentController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/15 18:15
 * @Description:
 */
@Controller
@RequestMapping("/student")
public class StudentController {
    @Autowired
    private StudentService studentService;

    private final static String UPLOAD_IMG_FILE = "D:\\upload\\images";
    private final static String UPLOAD_IMG_FILE_PATH = "/upload/images";

    @GetMapping("/studentInfo")
    public String studentInfo(Model model, HttpSession session) {
        Student s = (Student) session.getAttribute("LOGIN_USER");
        Student student = studentService.getStudent(s.getStuId());
        model.addAttribute("student", student);
        return "student-info";
    }

    @PostMapping("/updateStudent")
    @ResponseBody
    public Result updateStudent(@RequestParam String stuPhone,
                                @RequestParam String stuId,
                                @RequestParam String stuEmail,
                                HttpSession session) {
        int i = studentService.updateStudent(Long.parseLong(stuId), stuPhone, stuEmail);
        if (i == 0) {
            return new Result(true, "更新失败");
        }
        return new Result(true, "更新成功");
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    @ResponseBody
    public Result upload(@RequestParam("file") MultipartFile imageFile, HttpServletRequest request, HttpSession session) throws Exception {
        Assert.notNull(imageFile, "上传文件不能为空");
        //使用UUID给图片重命名，并去掉四个“-”
        String name = UUID.randomUUID().toString().replaceAll("-", "");
        //获取文件的扩展名
        String ext = FilenameUtils.getExtension(imageFile.getOriginalFilename());
        //设置图片上传路径
        //以绝对路径保存重名命后的图片
        imageFile.transferTo(new File(UPLOAD_IMG_FILE + "/" + name + "." + ext));
        //把图片存储路径保存到数据库
        Student s = (Student) session.getAttribute("LOGIN_USER");
        String imgUrl = UPLOAD_IMG_FILE_PATH + "/" + name + "." + ext;
        int i = studentService.updateStudentImg(s.getStuId(), imgUrl);
        if (i == 0) {
            return new Result(true, "上传失败");
        }
        return new Result(true, "上传成功");
    }


    @PostMapping("/updateStudentPassWord")
    @ResponseBody
    public Result updateStudentPassWord(@RequestParam String stuPassword,
                                        @RequestParam String stuId,
                                        @RequestParam String newPassword){
        int i = studentService.updateStudentPassWord(Long.parseLong(stuId), stuPassword, newPassword);
        if(i==0){
            return new Result(false, "更新失败");
        }
        return new Result(true, "更新成功");
    }
}
