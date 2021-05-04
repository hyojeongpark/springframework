package com.myproject.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.myproject.dto.BoardDTO;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDAOImpl dao;

	@Override
	public void insert(BoardDTO board) {
		dao.dao_insert(board);
	}

	@Override
	public List<BoardDTO> findAll(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return dao.dao_findAll(hm);
	}

	@Override
	public BoardDTO findByNum(int num) {
		// TODO Auto-generated method stub
		
		return dao.dao_findByNum(num);
	}

	@Override
	public void delete(int num) {
		// TODO Auto-generated method stub
		dao.dao_delete(num);
	}

	@Override
	public int getCount(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return dao.dao_getCount(hm);
	}

	@Override
	public void update(BoardDTO board) {
		dao.dao_update(board);

	}

}
