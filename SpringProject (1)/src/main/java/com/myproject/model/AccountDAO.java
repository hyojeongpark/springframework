package com.myproject.model;

import com.myproject.dto.AccountDTO;

public interface AccountDAO {
	//추가
	public void adao_insert(AccountDTO account);
	//상세보기
	public AccountDTO adao_findById(String id);
	//수정
	public void adao_update(AccountDTO account);
	//삭제
	public void adao_delete(String id);
}
