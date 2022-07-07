package com.test.mvc;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdMainController 
{
	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping(value = "/admain.action", method = RequestMethod.GET)
	public String memberList(ModelMap model)
	{
		IAdMainDAO dao = sqlSession.getMapper(IAdMainDAO.class);
		
		model.addAttribute("countPostRept", dao.mainCountPostRept());
		model.addAttribute("countCmntRept", dao.mainCountCmntRept());
		model.addAttribute("countQna", dao.mainCountQna());
		
		return "AdMain.jsp";
	}
	
	
}
