package smkim.board.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import smkim.board.dto.BoardDTO;
import smkim.board.service.BoardService;
import smkim.member.dto.LoginDTO;

@Controller
public class BoardController {
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardService boardService;
    
    @RequestMapping(value="/board/boardListPage.do")
    public ModelAndView boardListPage() throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardlist");
        
        return mv;
    }

    @RequestMapping(value="/board/getBoardList.do")
    @ResponseBody
    public Map<String,Object> getBoardList(BoardDTO boardDTO) throws Exception{

    	Map<String,Object> map = new HashMap<String,Object>();
    	
    	List<BoardDTO> list = boardService.getBoardList(boardDTO);
    	int listCnt = boardService.getBoardListCnt(boardDTO);
    	map.put("list", list);
    	map.put("listCnt", listCnt);
    	
    	
        return map;
    }

    @RequestMapping(value="/board/boardWritePage.do")
    public ModelAndView boardWritePage(String brdNum) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boardwrite");
        
        BoardDTO boardDTO;
        
        if(brdNum==null || brdNum.equals("")){
        	boardDTO = new BoardDTO();
        }else{
        	boardDTO = boardService.getBoardDetail(brdNum);
        }
        
        
        mv.addObject("boardDTO", boardDTO);
        
        return mv;
    }
    
    @RequestMapping(value="board/insertBoard.do")
    @ResponseBody
    public Map<String,Object> insertBoard(BoardDTO boardDTO,HttpSession session) throws Exception{
    	
    	

    	Map<String,Object> map = new HashMap<String,Object>();
    	
    	LoginDTO loginDTO = (LoginDTO)session.getAttribute("loginDTO");
    	
    	boardDTO.setMbrNum(loginDTO.getMbrNum());
    	
    	log.debug(boardDTO);
    	
    	boolean flag = boardService.insertBoard(boardDTO);
    	
    	map.put("flag", flag);
    	
    	
        return map;
    }
    
    @RequestMapping(value="/board/updateBoard.do")
    @ResponseBody
    public Map<String,Object> updateBoard(BoardDTO boardDTO) throws Exception{
    	
    	Map<String,Object> map = new HashMap<String,Object>();
    	
    	log.debug(boardDTO);
    	
    	boolean flag = boardService.updateBoard(boardDTO);
    	
    	map.put("flag", flag);
    	
    	
        return map;
    }
    
    
    
    @RequestMapping(value="/board/boardDetailPage.do")
    public ModelAndView boardDetailPage(String brdNum) throws Exception{
        ModelAndView mv = new ModelAndView("/board/boarddetail");
        
        BoardDTO boardDTO = boardService.getBoardDetail(brdNum);
        
        mv.addObject("boardDTO", boardDTO);
        
        return mv;
    }
    
}
