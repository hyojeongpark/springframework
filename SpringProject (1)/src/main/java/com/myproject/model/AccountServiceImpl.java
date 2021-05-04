package com.myproject.model;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.dto.AccountDTO;
@Service
public class AccountServiceImpl implements AccountService{
	@Autowired
	private AccountDAO adao;
	@Override
	public void insert(AccountDTO account) {
		System.out.println("service" +account);
		adao.adao_insert(account);
		
	}
	@Override
	public AccountDTO findById(String id) {
		// TODO Auto-generated method stub
		return adao.adao_findById(id);
	}
	@Override
	public void delete(String id) {
		adao.adao_delete(id);
		
	}
	@Override
	public void update(AccountDTO account) {
		adao.adao_update(account);
		
	}
	

}
