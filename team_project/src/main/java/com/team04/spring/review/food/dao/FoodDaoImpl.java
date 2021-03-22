package com.team04.spring.review.food.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.review.food.dto.FoodDto;


@Repository
public class FoodDaoImpl implements FoodDao{
	//핵심 의존객체 DI
	@Autowired
	private SqlSession session;	
	
	//글 업로드	
	@Override
	public void insert(FoodDto dto) {
		session.insert("food.insert",dto);
	}
	
	//글 목록
	@Override
	public List<FoodDto> getlist(FoodDto dto) {
		List<FoodDto> list=session.selectList("food.getList",dto);
		return list;
	}
	
	//글 갯수
	@Override
	public int getCount(FoodDto dto) {
		int count=session.selectOne("food.getCount",dto);
		return count;
	}
	
	//글 하나의 데이터 가져오기
	@Override
	public FoodDto getData(int num) {
		FoodDto dto=session.selectOne("food.getData",num);
		return dto;
	}
	
	@Override
	public void update(FoodDto dto) {
		session.update("food.update",dto);		
	}
	
	@Override
	public void delete(int num) {
		session.delete("food.delete",num);		
	}
	
	@Override
	public void addViewCount(int num) {
		session.update("food.addViewCount",num);				
	}
}
