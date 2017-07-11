package smkim.member.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class MemberController {
//	@Autowired
//	private MemberService memberService;
    
    @RequestMapping(value="/member/loginPage.do")
    public ModelAndView openSampleList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/member/login");
        
        return mv;
    }
}
