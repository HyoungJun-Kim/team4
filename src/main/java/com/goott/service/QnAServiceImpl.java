package com.goott.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.goott.domain.QnAVO;
import com.goott.mapper.QnAMapper;

@Service
public class QnAServiceImpl implements QnAService {

	@Inject
	QnAMapper qnaMapper;
	
	@Override
	public List<QnAVO> list() {
		// TODO Auto-generated method stub
		return qnaMapper.list();
	}

}
