package com.team04.spring.user.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.team04.spring.user.dto.UserDto;

@Repository
public class UserDaoImpl implements UserDao {

	@Autowired
	private SqlSession session;
	
	@Override
	public void insert(UserDto dto) {
		session.insert("user_team.insert", dto);
	}

	@Override
	public UserDto getData(String id) {
		UserDto dto=session.selectOne("user_team.getData", id);
		return dto;
	}

	@Override
	public void delete(String id) {
		session.delete("user_team.delete", id);
	}

	@Override
	public void update(UserDto dto) {
		session.update("user_team.update", dto);
	}

	@Override
	public String getPwd(String id) {
		String pwd=session.selectOne("user_team.getPwd", id);
		return pwd;
	}

	@Override
	public boolean updatePwd(UserDto dto) {
		int count=session.update("user_team.updatePwd", dto);
		if(dto==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public boolean isExist(String id) {
		UserDto dto=session.selectOne("user_team.isExist", id);
		if(dto==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void updateProfile(UserDto dto) {
		session.update("user_team.updateProfile", dto);
	}

	@Override
	public String getManage(String id) {
		String manage=session.selectOne("user_team.getManage", id);
		return manage;
	}

}
