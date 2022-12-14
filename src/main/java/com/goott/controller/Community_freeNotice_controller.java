package com.goott.controller;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goott.domain.T_board_VO;
import com.goott.domain.T_board_tag_VO;
import com.goott.service.Community_freeNotice_service;

@Controller
@RequestMapping("/community/freeNotice/*")
public class Community_freeNotice_controller {
	
	@Autowired
	private Community_freeNotice_service fservice;
	
	@GetMapping("/main") //자유게시판 목록 페이지
	public void getList(@RequestParam Map<String, Object> map , T_board_tag_VO tag_vo, Model model) {
		String keyword = (String) map.get("keyword");
		int tag_id = tag_vo.getBoard_tag_id();
		model.addAttribute("data", fservice.getList(map));
		model.addAttribute("tag", fservice.getTag());
		model.addAttribute("count", fservice.listCount(map));
		model.addAttribute("keyword", keyword);
		model.addAttribute("tag_id", tag_id);
	}
	
	@GetMapping("/input") //글 입력 페이지
	public void inputNotice(Model model) {
		model.addAttribute("tag", fservice.getTag());
	}
	
	@PostMapping("/input") // 글 입력 페이지에서 글 등록하기
	public String inputPost (T_board_VO board) {
		fservice.inputPost(board);
		return "redirect:/community/freeNotice/main";
	}
	
	@GetMapping("/detail") // 게시판 상세 페이지
	public void detailPage (int board_id, Model model) {
		fservice.increase(board_id);
		model.addAttribute("tag", fservice.getTag());
		model.addAttribute("data", fservice.getDetail(board_id));
		model.addAttribute("reply_data", fservice.replyList(board_id));
		model.addAttribute("reply_count", fservice.replyCount(board_id));
	}
	
	@GetMapping("/detail_user") // 게시판 유저 페이지
	public void detailUserPage (int board_id, Model model) {
		fservice.increase(board_id);
		model.addAttribute("tag", fservice.getTag());
		model.addAttribute("data", fservice.getDetail(board_id));
		model.addAttribute("reply_data", fservice.replyList(board_id));
		model.addAttribute("reply_count", fservice.replyCount(board_id));
	}
	
	@GetMapping("/correction") // 게시글 수정 페이지
	public void correctionPage(int board_id, Model model) {
		model.addAttribute("tag", fservice.getTag());
		model.addAttribute("data", fservice.getDetail(board_id));
	}
	
	@PostMapping("/correction") // 게시글 수정하기 
	public String correction(T_board_VO board, RedirectAttributes rttr) {
		fservice.correct(board);
		rttr.addFlashAttribute("result", "correction complete");
		return "redirect:/community/freeNotice/detail_user?board_id="+board.getBoard_id();
	}
	
	@PostMapping("/delete") // 게시글 삭제하기
	public String delete(int board_id, RedirectAttributes rttr)	{
		fservice.delete(board_id);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/community/freeNotice/main";
	}
	
	@PostMapping("reply_input") // 댓글 달기
	public ModelAndView reply_input(@RequestBody Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		this.fservice.reply_input(map);
		String reply_id = map.get("board_reply_id").toString();
		String id_cast = map.get("board_id").toString();
		int board_id = Integer.parseInt(id_cast);
		mv.addObject("data", fservice.getReply(reply_id));
		mv.addObject("reply_count", fservice.replyCount(board_id));
		mv.setViewName("community/freeNotice/reply");
		return mv;
	}
	
	@PostMapping("view_more") // 댓글 view more
	public ModelAndView view_more(@RequestBody Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", fservice.get_viewMore(map));
		mv.setViewName("community/freeNotice/view_more");
		return mv;
	}
	
	@PostMapping("change_page") // 자유게시판 게시글 리스트 페이지 전환
	public ModelAndView change_page(@RequestBody Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", fservice.change_page(map));
		mv.setViewName("community/freeNotice/list");
		return mv;
	}
}
