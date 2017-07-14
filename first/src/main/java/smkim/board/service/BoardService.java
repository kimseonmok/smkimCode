package smkim.board.service;

import java.util.List;

import smkim.board.dto.BoardDTO;

public interface BoardService {

	List<BoardDTO> getBoardList(BoardDTO boardDTO) throws Exception;

	boolean insertBoard(BoardDTO boardDTO) throws Exception;

	BoardDTO getBoardDetail(String brdNum) throws Exception;

	boolean updateBoard(BoardDTO boardDTO) throws Exception;

}
