package com.myproject.app01;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.myproject.dto.AccountDTO;
import com.myproject.model.AccountService;

@RequestMapping("/account/*")
@Controller
public class AccountController {
	@Autowired
	private AccountService aService;

	@GetMapping
	public String join() {
		return "account/join";
	}

	@PostMapping("join")
	public String join(AccountDTO account) {
		System.out.println(account);
		aService.insert(account);
		return "account/login";
	}
	//���̵� �ߺ�Ȯ��
	@GetMapping("idCheck")
	public void idCheck() {
	}
	@PostMapping("idCheck")
	@ResponseBody
	public String idCheck(String id) {
		AccountDTO account =aService.findById(id);
		String result="";
		if(account==null) result="success";
		else result="fail";
		return result;
	}
	//�α����ϱ�
	@GetMapping("login")
	public void login() {
		
	}
	//�α��� üũ�ϱ�
	@PostMapping("loginCheck")
	@ResponseBody
	public String login(HttpSession session, String id, String pass) {
		String result="";
		AccountDTO account = aService.findById(id);
		if(account==null) {
			result="fail";
		}else if(account.getPass().equals(pass)) { //�������
			session.setAttribute("sessId", id);
			result="success";
		}else { //pass ����
			result="passfail";
		}
		return result;
	}
	
	//로그아웃
	@GetMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:login";
		
	}
	//회원변경
	@GetMapping("update")
	public String update(Model model, HttpSession session) {
		String id = (String) session.getAttribute("sessId");
		 AccountDTO account = aService.findById(id);
		 model.addAttribute("account",account);
		return "account/update";
	}
	@PutMapping("update")
	  @ResponseBody
	  public String update(@RequestBody AccountDTO account,HttpSession session) {
		  aService.update(account);
		//String id =  (String)session.getAttribute("sessId");
		session.invalidate();
		return "success";
	}
	//회원탈퇴
	@GetMapping("delete")
	public String delete(HttpSession session) {
	String id= (String)session.getAttribute("sessId");
	aService.delete(id);
	session.invalidate();
	return "redirect:login";
	}
	
	//shop에 id 자동입력
	@GetMapping("shopaccount")
	public void idinsert() {};
}