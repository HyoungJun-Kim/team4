package com.goott.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.goott.domain.DrawVO;
import com.goott.domain.ProductVO;

@Mapper
public interface DrawAdminMapper {

	public List<DrawVO> draw_admin();

	public List<ProductVO> draw_admin_add_plus_product(@Param("product_category_id") int product_category_id, @Param("product_brand_id") int product_brand_id);

	public List<ProductVO> draw_admin_add_plus(int product_category_id);

}
