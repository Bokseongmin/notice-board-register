package com.example.service;

import com.example.dao.MemberDao;
import com.example.vo.MemberVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service
public class MemberServiceImpl implements MemberService{
    @Resource
    private MemberDao memberDao;

    public void member_register(MemberVo memberVo) throws Exception{
        memberDao.member_register(memberVo);
    }

    public MemberVo member_login(MemberVo memberVo) throws Exception {
        return memberDao.member_login(memberVo);
    }

    public void member_modify(MemberVo memberVo) throws Exception {
        memberDao.member_modify(memberVo);
    }

    public void member_delete(MemberVo memberVo) throws Exception {
        memberDao.member_delete(memberVo);
    }

    public MemberVo id_check(String userID) throws Exception {
        return memberDao.id_check(userID);
    }
}
