package smkim.main.service.impl;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import smkim.main.dao.MainDAO;
import smkim.main.service.MainService;

@Service("mainService")
public class MainServiceImpl implements MainService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="mainDAO")
	private MainDAO mainDAO;

	@Override
	public void getMain() {
		log.debug("ServiceImpl ::: ");
		mainDAO.getMain();
	}

}
