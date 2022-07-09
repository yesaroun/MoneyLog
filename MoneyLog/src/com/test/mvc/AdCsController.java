package com.test.mvc;

import java.sql.SQLException;
import java.util.ArrayList;

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
public class AdCsController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	// 공지사항 리스트 출력
	@RequestMapping(value="/adnotilist.action", method = RequestMethod.GET)
	public String adNotiList(Model model) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// dao 쿼리 실행 후 얻은 리스트 결과를 addAttribute()로 key adNotiList 에 담아 전송
		model.addAttribute("adNotiList", dao.adNotiList());
		
		result = "/AdNotiList.jsp";
		
		return result;
	}
	
	// 공지사항 글 보기
	@RequestMapping(value="/adnoticont.action", method=RequestMethod.GET)
	public String adNotiCont(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 이전 페이지에서 noti_cd 수신
		String noti_cd = request.getParameter("noti_cd");
		
		// noti_cd 로 dao 쿼리 실행 후 얻은 문의글 조회 결과를 addAttribute()로 key adNotiView 에 담아 전송
		model.addAttribute("adNotiView", dao.adNotiView(noti_cd));
		
		result = "/AdNotiCont.jsp";
		
		return result;
	}
	
	// 공지사항 수정하기 클릭 > 기존 데이터 가지고 업데이트 페이지 가기
	@RequestMapping(value="/adnotiupdateform.action", method=RequestMethod.GET)
	public String adNotiUpdateForm(Model model, HttpServletRequest request, HttpServletResponse response, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 이전 페이지에서 noti_cd 수신
		String noti_cd = request.getParameter("noti_cd");
		
		// noti_cd 로 dao 쿼리 실행 후 얻은 문의글 조회 결과를 addAttribute()로 key UpdateForm 에 담아 전송
		model.addAttribute("update", dao.adNotiView(noti_cd));
		
		result = "/AdNotiUpdate.jsp";
		
		return result;
	}
	
	// 수정한 공지사항 정보를 AdNotiCont.jsp 로 전송
	@RequestMapping(value="/adnotiupdate.action", method=RequestMethod.GET)
	public String adNotiUpdate(Model model, HttpServletRequest request, HttpServletResponse response, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 공지코드와 수정된 공지제목, 상단고정 여부, 내용 데이터 수신
		String noti_cd = request.getParameter("noti_cd");
		String noti_title = request.getParameter("noti_title");
		String noti_cont = request.getParameter("noti_cont");
		String noti_pin = request.getParameter("noti_pin");
		
		// dto 에 수정된 데이터 넣어주기
		dto.setNoti_cd(noti_cd);
		dto.setNoti_title(noti_title);
		dto.setNoti_pin(noti_pin);
		dto.setNoti_cont(noti_cont);
		
		// dao 의 수정 메소드 실행
		dao.adNotiModify(dto);
		
		// 수정된 데이터의 내용을 조회하는 메소드 실행 결과를 key-value에 담기
		model.addAttribute("update", dao.adNotiView(noti_cd));
		
		// 데이터 전송
		result = "/AdNotiUpdate.jsp";
		return result;
	}
	
	// 공지사항 삭제하기
	@RequestMapping(value="/notidelete.action", method=RequestMethod.GET)
	public String adNotiDelete(Model model, HttpServletRequest request, HttpServletResponse response, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 이전 페이지에서 데이터 수신
		String noti_cd = request.getParameter("noti_cd");
		
		// 공지 삭제 메소드 실행
		dao.adNotiDelete(noti_cd);
		
		result = "redirect:adnotilist.action";
		
		return result;
	}
	
	// 공지사항 작성 폼으로 이동
	@RequestMapping(value="/adnotiregform.action", method=RequestMethod.GET)
	public String adNotiRegForm(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		// 세션에 있는 관리자코드, 아이디 받기
		String ad_cd = (String)session.getAttribute("ad_cd");
		String ad_id = (String)session.getAttribute("ad_id");
		
		// 다음 페이지로 
		model.addAttribute("ad_cd", ad_cd);
		model.addAttribute("ad_id", ad_id);
		
		result = "/AdNotiReg.jsp";
		
		return result;
	}
	
	// 공지사항 등록
	@RequestMapping(value="/adnotireg.action", method=RequestMethod.GET)
	public String adNotiReg(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, AdCsDTO dto) throws SQLException
	{
		String result = null;
		
		// 고객지원 dao 
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		

		
		result = "/.jsp";
		
		return result;
	}
	
	// 문의글 리스트 출력
	@RequestMapping(value="/adqnalist.action", method = RequestMethod.GET)
	public String AdQnaList(Model model) throws SQLException
	{
		String result = null;
		
		IAdCsDAO dao = sqlSession.getMapper(IAdCsDAO.class);
		
		model.addAttribute("adQnaList", dao.adQnaList());
		
		result = "/AdQnaList.jsp";
		
		return result;
	}
}
