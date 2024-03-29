package dw.com.spring;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping("/home")
	public void home() {};	// void 로 설정하면 현재 호출한 url의 경로로 뷰를 찾는다
	
	@RequestMapping("/member")
	public void member() {};
	
	@RequestMapping("/manager")
	public void manager() {};
	
	@RequestMapping("/admin")
	public void admin() {};
	
	@RequestMapping("/common/loginForm")
	public void loginForm() {};
		
	@RequestMapping("/security/accessDenied")
	public void accessDenied() {};
	
}
