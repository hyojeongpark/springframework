package com.myproject.app01;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import com.myproject.dto.ShopDTO;
import com.myproject.model.ShopService;

@Controller
public class ShopController {
	@Autowired
	private ShopService sService;

	// 책list
	@GetMapping("book")
	public String booklist() {
		return "book";
	}
	// 책사기

	@GetMapping("shop")
	public String shop() {
		return "shop";
	}

	@PostMapping("shop")
	public String shopping(ShopDTO shop) {
		sService.insert(shop);
		return "redirect:/boardList";
	}

	@GetMapping("eventBoard")
	public List<ShopDTO> list(Model model,HttpSession session) {
		System.out.println(session.getAttribute("sessId"));
		List<ShopDTO> slist = sService.getList();
		System.out.println(slist.size());
		model.addAttribute("listResult",slist);
		return slist;
	}
}
