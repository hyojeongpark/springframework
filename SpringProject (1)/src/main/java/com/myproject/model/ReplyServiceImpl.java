package com.myproject.model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.myproject.dto.ReplyDTO;
import com.myproject.mapper.BoardMapper;
import com.myproject.mapper.ReplyMapper;

@Service
public class ReplyServiceImpl implements ReplyService{
	@Autowired
	private ReplyMapper rmapper;
	@Autowired
	private BoardMapper bmapper;
	
	@Transactional
	@Override
	public void insert(ReplyDTO reply) { //service랑 이어진 부분
		bmapper.updateReplyCnt(reply.getBnum(),1);
		rmapper.insert(reply); 
	}
	
	@Override
	public List<ReplyDTO> getList(int bnum) {
		return rmapper.getList(bnum);
	}
	
	@Transactional
	@Override
	public void replyDelete(int rnum) {
		// TODO Auto-generated method stub
		ReplyDTO reply=rmapper.read(rnum);
			bmapper.updateReplyCnt(reply.getBnum(), -1);
			rmapper.delete(rnum);
		}
	
	}

