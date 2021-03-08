package com.team04.spring.premium.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


import com.team04.spring.premium.dto.PremiumDto;

@Repository
public class PremiumDaoImpl implements PremiumDao{
	//핵심 의존객체 DI
	@Autowired
	private SqlSession session;	
	//글 업로드	
	@Override
	public void insert(PremiumDto dto) {
		session.insert("premium.insert",dto);
	}	
	//글 목록
	@Override
	public List<PremiumDto> getlist(PremiumDto dto) {
		List<PremiumDto> list=session.selectList("premium.getList",dto);
		return list;
	}
	//글 갯수
	@Override
	public int getCount(PremiumDto dto) {
		int count=session.selectOne("premium.getCount",dto);
		return count;
	}
	//글 하나의 데이터 가져오기
	@Override
	public PremiumDto getData(int num) {
		PremiumDto dto=session.selectOne("premium.getData",num);
		return dto;
	}
	@Override
	public void update(PremiumDto dto) {
		session.update("premium.update",dto);
		
	}
	@Override
	public void delete(int num) {
		session.delete("premium.delete",num);
		
		
	}
	@Override
	public void addViewCount(int num) {
		session.update("premium.addViewCount",num);
				
	}	
	
}
