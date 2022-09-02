package com.example.dao;

import com.example.vo.MemberVo;
import org.springframework.stereotype.Repository;

@Repository("memberDao")
public class MemberDao extends CommonDao{
    public void member_register(MemberVo memberVo) throws Exception{
        getSqlSession().insert("member_mapper.register", memberVo);
    }

    public MemberVo member_login(MemberVo memberVo) throws Exception{
        //return getSqlSession().selectOne("member_mapper.login", memberVo);
        return getSqlSession().selectOne("member_mapper.loginBcrypt", memberVo);
    }

    public void member_modify(MemberVo memberVo) throws Exception{
        getSqlSession().update("member_mapper.modify", memberVo);
    }

    public void member_delete(MemberVo memberVo) throws Exception{
        getSqlSession().delete("member_mapper.delete", memberVo);
    }

    public MemberVo id_check(String userID) throws Exception{
        return getSqlSession().selectOne("member_mapper.id_check", userID);
    }
}
