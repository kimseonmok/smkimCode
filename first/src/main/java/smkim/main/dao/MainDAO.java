package smkim.main.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class MainDAO {
	
	protected Log log = LogFactory.getLog(MainDAO.class);

	@Autowired
    private SqlSessionTemplate sqlSession;


}
