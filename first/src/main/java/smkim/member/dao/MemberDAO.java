package smkim.member.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import smkim.main.dao.MainDAO;
import smkim.member.dto.LoginDTO;
import smkim.member.dto.MemberDTO;

@Repository("memberDAO")
public class MemberDAO {
	
	protected Log log = LogFactory.getLog(MainDAO.class);

	@Autowired
    private SqlSessionTemplate sqlSession;
	
	private static String namespace = "member.";


	public int insertMbr(MemberDTO memberDTO) {
		return sqlSession.insert(namespace + "insertMbr", memberDTO);
	}

	public int idCheck(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + "idCheck" , memberDTO);
	}

	public LoginDTO getMbrInfo(MemberDTO memberDTO) {
		return sqlSession.selectOne(namespace + "getMbrInfo" , memberDTO);
	}

}
