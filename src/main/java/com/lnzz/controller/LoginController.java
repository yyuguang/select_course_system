package com.lnzz.controller;

import com.alibaba.fastjson.JSONObject;
import com.lnzz.pojo.Student;
import com.lnzz.service.StudentService;
import com.lnzz.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

/**
 * ClassName：AdminController
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 11:19
 * @Description:
 */
@Controller
@RequestMapping("/login")
public class LoginController {
    @Autowired
    private StudentService studentService;

    @PostMapping("/login")
    @ResponseBody
    public Result login(@RequestParam String username,
                        @RequestParam String password,
                        @RequestParam Integer role,
                        HttpSession session) {
        Student student = studentService.findStudentByStuCodeAndStuPasswordAndRole(username, password, role);
        if (student != null) {
            student.setStuPassword(null);
            session.setAttribute("LOGIN_USER", student);
            return new Result(true,"登陆成功");

        } else {
            return new Result(false,"用户名或密码不正确");
        }
    }
    @RequestMapping(value="/register",
            method=RequestMethod.POST)
    @ResponseBody
    public Result register(@RequestBody  Student student){
        Student s = studentService.saveStudent(student);
        if(s == null){
            return new Result(false,"注册失败");
        }

        return new Result(true,"注册成功");
    }

    @GetMapping("/logout")
    public void  logout(HttpSession session, HttpServletRequest request, HttpServletResponse response){
        session.invalidate();
        //获取项目真实路径
        String path = request.getContextPath();
        //拼接跳转页面路径
        String basePath = request.getScheme() + "://"
                + request.getServerName() + ":" + request.getServerPort()
                + path + "/";
        String str = "<script>top.location='"+basePath+"'</script>";
        System.out.println(str);
        responseTxt(response,str);
    }

    //返回前台页面ajax
    protected void responseTxt(HttpServletResponse response,String str){
        try {
            response.setContentType("text/html;charset=UTF-8");
            PrintWriter out = response.getWriter();
            out.write(str);
            out.flush();
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
