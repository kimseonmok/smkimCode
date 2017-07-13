package smkim.member.service.impl;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import smkim.member.dao.MemberDAO;
import smkim.member.dto.LoginDTO;
import smkim.member.dto.MemberDTO;
import smkim.member.service.MemberService;

@Service("memberService")
public class MemberServiceImpl implements MemberService{
	
	Logger log = Logger.getLogger(this.getClass());
	
	@Resource(name="memberDAO")
	private MemberDAO memberDAO;

	@Override
	public boolean memberJoin(MemberDTO memberDTO) throws Exception{
		
		int resultCnt = memberDAO.insertMbr(memberDTO);
		
		if(resultCnt > 0){
			return true;
		}
		
		return false;
		
	}

	@Override
	public boolean idCheck(MemberDTO memberDTO) throws Exception {
		
		int resultCnt = memberDAO.idCheck(memberDTO);
		
		if(resultCnt == 0){
			return true;
		}
		
		return false;
	}

	@Override
	public boolean memberlogin(MemberDTO memberDTO,HttpServletRequest request) throws Exception {

		LoginDTO loginDTO = memberDAO.getMbrInfo(memberDTO);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginDTO", loginDTO);
		
		if(loginDTO != null){
			return true;
		}
		
		
		return false;
	}
}
