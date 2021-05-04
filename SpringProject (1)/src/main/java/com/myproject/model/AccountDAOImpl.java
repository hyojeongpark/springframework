package com.myproject.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myproject.dto.AccountDTO;
import com.myproject.mapper.AccountMapper;

@Repository
public class AccountDAOImpl implements AccountDAO {
	@Autowired
	private AccountMapper aMapper;
	@Override
	public void adao_insert(AccountDTO account) {
		aMapper.aInsert(account);
		
	}

	@Override
	public AccountDTO adao_findById(String id) {
		return aMapper.afindById(id);
	}

	@Override
	public void adao_update(AccountDTO account) {
		aMapper.aUpdate(account);
		
	}

	@Override
	public void adao_delete(String id) {
		aMapper.aDelete(id);
		
	}

}
