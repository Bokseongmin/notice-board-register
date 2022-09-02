package com.example.interceptor;

import com.example.vo.MemberVo;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AdminInterceptor extends HandlerInterceptorAdapter {
    public boolean preHandle(HttpServletRequest req, HttpServletResponse res, Object obj) throws Exception{
        HttpSession session = req.getSession();
        MemberVo member = (MemberVo) session.getAttribute("member");

        if(member == null || member.getVerify() != 9) {
            res.sendRedirect("/");
            return false;
        }
        return true;
    }
}
