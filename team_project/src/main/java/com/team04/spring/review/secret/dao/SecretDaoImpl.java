package com.team04.spring.review.secret.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.review.secret.dto.SecretDto;

@Repository
public class SecretDaoImpl implements SecretDao{

	//핵심 의존객체 DI
	@Autowired
	private SqlSession session;	
	
	//글 업로드	
	@Override
	public void insert(SecretDto dto) {
		session.insert("secret.insert",dto);
	}
	
	//글 목록
	@Override
	public List<SecretDto> getlist(SecretDto dto) {
		List<SecretDto> list=session.selectList("secret.getList",dto);
		return list;
	}
	
	//글 갯수
	@Override
	public int getCount(SecretDto dto) {
		int count=session.selectOne("secret.getCount",dto);
		return count;
	}
	
	//글 하나의 데이터 가져오기
	@Override
	public SecretDto getData(int num) {
		SecretDto dto=session.selectOne("secret.getData",num);
		return dto;
	}
	
	@Override
	public void update(SecretDto dto) {
		session.update("secret.update",dto);		
	}
	
	@Override
	public void delete(int num) {
		session.delete("secret.delete",num);		
	}
	
	@Override
	public void addViewCount(int num) {
		session.update("secret.addViewCount",num);				
	}
}
