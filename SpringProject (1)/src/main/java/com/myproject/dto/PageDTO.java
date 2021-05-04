package com.myproject.dto;

import com.myproject.dto.PageDTO;

import lombok.Data;

@Data
public class PageDTO {

	private int totalCount; // ��ü �۰���
	private int pageCount; // �� �ʿ��� ������ ��(������ ������ ��ȣ)
	private int pageBlock;	// �� ������ �� ǥ�õǴ� �������� ��
	private int startPage;	// ��������� ������ ���������� ��ȣ
	private int endPage;	// ��������� ������ �������� ��ȣ
	private int pageNum ;
}
