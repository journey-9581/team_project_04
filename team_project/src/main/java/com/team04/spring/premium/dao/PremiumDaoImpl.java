package com.team04.spring.premium.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.premium.dto.PremiumDto;

@Repository
public class PremiumDaoImpl implements PremiumDao{
	@Autowired
	private SqlSession session;
		
	@Override
	public PremiumDto getData(int num) {
		return session.selectOne("premium.getData", num);
	}

	@Override
	public void insert(PremiumDto dto) {
		session.insert("premium.insert", dto);
	}

	@Override
	public List<PremiumDto> getList(PremiumDto dto) {
		return session.selectList("premium.getList", dto);
	}

	@Override
	public int getCount() {
		return session.selectOne("premium.getCount");
	}

	@Override
	public void delete(int num) {
		session.delete("premium.delete",num);
		
	}
	@Override
	public void update(PremiumDto dto) {
		session.update("premium.update",dto);
		
	}
	
}