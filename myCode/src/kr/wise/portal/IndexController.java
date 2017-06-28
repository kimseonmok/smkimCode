package kr.wise.portal;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {


	@RequestMapping("/")
	public String goLogin(HttpSession session, Model model) throws Exception {
		
			return "/main";
	
	}

	

}
