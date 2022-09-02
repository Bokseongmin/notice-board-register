package com.example.controller;

import com.example.service.HomeService;
import com.example.service.ReplyService;
import com.example.vo.HomeVo;
import com.example.vo.PagingVo;
import com.example.vo.ReplyVo;
import com.example.vo.SearchVo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Locale;

@Controller
public class HomeController {
    @Resource
    private HomeService homeService;

    @Resource
    private ReplyService replyService;

    @RequestMapping(value = "/board_list", method = {RequestMethod.GET, RequestMethod.POST})
    public void board_list_page(Locale locale, Model model, HomeVo vo) throws Exception {
        List<HomeVo> list = homeService.board_list();
        model.addAttribute("list", list);
    }

    // 글 작성
    @RequestMapping(value = "/board_write", method = RequestMethod.GET)
    public void get_board_write_page(HttpSession session, Model model) throws Exception {
        Object login_info = session.getAttribute("member");
        if(login_info==null) {
            model.addAttribute("msg","login_error");
        }
    }

    @RequestMapping(value = "/board_write", method = RequestMethod.POST)
    public String board_write_page(Locale locale, Model model, HomeVo vo) throws Exception {
        return "board_write";
    }

    @RequestMapping(value = "/write_insert", method = {RequestMethod.GET, RequestMethod.POST})
    public String write_insert(Locale locale, Model model, HomeVo vo) throws Exception {
        homeService.board_write(vo);
        return "redirect:/";
    }

    @RequestMapping(value = "/board_read", method = {RequestMethod.GET, RequestMethod.POST})
    public void board_read_page(@RequestParam("bno") int bno, @ModelAttribute("searchVo") SearchVo searchVo, Locale locale, Model model, HomeVo vo) throws Exception {
        vo = homeService.board_read(bno);
        model.addAttribute("read",vo);
        model.addAttribute("page", searchVo);

        List<ReplyVo> reply_list = replyService.reply_list(bno);
        model.addAttribute("reply_list",reply_list);
    }

    @RequestMapping(value = "/board_update", method = {RequestMethod.GET, RequestMethod.POST})
    public String board_detail_update(@ModelAttribute("searchVo") SearchVo searchVo, Locale locale, Model model, HomeVo vo, RedirectAttributes rttr) throws Exception {
        homeService.board_update(vo);
        model.addAttribute("read",vo);

        rttr.addAttribute("bno", searchVo.getBno());
        rttr.addAttribute("nowPage", searchVo.getNowPage());
        rttr.addAttribute("cntPerPage", searchVo.getCntPerPage());
        rttr.addAttribute("searchType", searchVo.getSearchType());
        rttr.addAttribute("keyword", searchVo.getKeyword());

        return "redirect:/board_read";
    }

    @RequestMapping(value = "/board_delete", method = {RequestMethod.GET, RequestMethod.POST})
    public String board_detail_delete(@ModelAttribute("searchVo") SearchVo searchVo, Locale locale, Model model, HomeVo vo, RedirectAttributes rttr) throws Exception {
        homeService.board_delete(vo);

        rttr.addAttribute("nowPage", searchVo.getNowPage());
        rttr.addAttribute("cntPerPage", searchVo.getCntPerPage());
        rttr.addAttribute("searchType", searchVo.getSearchType());
        rttr.addAttribute("keyword", searchVo.getKeyword());

        return "forward:/board_list_search";
    }

    @RequestMapping(value = "/board_list_paging", method = {RequestMethod.GET, RequestMethod.POST})
    public void board_list_page(@RequestParam(value = "nowPage", defaultValue = "1") int nowPage, @RequestParam(value = "cntPerPage", defaultValue = "5") int cntPerPage, Model model) throws Exception {
        PagingVo pagingVo = new PagingVo();

        pagingVo.setNowPage(nowPage);
        pagingVo.setCntPerPage(cntPerPage);
        pagingVo.setPageNumCnt(10);
        pagingVo.setCntPost(homeService.board_count());

        List<HomeVo> list = homeService.board_list_page(pagingVo.getDisplayPost(), pagingVo.getCntPerPage());

        model.addAttribute("list", list);
        model.addAttribute("page", pagingVo);
        model.addAttribute("select", nowPage);
    }

    @RequestMapping(value = "/board_list_search", method = {RequestMethod.GET, RequestMethod.POST})
    public void getListSearch(Model model, @RequestParam(value = "nowPage", defaultValue = "1") int nowPage,
                              @RequestParam(value = "cntPerPage", defaultValue = "10") int cntPerPage,
                              @RequestParam(value = "searchType", required = false, defaultValue = "") String searchType,
                              @RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) throws Exception {

        SearchVo sv = new SearchVo();

        sv.setCntPerPage(cntPerPage);
        sv.setPageNumCnt(10);
        sv.setNowPage(nowPage);
        sv.setCntPost(homeService.search_count(searchType, keyword));
        sv.setSearchType(searchType);
        sv.setKeyword(keyword);

        List<HomeVo> list = homeService.search_list(sv.getDisplayPost(),sv.getCntPerPage(),searchType,keyword);

        model.addAttribute("list", list);
        model.addAttribute("page", sv);
        model.addAttribute("select", nowPage);
    }
}