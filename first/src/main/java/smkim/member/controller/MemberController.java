package smkim.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import smkim.member.dto.MemberDTO;
import smkim.member.service.MemberService;

@Controller
public class MemberController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MemberService memberService;
    
    @RequestMapping(value="/member/loginPage.do")
    public ModelAndView loginPage() throws Exception{
        ModelAndView mv = new ModelAndView("/member/login");
        
        return mv;
    }
    
    @RequestMapping(value="/member/login.do")
    @ResponseBody
    public Map<String,Object> login(MemberDTO memberDTO,HttpServletRequest request) throws Exception{
    	
    	Map<String,Object> map = new HashMap<String,Object>();
    	
    	boolean flag = memberService.memberlogin(memberDTO,request);
    	
    	map.put("flag", flag);
        
        return map;
    }
    
    @RequestMapping(value="/member/joinPage.do")
    public ModelAndView joinPage() throws Exception{
        ModelAndView mv = new ModelAndView("/member/join");
        
        return mv;
    }
    
    @RequestMapping(value="/member/join.do")
    @ResponseBody
    public Map<String,Object> join(MemberDTO memberDTO) throws Exception{
    	
    	Map<String,Object> map = new HashMap<String,Object>();
    	
    	boolean flag = memberService.memberJoin(memberDTO);
    	
    	map.put("flag", flag);
        
        return map;
    }
    
    @RequestMapping(value="/member/idCheck.do")
    @ResponseBody
    public Map<String,Object> idCheck(MemberDTO memberDTO) throws Exception{
    	
    	
    	
    	Map<String,Object> map = new HashMap<String,Object>();
    	
    	boolean flag = memberService.idCheck(memberDTO);
    	
    	log.debug(flag);
    	
    	map.put("flag", flag);
        
        return map;
    }
    
    
    
}
