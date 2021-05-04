package com.myproject.model;

import java.util.HashMap;
import java.util.List;

import com.myproject.dto.BoardDTO;

public interface BoardService {
	// �߰�
	public void insert(BoardDTO board);
	// ����Ʈ
	public List<BoardDTO> findAll(HashMap<String, Object> hm);
	// �󼼺���
	public BoardDTO findByNum(int num);
	// ����
	public int getCount(HashMap<String, Object> hm);
	//삭제
	public void delete(int num);
	//수정
	public void update(BoardDTO board);
}
