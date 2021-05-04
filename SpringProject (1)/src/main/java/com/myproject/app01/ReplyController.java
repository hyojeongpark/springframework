package com.myproject.app01;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.myproject.dto.ReplyDTO;
import com.myproject.model.ReplyService;

@RequestMapping("/reply/*")
@RestController
public class ReplyController {

	@Autowired
	private ReplyService rService;

	@PostMapping("replyInsert") // commentBtn누르면 댓글쓰기 insert되기
	public String insert(@RequestBody ReplyDTO reply) {
		rService.insert(reply);
		return "success";
	}

	// 댓글 목록
	@GetMapping("replyList")
	public List<ReplyDTO> list(int num) {
		List<ReplyDTO> rlist = rService.getList(num);
		System.out.println(rlist.size());
		return rlist;
	}
	// 댓글삭제
	@DeleteMapping("del/{rnum}")
	public int delete(@PathVariable("rnum") int rnum) {
	    rService.replyDelete(rnum);
	    return rnum;
	}
}
