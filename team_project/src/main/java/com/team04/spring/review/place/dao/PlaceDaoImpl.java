package com.team04.spring.review.place.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.review.place.dto.PlaceDto;

@Repository
public class PlaceDaoImpl implements PlaceDao{

	//핵심 의존객체 DI
	@Autowired
	private SqlSession session;	
	
	//글 업로드	
	@Override
	public void insert(PlaceDto dto) {
		session.insert("place.insert",dto);
	}
	
	//글 목록
	@Override
	public List<PlaceDto> getlist(PlaceDto dto) {
		List<PlaceDto> list=session.selectList("place.getList",dto);
		return list;
	}
	
	//글 갯수
	@Override
	public int getCount(PlaceDto dto) {
		int count=session.selectOne("place.getCount",dto);
		return count;
	}
	
	//글 하나의 데이터 가져오기
	@Override
	public PlaceDto getData(int num) {
		PlaceDto dto=session.selectOne("place.getData",num);
		return dto;
	}
	
	@Override
	public void update(PlaceDto dto) {
		session.update("place.update",dto);		
	}
	
	@Override
	public void delete(int num) {
		session.delete("place.delete",num);		
	}
	
	@Override
	public void addViewCount(int num) {
		session.update("place.addViewCount",num);				
	}
}
