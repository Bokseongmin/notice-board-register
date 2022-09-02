package com.example.dao;

import com.example.vo.HomeVo;
import com.example.vo.ReplyVo;
import com.example.vo.SearchVo;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;

@Repository("homeDao")
public class HomeDao extends CommonDao{
    public void board_write(HomeVo vo) throws Exception {
        getSqlSession().insert("mapper.board_write",vo);
    }

    public HomeVo board_read(int bno) throws Exception {
        return getSqlSession().selectOne("mapper.board_read", bno);
    }

    public void board_update(HomeVo vo) throws Exception {
        getSqlSession().update("mapper.board_update",vo);
    }

    public void board_delete(HomeVo vo) throws Exception {
        getSqlSession().delete("mapper.board_reply", vo);
        getSqlSession().delete("mapper.board_delete", vo);
    }

    public List<HomeVo> board_list() throws Exception {
        return getSqlSession().selectList("mapper.board_list");
    }

    public List<HomeVo> board_list_page(int displayPost, int postNum) throws Exception {
        HashMap<String, Integer> data = new HashMap<String, Integer>();
        data.put("displayPost", displayPost);
        data.put("postNum", postNum);

        return getSqlSession().selectList("mapper.board_list_page", data);
    }
    public int board_count() throws Exception {
        return getSqlSession().selectOne("mapper.board_count");
    }

    public List<HomeVo> search_list(int displayPost, int postNum, String searchType, String keyword) throws Exception {
        HashMap<String, Object> data = new HashMap<String, Object>();

        data.put("displayPost", displayPost);
        data.put("postNum", postNum);

        data.put("searchType", searchType);
        data.put("keyword", keyword);

        return getSqlSession().selectList("mapper.board_search",data);
    }

    public int search_count(String searchType, String keyword) throws Exception {
        HashMap data = new HashMap();

        data.put("searchType", searchType);
        data.put("keyword", keyword);

        return getSqlSession().selectOne("mapper.search_count", data);
    }
}