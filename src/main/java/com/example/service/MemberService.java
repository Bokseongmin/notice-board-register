package com.example.service;

import com.example.vo.MemberVo;

public interface MemberService {
    public void member_register(MemberVo memberVo) throws Exception;

    public MemberVo member_login(MemberVo memberVo) throws Exception;

    public void member_modify(MemberVo memberVo) throws Exception;

    public void member_delete(MemberVo memberVo) throws Exception;

    public MemberVo id_check(String userID) throws Exception;
}
