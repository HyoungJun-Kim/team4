package com.goott.controller;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.goott.domain.PageShop;
import com.goott.domain.ProductCategoryVO;
import com.goott.domain.ProductVO;
import com.goott.service.ProductCategoryService;
import com.goott.service.ProductService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping(value = {"/shop/*", "/shop"})
public class ShopController {

	@Inject
	ProductService productService;
	@Inject
	ProductCategoryService productCategoryService;
	
	
	//쇼핑몰 메인
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String shopMainGet(Model model) {
		log.info("shop 메인 페이지 -----------------------------------------");
		
		// 전체 페이지 수 조회
		int totalPage = (int) Math.ceil((productService.getPageTotalNum(0) / (double) 10.0));
		// 카테고리 목록 조회
		List<ProductCategoryVO> categoryList = productCategoryService.getList();
		PageShop pageShop = new PageShop(1, totalPage);
		List<ProductVO> productList = productService.getProductList(pageShop);
		model.addAttribute("productList", productList);
		model.addAttribute("pageShop", pageShop);
		model.addAttribute("categoryList", categoryList);
		return "shop/shop_user";
	}
	
	//쇼핑몰 메인 관리자
		@RequestMapping(value = "/admin", method = RequestMethod.GET)
		public String shopMainAdminGet(Model model) {
			log.info("shop 관리자 메인 페이지 -----------------------------------------");
			// 전체 페이지 수 조회
			int totalPage = (int) Math.ceil((productService.getPageTotalNumAll(0) / (double) 10.0));
			// 카테고리 목록 조회
			List<ProductCategoryVO> categoryList = productCategoryService.getList();
			PageShop pageShop = new PageShop(1, totalPage);
			List<ProductVO> productList = productService.getProductListAll(pageShop);
			model.addAttribute("productList", productList);
			model.addAttribute("pageShop", pageShop);
			model.addAttribute("categoryList", categoryList);
			return "shop/shop_admin";
		}
	
	
	@RequestMapping(value = "/list/category", method = RequestMethod.POST)
	public String getTotalNumWithCategory(@RequestBody Map<String, Integer> map, Model model) {
		log.info("카테고리   =================================================");
		
		int category_id = map.get("category_id");
		int totalPage = (int) Math.ceil((productService.getPageTotalNum(category_id) / (double) 10.0));
		
		PageShop pageShop = new PageShop(1,totalPage);
		
		
		pageShop.setCategory_id(category_id);
		List<ProductVO> productList = productService.getProductList(pageShop);
		
		model.addAttribute("productList", productList);
		model.addAttribute("pageShop", pageShop);
		return "shop/productDivUser";
		
	}
	
	@RequestMapping(value = "/list/category/admin", method = RequestMethod.POST)
	public String getTotalNumWithCategoryAdmin(@RequestBody Map<String, Integer> map, Model model) {
		log.info("카테고리 관리자  =================================================");
		
		int category_id = map.get("category_id");
		int totalPage = (int) Math.ceil((productService.getPageTotalNumAll(category_id) / (double) 10.0));
		
		PageShop pageShop = new PageShop(1,totalPage);
		
		
		pageShop.setCategory_id(category_id);
		List<ProductVO> productList = productService.getProductListAll(pageShop);
		
		model.addAttribute("productList", productList);
		model.addAttribute("pageShop", pageShop);
		return "shop/productDivUser";
		
	}
	
	
	
	
	
	//상품 더보기 
	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public String listAjaxPost(@RequestBody PageShop pageShop, Model model) {
		log.info("ajax 상품 더보기 요청 ---------------------------------------");
		int category_id = pageShop.getCategory_id();
		//pageShop 초기화
		int totalPage = (int) Math.ceil((productService.getPageTotalNum(category_id) / (double) 10.0));
		pageShop.setTotalPage(totalPage);
		pageShop.setStartNum((pageShop.getCurrentPage() - 1) * 10);
		pageShop.setEndNum(10);
		//공개 상품 리스트
		List<ProductVO> productList = productService.getProductList(pageShop);
		log.info(productList);
		model.addAttribute("productList", productList);
		model.addAttribute("pageShop", pageShop);
		return "shop/productDivUser";
	}
	
	
	//상품 더보기 관리자
	@RequestMapping(value = "/list/admin", method = RequestMethod.POST)
	public String listAjaxAdminPost(@RequestBody PageShop pageShop, Model model) {
		log.info("ajax 관리자 상품 더보기 요청 ---------------------------------------");
		int category_id = pageShop.getCategory_id();
		//pageShop 초기화
		int totalPage = (int) Math.ceil((productService.getPageTotalNumAll(category_id) / (double) 10.0));
		pageShop.setTotalPage(totalPage);
		pageShop.setStartNum((pageShop.getCurrentPage() - 1) * 10);
		pageShop.setEndNum(10);
		//전체 상품 리스트
		List<ProductVO> productList = productService.getProductListAll(pageShop);
		log.info(productList);
		model.addAttribute("productList", productList);
		model.addAttribute("pageShop", pageShop);
		return "shop/productDivAdmin";
	}
}
