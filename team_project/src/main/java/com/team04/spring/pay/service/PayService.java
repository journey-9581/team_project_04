package com.team04.spring.pay.service;

import com.team04.spring.pay.dto.PayDto;

public interface PayService {
	//결제 저장 처리를 하는 메소드
	public void addPayInfo(PayDto dto);
}
