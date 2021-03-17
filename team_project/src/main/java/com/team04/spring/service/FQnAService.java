package com.team04.spring.service;

import java.sql.*;
import java.util.*;

import org.springframework.stereotype.*;

import com.team04.spring.service.entity.*;

@Service
public interface FQnAService {
public List<FQnA> getList(int page, int isQnA) throws ClassNotFoundException, SQLException;
	public int getCount(int isQnA) throws ClassNotFoundException, SQLException;
	public void insert(FQnA dto) throws SQLException, ClassNotFoundException;
	public int update(FQnA dto) throws SQLException, ClassNotFoundException;
	public void delete(int id) throws ClassNotFoundException, SQLException;
	public FQnA detail(int num) throws SQLException;
	public void reply(int num, FQnA dto) throws SQLException, ClassNotFoundException;
}