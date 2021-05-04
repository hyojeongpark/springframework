package com.myproject.mapper;

import java.util.List;

import com.myproject.dto.ReplyDTO;

public interface ReplyMapper {
	  public List<ReplyDTO> getList(int bnum);
	  public void insert(ReplyDTO  reply);
	  public void delete(int rnum);
	  public ReplyDTO read(int rnum);
}

