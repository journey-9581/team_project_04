package com.team04.spring.review.month.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.review.month.dto.MonthDto;


@Repository
public class MonthDaoImpl implements MonthDao{
	//핵심 의존객체 DI
	@Autowired
	private SqlSession session;	
	
	//글 업로드	
	@Override
	public void insert(MonthDto dto) {
		session.insert("month.insert",dto);
	}
	
	//글 목록
	@Override
	public List<MonthDto> getlist(MonthDto dto) {
		List<MonthDto> list=session.selectList("month.getList",dto);
		return list;
	}
	
	//글 갯수
	@Override
	public int getCount(MonthDto dto) {
		int count=session.selectOne("month.getCount",dto);
		return count;
	}
	
	//글 하나의 데이터 가져오기
	@Override
	public MonthDto getData(int num) {
		MonthDto dto=session.selectOne("month.getData",num);
		return dto;
	}
	
	@Override
	public void update(MonthDto dto) {
		session.update("month.update",dto);		
	}
	
	@Override
	public void delete(int num) {
		session.delete("month.delete",num);		
	}
	
	@Override
	public void addViewCount(int num) {
		session.update("month.addViewCount",num);				
	}
}
