package smkim.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import smkim.board.dao.BoardDAO;
import smkim.board.dto.BoardDTO;
import smkim.board.service.BoardService;

@Service("boardService")
public class BoardServiceImpl implements BoardService{
	
	@Autowired
	BoardDAO boardDAO;

	@Override
	public List<BoardDTO> getBoardList(BoardDTO boardDTO) throws Exception{
		return boardDAO.getBoardList(boardDTO);
	}

	@Override
	public boolean insertBoard(BoardDTO boardDTO) throws Exception {
		
		int resultCnt = boardDAO.insertBoard(boardDTO);
		if(resultCnt>0){
			return true;
		}
		
		return false;
	}

	@Override
	public BoardDTO getBoardDetail(String brdNum) throws Exception {
		return boardDAO.getBoardDetail(brdNum);
	}

	@Override
	public boolean updateBoard(BoardDTO boardDTO) throws Exception {
		int resultCnt = boardDAO.updateBoard(boardDTO);
		if(resultCnt>0){
			return true;
		}
		
		return false;
	}

}
