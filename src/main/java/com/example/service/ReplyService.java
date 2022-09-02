package com.example.service;

import com.example.vo.ReplyVo;

import java.util.List;

public interface ReplyService {
    public List<ReplyVo> reply_list(int bno) throws Exception;

    ReplyVo reply_select_read(int rno) throws Exception;
    public void reply_write(ReplyVo vo) throws Exception;

    public void reply_update(ReplyVo vo) throws Exception;

    public void reply_delete(ReplyVo vo) throws Exception;
}
