package com.example.service;

import com.example.vo.HomeVo;
import com.example.vo.SearchVo;

import java.util.List;

public interface HomeService {
    public void board_write(HomeVo vo) throws Exception;

    public HomeVo board_read(int bno) throws Exception;

    public void board_update(HomeVo vo) throws Exception;

    public void board_delete(HomeVo vo) throws Exception;

    public List<HomeVo> board_list() throws Exception;

    public List<HomeVo> board_list_page(int displayPost, int postNum) throws Exception;

    public int board_count() throws Exception;

    public List<HomeVo> search_list(int displayPost, int postNum, String searchType, String keyword) throws Exception;

    public int search_count(String searchType, String keyword) throws Exception;
}
