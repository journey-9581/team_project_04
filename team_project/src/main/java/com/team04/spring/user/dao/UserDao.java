package com.team04.spring.user.dao;

import com.team04.spring.user.dto.UserDto;

public interface UserDao {
	//회원정보 저장
	public void insert(UserDto dto);
	//가입정보 리턴
	public UserDto getData(String id);
	//회원가입 정보 삭제
	public void delete(String id);
	//회원가입 정보 수정
	public void update(UserDto dto);
	//인자로 전달된 아이디에 해당하는 비밀번호 
	public String getPwd(String id);
	//비밀번호 수정
	public boolean updatePwd(UserDto dto);
	//아이디 존재 여부 리턴
	public boolean isExist(String id);
	//프로필 이미지 경로 수정
	public void updateProfile(UserDto dto);
	//매니저 확인
	public String getManage(String id);
	//유료회원 확인
	public String getPremium(String id);
}
