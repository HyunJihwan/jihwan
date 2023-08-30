package kr.or.dw.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class BoardController {
	
	
	@RequestMapping("/board")
	public ModelAndView board (String mymenu, ModelAndView mnv , String mcode, HttpSession session) {
		String url = "";
		
		if(mymenu == null) {
			url = "/jihwan/boardMain.page";
		}else {
			url = "/jihwan/boardMain.mymenu";
		}
		
		MemberVO member = new MemberVO();
		mnv.addObject("member" , member);
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
}
