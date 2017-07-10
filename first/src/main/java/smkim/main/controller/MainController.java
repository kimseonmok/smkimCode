package smkim.main.controller;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import smkim.main.service.MainService;

@Controller
public class MainController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private MainService mainService;
    
    @RequestMapping(value="/main.do")
    public ModelAndView openSampleList(Map<String,Object> commandMap) throws Exception{
        ModelAndView mv = new ModelAndView("/main");
        log.debug("인터셉터 테스트");
        
        mainService.getMain();
         
        return mv;
    }


}
