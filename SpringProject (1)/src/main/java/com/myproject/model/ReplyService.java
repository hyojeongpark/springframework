package com.myproject.model;

import java.util.List;

import com.myproject.dto.ReplyDTO;

public interface ReplyService {
	public void insert(ReplyDTO reply) ;
	public List<ReplyDTO> getList(int bnum); //bnum=boardnum
	public void replyDelete(int rnum);
}
