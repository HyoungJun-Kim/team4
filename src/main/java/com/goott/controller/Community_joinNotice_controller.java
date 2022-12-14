package com.goott.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.goott.domain.T_camping_VO;
import com.goott.service.Community_joinNotice_service;

@Controller
@RequestMapping("/community/joinNotice/*")
public class Community_joinNotice_controller {
	
	@Autowired
	private Community_joinNotice_service jservice;
	
	@GetMapping("/main") // 캠핑모임게시판 메인
	public void getList(@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Map<String, Object> map , Model model) {
		model.addAttribute("data", jservice.getList(map)); // 게시글 리스트
		model.addAttribute("count", jservice.listCount(map)); // 게시글 갯수
		model.addAttribute("option", map); // 페이징 처리에 사용할 검색 옵션
	}
	
	@GetMapping("/detail_user") // 게시판 유저 페이지
	public void detailUserPage (int camping_id, Model model) {
		jservice.increase(camping_id); // 조회수 증가
		model.addAttribute("data", jservice.getDetail(camping_id)); // 상세페이지 정보
		model.addAttribute("reply_data", jservice.replyList(camping_id)); //댓글 정보
		model.addAttribute("reply_count", jservice.replyCount(camping_id)); //댓글 갯수
	}
	
	@GetMapping("/input") // 글 입력 페이지
	public void input (Model model) {
	}
	
	@PostMapping("/input") // 글 입력 페이지에서 글 등록하기
	public String inputPost (@RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") Map<String, Object> map) {
		jservice.input(map);
		return "redirect:/community/joinNotice/main";
	}
	
	@GetMapping("/correction") // 게시글 수정 페이지
	public void correctionPage(int camping_id, Model model) {
		model.addAttribute("data", jservice.getDetail(camping_id));
	}
	
	@PostMapping("/correction") // 게시글 수정하기 
	public String correction(T_camping_VO camping, RedirectAttributes rttr) {
		jservice.correct(camping);
		rttr.addFlashAttribute("result", "correction complete");
		return "redirect:/community/joinNotice/detail_user?camping_id="+camping.getCamping_id();
	}
	
	@PostMapping("/delete") // 게시글 삭제하기
	public String delete(int camping_id, RedirectAttributes rttr)	{
		jservice.delete(camping_id);
		rttr.addFlashAttribute("result", "delete success");
		return "redirect:/community/joinNotice/main";
	}
	
	@PostMapping("reply_input") // 댓글 달기
	public ModelAndView reply_input(@RequestBody Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		this.jservice.reply_input(map);
		String reply_id = map.get("camping_reply_id").toString();
		String id_cast = map.get("camping_id").toString();
		int camping_id = Integer.parseInt(id_cast);
		mv.addObject("data", jservice.getReply(reply_id)); 
		mv.addObject("reply_count", jservice.replyCount(camping_id));
		mv.setViewName("community/joinNotice/reply");
		return mv;
	}
	
	@PostMapping("view_more") // 댓글 view more
	public ModelAndView view_more(@RequestBody Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", jservice.viewMore(map));
		mv.setViewName("community/joinNotice/view_more");
		return mv;
	}
	
	@PostMapping("change_page") // 자유게시판 게시글 리스트 페이지 전환
	public ModelAndView change_page(@RequestBody Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", jservice.changePage(map));
		mv.setViewName("community/joinNotice/list");
		return mv;
	}
	
	@PostMapping("campsite") // 캠핑장 목록 검색
	public ModelAndView campsite(@RequestBody Map<String, Object> map) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("data", jservice.campsite(map));
		mv.setViewName("community/joinNotice/modal");
		return mv;
	}
}
