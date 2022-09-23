package com.goott.controller;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goott.domain.CouponVO;
import com.goott.service.CouponService;
import com.goott.service.MemberService;
import com.goott.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = {"/order/*", "/order"})
public class OrderController {
	
	@Inject
	MemberService memberService;
	@Inject
	ProductService productService;
	@Inject
	CouponService couponService;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String orderGet(@RequestParam String member_id, @RequestParam String product_id, @RequestParam String order_quantity, Model model) {
		log.info("주문 get ==========================================");
		log.info("주문자 아이디 : " + member_id);
		log.info("상품 아이디 : " + product_id);
		log.info("상품 수량 : " + order_quantity);
		
		//등급 정보 가져오기
		Map<String, Object> grade = memberService.getUserGradeInfo(member_id);
		
		//주소 가져오기
		Map<String, Object> list = memberService.getUserAddress(member_id);
		
		//상품 번호, 재고량, 상품 이름, 상품 가격, 썸네일 이미지, 배송일
		Map<String, Object> product = productService.getOrderDetailInfo(Integer.parseInt(product_id));
		
		model.addAttribute("list", list);
		model.addAttribute("product", product);
		model.addAttribute("order_quantity", order_quantity);
		model.addAttribute("grade", grade);
		
		return "shop/order/order_detail";
	}
	@ResponseBody
	@RequestMapping(value = "coupon", method = RequestMethod.POST, produces = "application/json; charset=utf-8")
	public Map<String, Object> useCoupon(@RequestBody Map<String, Object> param) {
		log.info("쿠폰 사용 ================================================");
		log.info(param);
		
		String coupon_num = param.get("coupon_num").toString();
		int product_category_id = Integer.parseInt( param.get("product_category_id").toString() );
		int product_brand_id = Integer.parseInt( param.get("product_brand_id").toString() );

		String result = couponService.checkCoupon(coupon_num, product_category_id, product_brand_id);
		log.info(result);
		
		CouponVO couponVO = null;
		//만약 쿠폰을 사용 하였다면
		if(result.equals("사용 가능한 쿠폰 입니다.")) {
			//쿠폰 정보도 저장
			couponVO = couponService.getCouponInfo(coupon_num);
			
		}
			
		//쿠폰 사용 결과와 쿠폰의 내용 json 형식으로 리턴
		Map<String, Object> map = new HashMap<>();
		map.put("result", result);
		map.put("coupon", couponVO);
		
		return map;
	}
}
