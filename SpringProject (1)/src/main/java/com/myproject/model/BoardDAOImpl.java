package com.myproject.model;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.myproject.dto.BoardDTO;
import com.myproject.mapper.BoardMapper;

@Repository
public class BoardDAOImpl implements BoardDAO {
	@Autowired
	private BoardMapper mapper;
	@Override
	public void dao_insert(BoardDTO board) {
		mapper.insert(board);
	}

	@Override
	public List<BoardDTO> dao_findAll(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return mapper.findAll(hm);
	}

	@Override
	public BoardDTO dao_findByNum(int num) {
		// TODO Auto-generated method stub
		mapper.hitcount(num); //view에 들어갈때 화면을 불러주면서 조회수 증가
		return mapper.findByNum(num);
	}


	@Override
	public void dao_delete(int num) {
		// TODO Auto-generated method stub
		mapper.delete(num);
	}

	@Override
	public int dao_getCount(HashMap<String, Object> hm) {
		// TODO Auto-generated method stub
		return mapper.count(hm);
	}

	@Override
	public void dao_hitCount(int num) {
		// TODO Auto-generated method stub
		mapper.hitcount(num);
	}

	@Override
	public void dao_update(BoardDTO board) {
		mapper.update(board);
	}

}
