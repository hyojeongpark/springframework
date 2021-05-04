package com.myproject.model;

import com.myproject.dto.AccountDTO;

public interface AccountService {
	//id 생성하기
	public void insert(AccountDTO account);
	//id 찾기
	public AccountDTO findById(String id);
	//id 삭제하기
	public void delete(String id);
	//id 업데이트
	public void update(AccountDTO account);
}
