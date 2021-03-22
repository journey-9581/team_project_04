package com.team04.spring.premium.dao;

import java.util.List;

import com.team04.spring.premium.dto.PremiumDto;

public interface PremiumDao {
	public PremiumDto getData(int num);
	public void insert(PremiumDto dto);
	public List<PremiumDto> getList(PremiumDto dto);
	public int getCount();
	public void delete(int num);
	public void update(PremiumDto dto);
}