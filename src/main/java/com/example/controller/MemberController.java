package com.example.controller;

import com.example.service.MemberService;
import com.example.vo.MemberVo;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/member/*")
public class MemberController {

    @Resource
    private MemberService memberService;

    @Resource
    BCryptPasswordEncoder passEncoder;

    @RequestMapping(value = "/member_register", method = RequestMethod.GET)
    public void get_member_register(MemberVo memberVo) throws Exception {
    }

    @RequestMapping(value = "/member_register", method = RequestMethod.POST)
    public String post_member_register(MemberVo memberVo) throws Exception {

        String inputPass = memberVo.getUserPass();
        String pass = passEncoder.encode(inputPass);
        memberVo.setUserPass(pass);

        memberService.member_register(memberVo);
        return "redirect:/";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    public String member_login(MemberVo memberVo, HttpServletRequest req, RedirectAttributes rttrs) throws Exception {

        HttpSession session = req.getSession();
        MemberVo login = memberService.member_login(memberVo);

        if(login != null) {
            boolean passMatch = passEncoder.matches(memberVo.getUserPass(), login.getUserPass());

            if (passMatch) session.setAttribute("member", login);
            else {
                session.setAttribute("member", null);
                rttrs.addFlashAttribute("msg",false);
            }
        }
        else {
            session.setAttribute("member", null);
            rttrs.addFlashAttribute("msg",false);
        }
        /*if(login == null) {
            session.setAttribute("member", null);
            rttr.addFlashAttribute("msg", false);
        } else {
            session.setAttribute("member", login);
        }*/
        return "redirect:/";
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String member_logout(HttpSession session) throws Exception {

        session.invalidate();

        return "redirect:/";
    }

    @RequestMapping(value = "/member_modify", method = RequestMethod.GET)
    public void member_modify() throws Exception {
    }

    @RequestMapping(value = "/member_modify", method = RequestMethod.POST)
    public String post_member_modify(HttpSession session, MemberVo memberVo) throws Exception {

        String inputPass = memberVo.getUserPass();
        String pass = passEncoder.encode(inputPass);
        memberVo.setUserPass(pass);

        memberService.member_modify(memberVo);
        session.invalidate();
        return "redirect:/";
    }

    @RequestMapping(value = "/member_delete", method = RequestMethod.GET)
    public void get_member_delete() throws Exception {
    }

    @RequestMapping(value = "/member_delete", method = RequestMethod.POST)
    public String post_member_delete(HttpSession session, MemberVo memberVo, RedirectAttributes rttr) throws Exception {

        MemberVo vo = (MemberVo)session.getAttribute("member");
        String oldPass = vo.getUserPass();
        String newPass = memberVo.getUserPass();

        boolean passMatch = passEncoder.matches(newPass, oldPass);

        if(!passMatch) {
            rttr.addFlashAttribute("msg",false);
            return "redirect:/member/member_delete";
        }
        memberService.member_delete(vo);
        session.invalidate();
        return "redirect:/";
    }

    @ResponseBody
    @RequestMapping(value = "/id_check", method = RequestMethod.POST)
    public int post_id_check(HttpServletRequest req) throws Exception{
        String userID = req.getParameter("userID");
        MemberVo id_check = memberService.id_check(userID);

        int result = 0;
        if(id_check!=null) result = 1;

        return result;
    }
}
