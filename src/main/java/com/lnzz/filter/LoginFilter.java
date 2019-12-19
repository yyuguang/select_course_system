package com.lnzz.filter;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * ClassName：LoginFilter
 *
 * @author 冷暖自知
 * @version 1.0
 * @date 2019/12/12 16:31
 * @Description:
 */
public class LoginFilter implements Filter {

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest req=(HttpServletRequest)servletRequest;
        HttpServletResponse res=(HttpServletResponse)servletResponse;
        HttpSession session=req.getSession();
        if(session.getAttribute("LOGIN_USER") != null) {
            System.out.println("过滤器执行...");
            // pass the request along the filter chain
            filterChain.doFilter(servletRequest, servletResponse);
            return;
        }else {
            res.sendRedirect("./login.jsp");
        }
    }

    @Override
    public void destroy() {

    }
}
