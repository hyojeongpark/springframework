package com.myproject.mapper;


import java.util.HashMap;
import java.util.List;
import org.apache.ibatis.annotations.Param;

import com.myproject.dto.BoardDTO;

public interface BoardMapper {
	//추가 전체보기 
	public void insert(BoardDTO board); 
	
	public List<BoardDTO> findAll(HashMap<String, Object> hm);  	//��ü����
	
	public BoardDTO findByNum(int num); // �󼼺���
	//삭제하기
	public void delete(int num);
	//게시글 수
	 public int count(HashMap<String, Object> hm);
	//조회수
	public void hitcount(int num);
	//댓글수
	public void updateReplyCnt(@Param("bnum") int bnum, @Param("amount") int amount);
	//글 수정하기
	public void update(BoardDTO board);
}
