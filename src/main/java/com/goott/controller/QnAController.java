package com.goott.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.goott.domain.QnAVO;
import com.goott.service.QnAService;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class QnAController {

	@Autowired
	QnAService qnaservice;

	@RequestMapping(value = "/QnA", method = RequestMethod.GET)
	public ModelAndView QnA(@RequestParam Map<String, Object> map) {
		List<QnAVO> list = qnaservice.list();
		log.info("QnA ==========================================================");
		log.info("QnA 데이터 : " + list.toString());
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/shop/QnA");
		mv.addObject("list", list);
		return mv;
	}

}