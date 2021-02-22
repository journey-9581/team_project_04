package com.team04.spring.freeboard.service;

import com.team04.spring.freeboard.dto.FreeBoardDto;

public interface FreeBoardService {
	//새글을 저장하는 메소드
	public void saveContent(FreeBoardDto dto);
}
