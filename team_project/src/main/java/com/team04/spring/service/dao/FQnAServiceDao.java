package com.team04.spring.service.dao;

import java.sql.*;
import java.util.*;

import com.team04.spring.service.dto.*;


public interface FQnAServiceDao {
	public List<FQnADto> getList(HashMap<String, Integer> map) throws ClassNotFoundException, SQLException;
	public int getCount(int isQnA) throws ClassNotFoundException, SQLException;
	public void insert(FQnADto dto) throws SQLException, ClassNotFoundException;
	public void update(FQnADto dto) throws SQLException, ClassNotFoundException;
	public void delete(int id) throws ClassNotFoundException, SQLException;
	public FQnADto detail(int num) throws SQLException;
	public void reply(FQnADto dto) throws SQLException, ClassNotFoundException;
}