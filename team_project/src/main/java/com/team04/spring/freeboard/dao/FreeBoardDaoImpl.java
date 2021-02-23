package com.team04.spring.freeboard.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.freeboard.dto.FreeBoardDto;

@Repository
public class FreeBoardDaoImpl implements FreeBoardDao{
	//핵심 의존객체 DI
	@Autowired
	private SqlSession session;
		
	@Override
	public void insert(FreeBoardDto dto) {
		session.insert("freeboard.insert",dto);
	}

	@Override
	public List<FreeBoardDto> getlist(FreeBoardDto dto) {
		List<FreeBoardDto> list=session.selectList("freeboard.getList",dto);
		return list;
	}

	@Override
	public int getCount(FreeBoardDto dto) {
		int count=session.selectOne("freeboard.getCount",dto);
		return count;
	}

	
	
}
