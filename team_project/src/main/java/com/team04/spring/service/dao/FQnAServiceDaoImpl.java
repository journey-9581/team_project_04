package com.team04.spring.service.dao;

import java.sql.*;
import java.util.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import com.team04.spring.service.dto.*;

@Repository
public class FQnAServiceDaoImpl implements FQnAServiceDao {

	@Autowired
	private SqlSession session;	
	
	@Override
	public List<FQnADto> getList(HashMap<String, Integer> map) throws ClassNotFoundException, SQLException {
		List<FQnADto> list=session.selectList("fqna.getList",map);
		return list;
	}

	@Override
	public int getCount(int isQnA) throws ClassNotFoundException, SQLException {
		int count=session.selectOne("fqna.getCount",isQnA);
		return count;
	}

	@Override
	public void insert(FQnADto dto) throws SQLException, ClassNotFoundException {
		session.insert("fqna.insert",dto);
	}

	@Override
	public void update(FQnADto dto) throws SQLException, ClassNotFoundException {
		session.update("fqna.update",dto);
	}

	@Override
	public void delete(int num) throws ClassNotFoundException, SQLException {
		session.delete("fqna.delete",num);
		
	}

	@Override
	public FQnADto detail(int num) throws SQLException {
		FQnADto dto=session.selectOne("fqna.getData",num);
		return dto;
	}

	@Override
	public void reply(FQnADto dto) throws SQLException, ClassNotFoundException {
		session.insert("fqna.reply",dto);
		
	}
	
}
