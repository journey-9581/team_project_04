package com.team04.spring.pay.dao;

import com.team04.spring.pay.dto.PayDto;

public interface PayDao {
	//결제 정보 저장
	public void insert(PayDto dto);
}
