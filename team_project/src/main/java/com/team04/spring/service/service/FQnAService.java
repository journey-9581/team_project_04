package com.team04.spring.service.service;

import java.io.*;
import java.sql.*;

import javax.servlet.http.*;

import org.springframework.ui.*;

import com.team04.spring.service.dto.*;

public interface FQnAService {
public void getList(Model model, HttpServletRequest request) throws ClassNotFoundException, SQLException, UnsupportedEncodingException;
	public void insert(HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException;
	public void update(FQnADto dto, HttpServletRequest request) throws SQLException, ClassNotFoundException;
	public void delete(int id) throws ClassNotFoundException, SQLException;
	public FQnADto detail(int num) throws SQLException;
	public void reply(HttpServletRequest request) throws SQLException, ClassNotFoundException, UnsupportedEncodingException;
}