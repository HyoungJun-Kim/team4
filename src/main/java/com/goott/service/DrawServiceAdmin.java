package com.goott.service;

import java.util.List;

import com.goott.domain.ProductVO;
import com.goott.domain.DrawVO;

public interface DrawServiceAdmin {
	
	public List<DrawVO> draw_admin();

	public List<ProductVO> admin_add_plus_product(int product_category_id, int product_brand_id);

	public List<ProductVO> admin_add_plus(int product_category_id);
}
