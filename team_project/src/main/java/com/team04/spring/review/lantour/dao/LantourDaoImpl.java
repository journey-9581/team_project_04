package com.team04.spring.review.lantour.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.review.lantour.dto.LantourDto;

@Repository
public class LantourDaoImpl implements LantourDao{

	//핵심 의존객체 DI
	@Autowired
	private SqlSession session;	
	
	//글 업로드	
	@Override
	public void insert(LantourDto dto) {
		session.insert("lantour.insert",dto);
	}
	
	//글 목록
	@Override
	public List<LantourDto> getlist(LantourDto dto) {
		List<LantourDto> list=session.selectList("lantour.getList",dto);
		return list;
	}
	
	//글 갯수
	@Override
	public int getCount(LantourDto dto) {
		int count=session.selectOne("lantour.getCount",dto);
		return count;
	}
	
	//글 하나의 데이터 가져오기
	@Override
	public LantourDto getData(int num) {
		LantourDto dto=session.selectOne("lantour.getData",num);
		return dto;
	}
	
	@Override
	public void update(LantourDto dto) {
		session.update("lantour.update",dto);		
	}
	
	@Override
	public void delete(int num) {
		session.delete("lantour.delete",num);		
	}
	
	@Override
	public void addViewCount(int num) {
		session.update("lantour.addViewCount",num);				
	}
}
