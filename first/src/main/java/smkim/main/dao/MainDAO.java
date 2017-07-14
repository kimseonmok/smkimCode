package smkim.main.dao;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("mainDAO")
public class MainDAO {
	
	protected Log log = LogFactory.getLog(this.getClass());

	@Autowired
    private SqlSessionTemplate sqlSession;
	
	private static String namespace = "main.";

	public void getMain() {
		sqlSession.selectList(namespace + "getMain");
	}


}
