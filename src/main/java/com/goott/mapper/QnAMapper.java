package com.goott.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.goott.domain.QnAVO;

@Mapper
public interface QnAMapper {
	public List<QnAVO> list();
}
