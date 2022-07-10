package com.test.mvc;

import java.sql.SQLException;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 관리자 로그인 폼
	@RequestMapping(value = "/adloginform.action", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, HttpSession session, Model model) throws SQLException
	{ 
		String result = "/AdLogin.jsp"; 
		return result; 
	}

	// 관리자 로그인 
	@RequestMapping(value = "/adlogin.action", method = RequestMethod.POST)
	public String adLogin(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto, boolean rememberId) throws SQLException 
	{ 
		String result = null;
	 
		// 관리자가 입력한 데이터 수신(→ AdLogin.jsp 페이지로부터 넘어온 데이터 수신)
		String ad_id = request.getParameter("ad_id");
		String ad_pw = request.getParameter("ad_pw");
	 
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);

		dto = dao.adLogin(ad_id, ad_pw);

		// 로그인 수행에 따른 성공 여부 확인 및 구분/분기
		if(dto != null) 	
		{ 
			// 로그인 성공
			model.addAttribute("ad_cd", dto.getAd_cd());
			model.addAttribute("ad_id", dto.getAd_id());
			 
			// 세션에 값 저장하기
			session.setAttribute("ad_cd", dto.getAd_cd());
			session.setAttribute("ad_id", ad_id);
			
			if (rememberId) {
	            //      1. 쿠키를 생성
	            Cookie cookie = new Cookie("id", ad_id);
	            //      2. 응답에 저장
	            response.addCookie(cookie);

	        } else {
	            // 쿠키를 삭제
	            Cookie cookie = new Cookie("id", ad_id);
	            cookie.setMaxAge(0);    // 쿠키를 삭제
	            //      2. 응답에 저장
	            response.addCookie(cookie);
	        }
			 
			result = "/admain.action";
		} 
		else 
		{ 
			// 로그인 실패
			request.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			result = "/AdLogin.jsp";
		}
		 	return result; 
	}
		
	
	// 관리자 메인페이지
	@RequestMapping(value = "/admain.action", method = {RequestMethod.GET, RequestMethod.POST}) 
	public String adMain(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, AdminDTO dto) throws SQLException
	{
		String result = null;
		
		IAdminDAO dao = sqlSession.getMapper(IAdminDAO.class);
		
		// 세션에 있는 관리자 cd, id를 dto에 set 
	 	dto.setAd_cd((String)session.getAttribute("ad_cd"));
	 	dto.setAd_id((String)session.getAttribute("ad_id"));
	 	 
	 	// 오늘의 할일
		model.addAttribute("countPostRept", dao.mainCountPostRept());
		model.addAttribute("countCmntRept", dao.mainCountCmntRept());
		model.addAttribute("countQna", dao.mainCountQna());
		
		// 공지사항
		model.addAttribute("mainNotiList", dao.mainNotiList(dto));
		
		// 신규회원 현황
		model.addAttribute("userCount", dao.mainUserCount());
		model.addAttribute("newUserCount", dao.mainNewUserCount());
		model.addAttribute("leaveUserCount", dao.mainLeaveUserCount());
		
		
		
		result = "/AdMain.jsp";
		return result;
	}
	
	
	// 관리자 로그아웃
	@RequestMapping(value="/adminlogout.action", method=RequestMethod.GET)
	public String adLogout(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws SQLException 
	{
		String result = null;
    	
    	session.removeAttribute("ad_cd");
    	session.removeAttribute("ad_id");
    	
    	result = "/adloginform.action";
    	return result;
	}


}
