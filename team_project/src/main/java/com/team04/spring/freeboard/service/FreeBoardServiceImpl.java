package com.team04.spring.freeboard.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.spring.freeboard.dao.FreeBoardDao;
import com.team04.spring.freeboard.dto.FreeBoardDto;

@Service
public class FreeBoardServiceImpl implements FreeBoardService{
	
	@Autowired
	private FreeBoardDao freeBoarddao;
	
	@Override
	public void saveContent(FreeBoardDto dto) {
		freeBoarddao.insert(dto);
		
	}

}
