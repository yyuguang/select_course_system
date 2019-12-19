package com.lnzz.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * ClassName：LoginInterceptor
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 16:35
 * @Description:
 */
public class LoginInterceptor implements HandlerInterceptor {
    private static final String[] IGNORE_URI = {"/register", "/login"};


    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object o) throws Exception {
        System.out.println("拦截器执行...");
        boolean flag = true;
        String servletPath = request.getServletPath();
        for (String s : IGNORE_URI) {
            if (servletPath.contains(s)) {
                flag = true;
                break;
            }
        }
        if (!flag) {
            HttpSession session = request.getSession();
            if (session.getAttribute("LOGIN_USER") == null) {
                request.setAttribute("message", "请先登录再访问网站！");
                request.getRequestDispatcher("/login.jsp").forward(request, response);
                return flag;
            } else {
                flag = true;
            }
        }
            return flag;
    }


    @Override
    public void postHandle(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest httpServletRequest, HttpServletResponse httpServletResponse, Object o, Exception e) throws Exception {

    }
}