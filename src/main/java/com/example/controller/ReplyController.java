package com.example.controller;

import com.example.service.HomeService;
import com.example.service.ReplyService;
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

@Controller
@RequestMapping("/reply/*")
public class ReplyController {

    @Resource
    private HomeService homeService;

    @Resource
    private ReplyService replyService;

    @RequestMapping(value = "/reply_write", method = {RequestMethod.GET, RequestMethod.POST})
    public String reply_write(ReplyVo replyVo, SearchVo searchVo, RedirectAttributes rttr) throws Exception{
        replyService.reply_write(replyVo);

        rttr.addAttribute("bno", replyVo.getBno());
        rttr.addAttribute("nowPage", searchVo.getNowPage());
        rttr.addAttribute("cntPerPage", searchVo.getCntPerPage());
        rttr.addAttribute("searchType", searchVo.getSearchType());
        rttr.addAttribute("keyword", searchVo.getKeyword());

        return "redirect:/board_read";
        //return "redirect:/board_read?bno=" + replyVo.getBno() + "&nowPage=" + searchVo.getNowPage() + "&cntPerPage=" + searchVo.getCntPerPage() + "&searchType=" + searchVo.getSearchType() + "&keyword=" + searchVo.getKeyword();
    }

    @RequestMapping(value = "/reply_update", method = RequestMethod.POST)
    public String reply_update(ReplyVo replyVo, SearchVo searchVo, RedirectAttributes rttr) throws Exception{
        replyService.reply_update(replyVo);

        rttr.addAttribute("bno", replyVo.getBno());
        rttr.addAttribute("nowPage", searchVo.getNowPage());
        rttr.addAttribute("cntPerPage", searchVo.getCntPerPage());
        rttr.addAttribute("searchType", searchVo.getSearchType());
        rttr.addAttribute("keyword", searchVo.getKeyword());

        return "redirect:/board_read";
        //return "redirect:/board_read?bno=" + replyVo.getBno() + "&nowPage=" + searchVo.getNowPage() + "&cntPerPage=" + searchVo.getCntPerPage() + "&searchType=" + searchVo.getSearchType() + "&keyword=" + searchVo.getKeyword();
    }

    @RequestMapping(value = "/reply_delete", method = RequestMethod.POST)
    public String reply_delete(ReplyVo replyVo, SearchVo searchVo, RedirectAttributes rttr) throws Exception{
        replyService.reply_delete(replyVo);

        rttr.addAttribute("bno", replyVo.getBno());
        rttr.addAttribute("nowPage", searchVo.getNowPage());
        rttr.addAttribute("cntPerPage", searchVo.getCntPerPage());
        rttr.addAttribute("searchType", searchVo.getSearchType());
        rttr.addAttribute("keyword", searchVo.getKeyword());

        return "redirect:/board_read";
        //return "redirect:/board_read?bno=" + replyVo.getBno() + "&nowPage=" + searchVo.getNowPage() + "&cntPerPage=" + searchVo.getCntPerPage() + "&searchType=" + searchVo.getSearchType() + "&keyword=" + searchVo.getKeyword();
    }

    @RequestMapping(value = "/reply_update", method = RequestMethod.GET)
    public void get_reply_update(@RequestParam("rno") int rno, @ModelAttribute("page") SearchVo searchVo, Model model) throws Exception{
        ReplyVo replyVo = replyService.reply_select_read(rno);

        model.addAttribute("reply_list",replyVo);
        model.addAttribute("page", searchVo);
    }

    @RequestMapping(value = "/reply_delete", method = RequestMethod.GET)
    public void get_reply_delete(@RequestParam("rno") int rno, @ModelAttribute("page") SearchVo searchVo, Model model) throws Exception{
        ReplyVo replyVo = replyService.reply_select_read(rno);

        model.addAttribute("reply_list",replyVo);
        model.addAttribute("page", searchVo);

        //return "redirect:/board_read?bno=" + replyVo.getBno() + "&nowPage=" + searchVo.getNowPage() + "&cntPerPage=" + searchVo.getCntPerPage() + "&searchType=" + searchVo.getSearchType() + "&keyword=" + searchVo.getKeyword();
    }
}
