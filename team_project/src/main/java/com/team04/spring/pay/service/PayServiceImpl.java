package com.team04.spring.pay.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team04.spring.pay.dao.PayDao;
import com.team04.spring.pay.dto.PayDto;

@Service
public class PayServiceImpl implements PayService{
	
	@Autowired
	private PayDao dao;

	@Override
	public void addPayInfo(PayDto dto) {
		dao.insert(dto);
	}

}
