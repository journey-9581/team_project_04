package com.team04.spring.pay.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.pay.dto.PayDto;

@Repository
public class PayDaoImpl implements PayDao {
	
	@Autowired
	private SqlSession session;

	@Override
	public void insert(PayDto dto) {
		session.insert("pay_list.insert", dto);
	}

}
