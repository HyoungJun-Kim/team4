package com.goott.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.goott.domain.ProductVO;
import com.goott.domain.DrawVO;
import com.goott.service.DrawServiceAdmin;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class DrawController {

	@Inject
	DrawServiceAdmin drawServiceAdmin;

	@RequestMapping(value = "/shop/draw_admin", method = RequestMethod.GET)
	public ModelAndView draw_admin() {
		log.info("draw 목록 관리자 ====================================================");

		List<DrawVO> draw_admin = drawServiceAdmin.draw_admin();

		log.info("draw 목록 : " + draw_admin);

		ModelAndView mv = new ModelAndView();
		mv.setViewName("shop/draw_admin");
		mv.addObject("list", draw_admin);

		return mv;

	}

	@RequestMapping(value = "/shop/draw_admin_add", method = RequestMethod.GET)
	public String draw_admin_add() {
		return "/shop/draw_admin_add";
	}

	@ResponseBody
	// === 상품 추가하기 (brand) (ajax) === //
	@RequestMapping(value = "/shop/admin_add_plus_product.os")
	public List<ProductVO> admin_add_plus_product(HttpServletRequest request) {
		// 에이잭스로 넘어온 데이터(스트링)
		String temp_category_id = request.getParameter("product_category_id");
		// 카테고리 아이디(인트형)
		int product_category_id = Integer.parseInt(temp_category_id);
		// 에이잭스로 넘어온 데이터(스트링)
		String temp_brand_id = request.getParameter("product_brand_id");
		// 카테고리 아이디(인트형)
		int product_brand_id = Integer.parseInt(temp_brand_id);
		// 카테고리로 정렬된 상품 리스트
		List<ProductVO> list = new ArrayList<>();
		// 디비에서 넘어온 상품 리스트 저장

		list = drawServiceAdmin.admin_add_plus_product(product_category_id, product_brand_id);
		log.info(list);
		return list;

		// @ResponseBody
		// === 상품 추가하기 (product) (ajax) === //
		// @RequestMapping(value = "/shop/admin_add_plus_product.os")
		// public List<ProductVO> admin_add_plus_product(HttpServletRequest request) {
//	     // public List<EmployeeDTO> writeAddress(@RequestParam List<EmployeeDTO> empMap) {
		// String product_name = request.getParameter("product_name");
		// System.out.println("모달창에서 클릭한 부서 번호 ==> " + product_name);

		// Map<String, Object> empMap = new HashMap<String, Object>();
		// empMap.put("product_name", product_name);

		// 카테고리 상품 이름 조회
		// List<ProductVO> empList = drawService_admin.admin_add_plus_product(empMap);
		// System.out.println(empList.toString());
//	      JSONArray jsonArr = new JSONArray();
//	      
//	      
//	      if(empList != null) {
//	         for (CatagoryVO cvo : empList) {
//	            JSONObject jsonObj = new JSONObject();
//	            jsonObj.put("getcatogory_name", cvo.getCategory_name());       
//	            jsonObj.put("emp_no", cvo.getCategory_id());
//	            jsonArr.put(jsonObj);
//	         }  
//	      }
//	      return jsonArr.toString();  
		// return empList;
	}

	@ResponseBody
	// === 상품 추가하기 (brand) (ajax) === //
	@RequestMapping(value = "/shop/admin_add_plus.os")
	public List<ProductVO> admin_add_plus(HttpServletRequest request) {
		// 에이잭스로 넘어온 데이터(스트링)
		String temp_category_id = request.getParameter("product_category_id");
		// 카테고리 아이디(인트형)
		int product_category_id = Integer.parseInt(temp_category_id);
		// 카테고리로 정렬된 상품 리스트
		List<ProductVO> list = new ArrayList<>();
		// 디비에서 넘어온 상품 리스트 저장
		list = drawServiceAdmin.admin_add_plus(product_category_id);

//	      public List<EmployeeDTO> writeAddress(@RequestParam List<EmployeeDTO> empMap) {
		// String category_id = request.getParameter("brand_name");
		// System.out.println("모달창에서 클릭한 부서 번호 ==> " + category_id);

		// Map<String, Object> empMap = new HashMap<String, Object>();
		// empMap.put("category_id", category_id);

		// 카테고리 브랜드 이름 조회
		// List<BrandVO> empList = drawService_admin.admin_add_plus(empMap);
		// System.out.println(empList.toString());
		return list;
	}
	
	@RequestMapping(value = "/shop/draw_admin_count", method = RequestMethod.GET)
	public String draw_admin_count() {
		return "/shop/draw_admin_count";
	}

}
