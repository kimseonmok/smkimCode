package smkim.common.logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import smkim.member.dto.LoginDTO;

public class LoggerInterceptor extends HandlerInterceptorAdapter {
    protected Log log = LogFactory.getLog(LoggerInterceptor.class);
     
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("======================================          START         ======================================");
            log.debug(" Request URI \t:  " + request.getRequestURI());
        }
        
        HttpSession session = request.getSession();
        
        String[] path = request.getRequestURI().split("/");
        
        if(!("member".equals(path[2]))){
	        if(session.getAttribute("loginDTO") != null){
	        	LoginDTO loginDTO = (LoginDTO)session.getAttribute("loginDTO");
	        	System.out.println("로그인됨 :: " + loginDTO.getMbrName());
	        }else{
	        	if(request.getRequestURI().equals("/smkim/main.do")){
	        		System.out.println("메인페이지 입니다 인터셉터 제외");
	        		return super.preHandle(request, response, handler);
	        	}else{
		        	System.out.println("로그인 안됨 로그인페이지로 감");
		        	response.sendRedirect("/smkim/member/loginPage.do");
		        	return false;
	        	}
	        }
        }
        
        
        return super.preHandle(request, response, handler);
    }
     
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        if (log.isDebugEnabled()) {
            log.debug("======================================           END          ======================================\n");
        }
    }
}


