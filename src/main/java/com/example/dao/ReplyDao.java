package com.example.dao;

import com.example.vo.ReplyVo;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("replyDao")
public class ReplyDao extends CommonDao{
    public List<ReplyVo> reply_list(int bno) throws Exception{
        return getSqlSession().selectList("reply_mapper.reply_list", bno);
    }

    public ReplyVo reply_select_read(int rno) throws Exception{
        return getSqlSession().selectOne("reply_mapper.reply_select_read");
    }
    public void reply_write(ReplyVo vo) throws Exception{
        getSqlSession().insert("reply_mapper.reply_write", vo);
    }

    public void reply_update(ReplyVo vo) throws Exception{
        getSqlSession().update("reply_mapper.reply_update", vo);
    }

    public void reply_delete(ReplyVo vo) throws Exception{
        getSqlSession().delete("reply_mapper.reply_delete", vo);
    }
}
