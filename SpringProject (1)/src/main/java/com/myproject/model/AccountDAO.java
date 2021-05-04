package com.myproject.model;

import com.myproject.dto.AccountDTO;

public interface AccountDAO {
	//�߰�
	public void adao_insert(AccountDTO account);
	//�󼼺���
	public AccountDTO adao_findById(String id);
	//����
	public void adao_update(AccountDTO account);
	//����
	public void adao_delete(String id);
}
