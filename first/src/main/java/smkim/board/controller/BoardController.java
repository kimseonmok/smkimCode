package smkim.board.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import smkim.board.service.BoardService;

@Controller
public class BoardController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardService boardService;
    
    @RequestMapping(value="/board/boardListPage.do")
    public ModelAndView loginPage() throws Exception{
        ModelAndView mv = new ModelAndView("board/boardlist");
        
        return mv;
    }


	

}
