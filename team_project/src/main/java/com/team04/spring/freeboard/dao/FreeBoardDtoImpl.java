package com.team04.spring.freeboard.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.freeboard.dto.FreeBoardDto;

@Repository
public class FreeBoardDtoImpl implements FreeBoardDao{
	//핵심 의존객체 DI
	@Autowired
	private SqlSession session;
	
	public void insert(FreeBoardDto dto) {
		session.insert("freeboard.insert",dto);
	}
	
}
