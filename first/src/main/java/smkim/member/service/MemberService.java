package smkim.member.service;

import javax.servlet.http.HttpServletRequest;

import smkim.member.dto.MemberDTO;

public interface MemberService {

	boolean memberJoin(MemberDTO memberDTO) throws Exception;

	boolean idCheck(MemberDTO memberDTO) throws Exception;

	boolean memberlogin(MemberDTO memberDTO,HttpServletRequest request) throws Exception;

}
