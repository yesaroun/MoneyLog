package com.test.mvc;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdMoneyController
{
	@Autowired
	private SqlSession sqlSession;
	
	
	// 머니리뷰 목록 (전체)
	@RequestMapping(value = "/adpostlist.action", method = RequestMethod.GET)
	public ModelAndView adMoneyPostListAll(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdPostList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.allPostCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 10;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.allPostCount());
		
		// 페이지 기본 url
		String url = "./userpostlist.action";
		
		// ★ 페이지 index 
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// 스타트 앤드 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		
		int start = (pageNum-1)*numPerPage+1;
		int end = pageNum*numPerPage;
		
		MoneyDTO money = new MoneyDTO();
		money.setStart(start);
		money.setEnd(end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("strList", strList);
		mv.addObject("getPostList", dao.getPostListAll(money));
		
		// 페이지 구분용 (전체, 공개, 비공개)
		mv.addObject("postListCheck", 1);
		
		return mv;
	}
	
	// 머니리뷰 목록 (공개)
	@RequestMapping(value = "/adpostlistOpen.action", method = RequestMethod.GET)
	public ModelAndView adMoneyPostListOpen(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdPostList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.allPostCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 10;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.allPostCount());
		
		// 페이지 기본 url
		String url = "./userpostlist.action";
		
		// ★ 페이지 index 
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// 스타트 앤드 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		
		int start = (pageNum-1)*numPerPage+1;
		int end = pageNum*numPerPage;
		
		MoneyDTO money = new MoneyDTO();
		money.setStart(start);
		money.setEnd(end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("strList", strList);
		mv.addObject("getPostList", dao.getPostList(money));
		
		// 페이지 구분용 (전체, 공개, 비공개)
		mv.addObject("postListCheck", 2);
		
		return mv;
	}
	
	// 머니리뷰 목록 (비공개)
	@RequestMapping(value = "/adpostlistPrivate.action", method = RequestMethod.GET)
	public ModelAndView adMoneyPostListPrivate(int pageNum)
	{
		
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdPostList.jsp");
		
		// 머니리뷰 전체 개수 구하기 (신고된 게시글 미포함)
		mv.addObject("allPostCount", dao.allPostCount());
		
		// 페이징
		Paging paging = new Paging();
		
		// 한 페이지당 게시글 개수
		int numPerPage = 10;
		
		// 페이지 개수
		int pageCount = paging.getPageCount(numPerPage, dao.allPostCount());
		
		// 페이지 기본 url
		String url = "./userpostlist.action";
		
		// ★ 페이지 index 
		String strList = paging.pageIndexList(pageNum, pageCount, url);
		
		// 스타트 앤드 구하기 (해당 페이지에 어떤 게시글들이 들어갈지)
		
		int start = (pageNum-1)*numPerPage+1;
		int end = pageNum*numPerPage;
		
		MoneyDTO money = new MoneyDTO();
		money.setStart(start);
		money.setEnd(end);
		
		mv.addObject("pageCount", pageCount);
		mv.addObject("strList", strList);
		mv.addObject("getPostList", dao.getPostListPrivate(money));
		
		// 페이지 구분용 (전체, 공개, 비공개)
		mv.addObject("postListCheck", 3);
		
		return mv;
	}
	
	// 머니리뷰 게시글 상세정보
	@RequestMapping(value = "/adpostinfo.action", method = RequestMethod.GET)
	public ModelAndView adPostInfo(MoneyDTO money)
	{
		IMoneyDAO dao = sqlSession.getMapper(IMoneyDAO.class);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/AdPostInfo.jsp");
		mv.addObject("getPostInfo", dao.getPostInfo(money));
		return mv;
	}



}
