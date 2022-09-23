package com.goott.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goott.domain.DrawVO;
import com.goott.domain.ProductVO;
import com.goott.mapper.DrawAdminMapper;

@Service
public class DrawServiceAdminImpl implements DrawServiceAdmin {

	@Inject
	DrawAdminMapper drawAdminMapper;
	
	@Override
	public List<DrawVO> draw_admin() {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_admin();
	}

	@Override
	public List<ProductVO> admin_add_plus_product(int product_category_id, int product_brand_id) {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_admin_add_plus_product(product_category_id, product_brand_id);
	}

	@Override
	public List<ProductVO> admin_add_plus(int product_category_id) {
		// TODO Auto-generated method stub
		return drawAdminMapper.draw_admin_add_plus(product_category_id);
	}

}
