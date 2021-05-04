package com.myproject.app01;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.dto.PageDTO;
import com.myproject.dto.BoardDTO;
import com.myproject.model.BoardService;

/**
 * Handles requests for the application home page.
 */
@Controller
//@RequestMapping("/member")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	@Autowired
	private BoardService service;
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
				
		return "redirect:/home";
	}
	//메인화면 home
	@GetMapping("home")
	public String home() {
		return "home";
	}
	@GetMapping("map")
	public String map() {
		return "map";
	}
	//글쓰기
	@GetMapping("boardInsert")
	public String insert() {
		return "boardInsert";
	}
	@PostMapping("boardInsert")
	public String insert(BoardDTO board) {
		service.insert(board);
		return "redirect:/boardList";
	}
	//글 수정하기
	@PostMapping("boardUpdate") //여기에 들어가는 건 jsp파일이름? 
	public String update(BoardDTO board) {
		service.update(board);
		 
		return "redirect:/boardList";
	}

	
	//리스트
	@GetMapping("boardList")
	public void list(Model model,String field, String word, String strPageNum) {
		strPageNum = (strPageNum == null) ? "1" : strPageNum ;
		int pageNum = Integer.parseInt(strPageNum);
		HashMap<String, Object> hm = new HashMap<String, Object>(); //String, Object ������
		hm.put("field",field);
		hm.put("word",word);
		
		int totalCount = service.getCount(hm);
		int pageSize=5;
		int pageBlock= 3;
		int pageCount = (int) Math.ceil((double) totalCount / pageSize);
	//	int startPage = ((pageNum / pageBlock) - (pageNum % pageBlock == 0 ? 1 : 0)) * pageBlock + 1;
		int startPage =  ((pageNum)/pageBlock)*pageBlock+1;
				// 1/3*3+1   ==> 1
				// 4/3*3 + 1   ==>4
		       // 5/3*3 +1    ==>4
		int endPage = startPage + pageBlock - 1;
		if(endPage > pageCount) {
			endPage = pageCount;
		}
		PageDTO pageDto = new PageDTO();
		pageDto.setPageCount(pageCount);
		pageDto.setPageBlock(pageBlock);
		pageDto.setStartPage(startPage);
		pageDto.setEndPage(endPage);
		pageDto.setTotalCount(totalCount);
		pageDto.setPageNum(pageNum);
		
		int startRow = (pageNum-1)*pageSize;
		hm.put("startRow",startRow);
		hm.put("pageSize", pageSize);
		
		List<BoardDTO> lists = service.findAll(hm);
		
		model.addAttribute("listResult", lists);
		model.addAttribute("count", totalCount);
		model.addAttribute("pageDto",pageDto);
	}
	//상세보기
	@GetMapping("view/{num}")
	public String view(Model model, @PathVariable int num) {
		BoardDTO board= service.findByNum(num);
		model.addAttribute("board", board);
		return "boardView";
	}
	
	//삭제
	@PostMapping("delete1/{num}") //@Controller는 get과 post방식만 쓸수있다 deletemapping은 X
	@ResponseBody
	public String delete(@PathVariable int num) {
		service.delete(num);
		return "redirect:/boardList";
	}

}
