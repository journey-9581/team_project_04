package com.team04.spring.service;

import java.sql.*;
import java.util.*;

import org.springframework.stereotype.*;

import com.team04.spring.service.entity.*;

@Service
public interface FQnAService {
public List<FQnA> getList(int page, String field, String query, int isQnA) throws ClassNotFoundException, SQLException;
	public int getCount() throws ClassNotFoundException, SQLException;
	public int insert(FQnA notice) throws SQLException, ClassNotFoundException;
	public int update(FQnA notice) throws SQLException, ClassNotFoundException;
	public int delete(int id) throws ClassNotFoundException, SQLException;
}