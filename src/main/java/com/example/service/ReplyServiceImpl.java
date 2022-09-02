package com.example.service;

import com.example.dao.ReplyDao;
import com.example.vo.ReplyVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class ReplyServiceImpl implements ReplyService{
    @Resource
    private ReplyDao replyDao;

    //댓글 조회
    public List<ReplyVo> reply_list(int bno) throws Exception{
        return replyDao.reply_list(bno);
    }

    public ReplyVo reply_select_read(int rno) throws Exception{
        return replyDao.reply_select_read(rno);
    }
    public void reply_write(ReplyVo vo) throws Exception{
        replyDao.reply_write(vo);
    }

    public void reply_update(ReplyVo vo) throws Exception {
        replyDao.reply_update(vo);
    }

    public void reply_delete(ReplyVo vo) throws Exception {
        replyDao.reply_delete(vo);
    }
}
