package smkim.board.dao;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import smkim.board.dto.BoardDTO;

@Repository("boardDAO")
public class BoardDAO {
	
	protected Log log = LogFactory.getLog(this.getClass());

	@Autowired
    private SqlSessionTemplate sqlSession;
	
	private static String namespace = "board.";


	public List<BoardDTO> getBoardList(BoardDTO boardDTO) {
		return sqlSession.selectList(namespace + "getBoardList",boardDTO);
	}


	public int insertBoard(BoardDTO boardDTO) {
		return sqlSession.insert(namespace + "insertBoard",boardDTO);
	}


	public BoardDTO getBoardDetail(String brdNum) {
		return sqlSession.selectOne(namespace + "getBoardDetail", brdNum);
	}

}
