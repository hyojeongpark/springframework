package com.myproject.mapper;

import com.myproject.dto.AccountDTO;

public interface AccountMapper {
		//추가
		 public void aInsert(AccountDTO account);
		//로그인 체크
		 public AccountDTO afindById(String id);
		//회원수정
		 public void aUpdate(AccountDTO account);
		//회원삭제
		 public void aDelete(String id);
		
}
