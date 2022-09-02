package com.example.service;

import com.example.dao.HomeDao;
import com.example.vo.HomeVo;
import com.example.vo.ReplyVo;
import com.example.vo.SearchVo;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service
public class HomeServiceImpl implements HomeService{

    @Resource
    private HomeDao homeDao;

    public void board_write(HomeVo vo) throws Exception{
        homeDao.board_write(vo);
    }

    public HomeVo board_read(int bno) throws Exception{
        return homeDao.board_read(bno);
    }

    public void board_update(HomeVo vo) throws Exception {
        homeDao.board_update(vo);
    }

    public void board_delete(HomeVo vo) throws Exception {
        homeDao.board_delete(vo);
    }

    public List<HomeVo> board_list() throws Exception {
        return homeDao.board_list();
    }

    public List<HomeVo> board_list_page(int displayPost, int postNum) throws Exception {
        return homeDao.board_list_page(displayPost, postNum);
    }

    public int board_count() throws Exception {
        return homeDao.board_count();
    }

    public List<HomeVo> search_list(int displayPost, int postNum, String searchType, String keyword) throws Exception {
        return homeDao.search_list(displayPost, postNum, searchType, keyword);
    }

    public int search_count(String searchType, String keyword) throws Exception {
        return homeDao.search_count(searchType, keyword);
    }
}
