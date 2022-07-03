package com.test.mvc;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController
{
	@Autowired
	private SqlSession sqlSession;
	
	// 메인페이지
	@RequestMapping(value = "/moneylogwelcome.action")
	public String mainForm(HttpServletRequest request, HttpSession session, Model model) throws SQLException
	{ 
		String result = "/Main.jsp"; 
		return result; 
	}
	
	// 이용약관으로 이동
	@RequestMapping(value = "/usersuterms.action", method = RequestMethod.GET)
	public String suTermsForm(HttpServletRequest request, HttpSession session, Model model) throws SQLException
	{ 
		String result = "/UserSuTerms.jsp"; 
		return result; 
	}
	
	// 로그인 폼으로 이동
	@RequestMapping(value = "/loginform.action", method = RequestMethod.GET)
	public String loginForm(HttpServletRequest request, HttpSession session, Model model) throws SQLException
	{ 
		String result = "/UserLogin.jsp"; 
		return result; 
	}

	// 로그인 처리
	@RequestMapping(value = "/login.action", method = RequestMethod.POST)
	public String login(HttpServletRequest request, HttpServletResponse response,HttpSession session, Model model) throws SQLException 
	{ 
		String result = null;
	 
		// 데이터 수신(→ userLogin.jsp 페이지로부터 넘어온 데이터 수신)
		String user_id = request.getParameter("user_id");
		String user_pw = request.getParameter("user_pw");
	 
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	 
		UserDTO dto = dao.login(user_id, user_pw);
	 
		// 일반회원 로그인 / 관리자 로그인 분기해야함 ★
		 	 
		// 로그인 수행에 따른 성공 여부 확인 및 구분/분기
		if(dto != null) 	
		{ 
			// 로그인 성공
			model.addAttribute("user_dstn_cd", dto.getUser_dstn_cd());
			model.addAttribute("user_name", dto.getUser_name());
			 
			// 세션에 값 저장하기
			session.setAttribute("user_dstn_cd", dto.getUser_dstn_cd());
			session.setAttribute("user_id", user_id);
			session.setAttribute("user_name", dto.getUser_name());
			 
			result = "/fstcalendar.action";
		} 
		else 
		{ 
			// 로그인 실패
			request.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다.");
			result = "/UserLogin.jsp";
		}
		 	return result; 
	}
	
	// 최초 캘린더 출력
	@RequestMapping(value = "/fstcalendar.action", method = RequestMethod.POST)
	public ModelAndView fstCalendar(UserDTO dto, HttpServletRequest request, HttpSession session) throws SQLException
	{ 
		ModelAndView mv = new ModelAndView();
		
		IUserDAO dao =sqlSession.getMapper(IUserDAO.class);
		
		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name = (String)session.getAttribute("user_name"); 		//session 객체에서 세션으로 set된 값 get으로 가져오기
		
		dto.setUser_dstn_cd(session_user_dstn_cd);
		dto.setUser_name(session_user_name);
		
		mv.addObject("monthInTotFst", dao.monthInTotFst(dto)); 
		mv.addObject("monthOutTotFst", dao.monthOutTotFst(dto)); 
		mv.addObject("nowRemain", dao.nowRemain(dto)); 
		
		request.setAttribute("pigTotCount", dao.pigTotCount(dto));
		request.setAttribute("pigMonthCount", dao.pigMonthCount(dto));
		
		mv.setViewName("/UserAcntCalendar.jsp");
		// mv.setViewName("/calendar.action");
		return mv;
	}
	
	// 캘린더 출력
	@RequestMapping(value = "/calendar.action", method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView calendarDisplay(UserDTO dto, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws SQLException
	{ 
		ModelAndView mv = new ModelAndView();
		
		IUserDAO dao =sqlSession.getMapper(IUserDAO.class);
		
		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name = (String)session.getAttribute("user_name"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_year = (String)session.getAttribute("year");
		String session_month = (String)session.getAttribute("month");
		
		dto.setUser_dstn_cd(session_user_dstn_cd);
		dto.setUser_name(session_user_name);
		dto.setYear(session_year);
		dto.setMonth(session_month);
		
		mv.addObject("monthInTot", dao.monthInTot(dto)); 
		mv.addObject("monthOutTot", dao.monthOutTot(dto)); 
		mv.addObject("nowRemain", dao.nowRemain(dto)); 
		// mv.addObject("dayInTot", dao.dayInTot(dto));
		// mv.addObject("dayOutTot", dao.dayOutTot(dto));
		
		request.setAttribute("pigTotCount", dao.pigTotCount(dto));
		request.setAttribute("pigMonthCount", dao.pigMonthCount(dto));
		
		mv.setViewName("/UserAcntCalendar.jsp");

		return mv;
	}
	
	
	// 해당월 수입 리스트 출력
	@RequestMapping(value="/monthinlist.action", method = RequestMethod.GET)
	public ModelAndView acntMonthInList(UserDTO dto, HttpSession session) throws SQLException
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		ModelAndView mv = new ModelAndView();
		
		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name = (String)session.getAttribute("user_name"); 		//session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_year = (String)session.getAttribute("year");
		String session_month = (String)session.getAttribute("month");

		dto.setUser_dstn_cd(session_user_dstn_cd);
		dto.setUser_name(session_user_name);
		dto.setYear(session_year);
		dto.setMonth(session_month);
		
		mv.setViewName("/UserAcntMonthIn.jsp");

		mv.addObject("monthInTot", dao.monthInTot(dto)); 
		mv.addObject("monthInList", dao.monthInList(dto));
		
		return mv;
	}
	
	
	// 해당월 지출 리스트 출력
	@RequestMapping(value="/monthoutlist.action", method = RequestMethod.GET)
	public ModelAndView acntMonthOutList(UserDTO dto, HttpSession session)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		ModelAndView mv = new ModelAndView();

		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name = (String)session.getAttribute("user_name"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_year = (String)session.getAttribute("year");
		String session_month = (String)session.getAttribute("month");		
		
		dto.setYear(session_year);
		dto.setMonth(session_month);
		dto.setUser_dstn_cd(session_user_dstn_cd);
		dto.setUser_name(session_user_name);

		mv.setViewName("/UserAcntMonthOut.jsp");

		mv.addObject("monthOutTot", dao.monthOutTot(dto)); 
		mv.addObject("monthOutList", dao.monthOutList(dto));
		
		return mv;
	}
	
	
	// 당일 가계부 리스트 출력
	@RequestMapping(value="/useracntdaylist.action", method = {RequestMethod.GET, RequestMethod.POST})	// 원래 GET 처리!!!!
	public ModelAndView acntDayInoutList(String day, UserDTO dto, HttpSession session)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		ModelAndView mv = new ModelAndView();

		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd");  //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name = (String)session.getAttribute("user_name"); 		//session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_year = (String)session.getAttribute("year");
		String session_month = (String)session.getAttribute("month");
		
		dto.setUser_dstn_cd(session_user_dstn_cd);
		dto.setUser_name(session_user_name);
		dto.setYear(session_year);
		dto.setMonth(session_month);
		dto.setDay(day);

		mv.addObject("inoutCateList", dao.inoutCateList());			// 구분(수입/지출) 카테고리 출력
		// ajax 처리(1차, 2차 카테고리)
		
		mv.addObject("day", day);
		mv.addObject("dayInoutList", dao.dayInoutList(dto));		// 당일 수입지출 리스트
		mv.addObject("fstCateList", dao.fstCateList());
		mv.addObject("secCateList", dao.secCateList());
		// mv.addObject("fstCateListOne", dao.fstCateListOne(dto));
		// mv.addObject("fstCateListTwo", dao.fstCateListTwo(dto));
		
		mv.setViewName("/UserAcntDayList.jsp");
		
		return mv;
	}
		
	
	// 가계부 등록 처리
	@RequestMapping(value="acntreg.action", method = RequestMethod.POST)
	public ModelAndView acntReg(UserDTO dto, HttpServletRequest request, HttpServletResponse response,  HttpSession session)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		ModelAndView mv = new ModelAndView();

		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd");  //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_year = (String)session.getAttribute("year");
		String session_month = (String)session.getAttribute("month");
		
		String cate_sec_cd = request.getParameter("cate_sec_cd");
		String acnt_dtl_cont = request.getParameter("acnt_dtl_cont");
		String amnt = request.getParameter("amnt");
		
		dto.setUser_dstn_cd(session_user_dstn_cd);
		
		dto.setYear(session_year);
		dto.setMonth(session_month);
		dto.setCate_sec_cd(cate_sec_cd);
		dto.setAcnt_dtl_cont(acnt_dtl_cont);
		dto.setAmnt(amnt);
		
		mv.addObject("acntReg", dao.acntReg(dto));			// 구분(수입/지출) 카테고리 출력
		
		mv.setViewName("/useracntdaylist.action");
		
		return mv;
	}
	
	/*
	// ajax 처리 
	@RequestMapping(value = "/ajax.action", method = RequestMethod.GET)
	public ModelAndView receiveAjax(UserDTO dto, HttpServletRequest request, HttpServletResponse response, HttpSession session) 
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		ModelAndView mv = new ModelAndView();
		
		mv.addObject("fstCateList", dao.fstCateList(dto));

		mv.setViewName("/Ajax.jsp");
		
		return mv;
	}
	
	// 달력 변경시
	@RequestMapping(value = "/changeCal.action", method = {RequestMethod.GET, RequestMethod.POST})
	public String calendarChange(UserDTO dto, HttpServletRequest req, HttpServletResponse res, Model model) throws Exception 
	{ 
		String result = null;
		
		String year = req.getParameter("year");
		String month = req.getParameter("month");
		
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		dto.setYear(year);
		dto.setMonth(month);
		
		result = "redirect:calendar.action"; 
	
		return result; 
	}
	*/
	
	
	// 분석하기 전체 조회
	@RequestMapping(value = "/analysis.action", method = RequestMethod.GET)
	public ModelAndView analysis(UserDTO dto, HttpSession session)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		ModelAndView mv = new ModelAndView();

		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name = (String)session.getAttribute("user_name"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_year = (String)session.getAttribute("year");
		String session_month = (String)session.getAttribute("month");
		dto.setYear(session_year);
		dto.setMonth(session_month);
		dto.setUser_dstn_cd(session_user_dstn_cd);
		dto.setUser_name(session_user_name);

		mv.setViewName("/Analysis.jsp");
		
		mv.addObject("monthInTot", dao.monthInTot(dto)); 			// 해당월 수입 총액
		mv.addObject("monthOutTot", dao.monthOutTot(dto)); 			// 해당월 지출 총액
		mv.addObject("allInAvg", dao.allInAvg(dto)); 				// 내 수입 전체 평균
		mv.addObject("allOutAvg", dao.allOutAvg(dto)); 				// 내 지출 전체 평균
		mv.addObject("similarInAvg", dao.similarInAvg(dto)); 		// 비슷한 이용자의 수입 평균
		mv.addObject("similarOutAvg", dao.similarOutAvg(dto)); 		// 비슷한 이용자의 지출 평균
		
		return mv;
	}
	
	
	// 분석하기 수입 조회
	@RequestMapping(value = "/analysisIn.action", method = RequestMethod.GET)
	public ModelAndView analysisIn(UserDTO dto, HttpSession session)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		ModelAndView mv = new ModelAndView();
		
		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd");  //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name = (String)session.getAttribute("user_name"); 		//session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_year = (String)session.getAttribute("year");
		String session_month = (String)session.getAttribute("month");
		dto.setYear(session_year);
		dto.setMonth(session_month);
		dto.setUser_dstn_cd(session_user_dstn_cd);
		dto.setUser_name(session_user_name);

		mv.setViewName("/AnalysisIn.jsp");		
		mv.addObject("monthInTot", dao.monthInTot(dto)); 			// 해당월 수입 총액
		mv.addObject("monthInList", dao.monthInList(dto));			// 해당월 수입 리스트
		
		return mv;
	}
	
	
	// 분석하기 지출 조회
	@RequestMapping(value = "/analysisOut.action", method = RequestMethod.GET)
	public ModelAndView analysisOut(UserDTO dto, HttpSession session)
	{
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		
		ModelAndView mv = new ModelAndView();
		
		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name = (String)session.getAttribute("user_name"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_year = (String)session.getAttribute("year");
		String session_month = (String)session.getAttribute("month");
		dto.setYear(session_year);
		dto.setMonth(session_month);
		dto.setUser_dstn_cd(session_user_dstn_cd);
		dto.setUser_name(session_user_name);

		mv.setViewName("/AnalysisOut.jsp");		
		mv.addObject("monthOutTot", dao.monthOutTot(dto)); 
		mv.addObject("monthOutList", dao.monthOutList(dto));
		
		return mv;
	}
	
	// 민지 추가 ================================================================================
	
	// 기본정보 입력
	@RequestMapping(value = "/registerform.action", method = RequestMethod.GET)
	public String registerForm(HttpServletRequest request, HttpSession session, Model model)
	{ 
		// 회원가입 기본정보입력 폼으로 보내기
		return "/UserSuInfoInput.jsp";
	}
	 
	// 추가정보① 입력
	// value = "/plusfirst.action" 액션 → userSuPlusInputFst.jsp 페이지로 보내기
	@RequestMapping(value = "/plusfirst.action", method = RequestMethod.POST)
	public String plusFirst(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, UserDTO dto) //여기에 정보들 넘겨받아야하는건지 고민
	{
		 //String result = null;
		 
		 String user_id = request.getParameter("user_id");
		 String user_pw = request.getParameter("user_pw");
		 String user_name = request.getParameter("user_name");
		 String user_tel = request.getParameter("user_tel");
		 
		 model.addAttribute("user_id", user_id);
		 model.addAttribute("user_pw", user_pw);
		 model.addAttribute("user_name", user_name);
		 model.addAttribute("user_tel", user_tel);
		 
		 session.setAttribute("user_id", user_id);
		 session.setAttribute("user_pw", user_pw);
		 session.setAttribute("user_name", user_name);
		 session.setAttribute("user_tel", user_tel);
		 
		 String session_user_id = (String)session.getAttribute("user_id");
		 String session_user_pw = (String)session.getAttribute("user_pw");
		 String session_user_name = (String)session.getAttribute("user_name");
		 String session_user_tel = (String)session.getAttribute("user_tel");
		 
		 // 위에서 받은 각 컬럼들의 데이터를 비어있는 dto 에 넣어 값 설정 다시 해주기
		 dto.setUser_id(session_user_id);
		 dto.setUser_pw(session_user_pw);
		 dto.setUser_name(session_user_name);
		 dto.setUser_tel(session_user_tel);
		 
		 //IUserInfoDAO dao = sqlSession.getMapper(IUserInfoDAO.class);
		 //UserDTO dto = dao.checkMrg(mrg_cd);
		 
		 return "/UserSuPlusInputFst.jsp";
	 }
	 
	
	 // 추가정보② 입력
	 // value = "/plussecond.action" 액션 → userSuPlusInputSec.jsp 페이지로 보내기
	 @RequestMapping(value = "/plussecond.action", method = RequestMethod.POST)
	 public String plusSecond(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, UserDTO dto)
	 {		 
		String ssn1 = request.getParameter("ssn1");
		String ssn2 = request.getParameter("ssn2");
		String ssn = ssn1 + ssn2;
		
		String mrg_cd = request.getParameter("mrgSelect");
		String child_cd = request.getParameter("childSelect");
		String fml_cd = request.getParameter("fmlSelect");
		String house_cd = request.getParameter("houseSelect");
		String pet_cd = request.getParameter("petSelect");
		String car_cd = request.getParameter("carSelect");
		
		model.addAttribute("ssn", ssn);
		model.addAttribute("mrg_cd", mrg_cd);
		model.addAttribute("child_cd", child_cd);
		model.addAttribute("fml_cd", fml_cd);
		model.addAttribute("house_cd", house_cd);
		model.addAttribute("pet_cdd", pet_cd);
		model.addAttribute("car_cd", car_cd);
		
		session.setAttribute("ssn", ssn);
		session.setAttribute("mrg_cd", mrg_cd);
		session.setAttribute("child_cd", child_cd);
		session.setAttribute("fml_cd", fml_cd);
		session.setAttribute("house_cd", house_cd);
		session.setAttribute("pet_cd", pet_cd);
		session.setAttribute("car_cd", car_cd);
		
		String session_ssn = (String)session.getAttribute("ssn");
		String session_mrg_cd = (String)session.getAttribute("mrg_cd");
		String session_child_cd = (String)session.getAttribute("child_cd");
		String session_fml_cd = (String)session.getAttribute("fml_cd");
		String session_house_cd = (String)session.getAttribute("house_cd");
		String session_pet_cd = (String)session.getAttribute("pet_cd");
		String session_car_cd = (String)session.getAttribute("car_cd");
		
		// 위에서 받은 각 컬럼들의 데이터를 비어있는 dto 에 넣어 값 설정 다시 해주기
		dto.setSsn(session_ssn);
		dto.setMrg_cd(session_mrg_cd);
		dto.setChild_cd(session_child_cd);
		dto.setFml_cd(session_fml_cd);
		dto.setHouse_cd(session_house_cd);
		dto.setPet_cd(session_pet_cd);
		dto.setCar_cd(session_car_cd);
		
		return "/selectform.action";	//-- 다음 페이지에서 selectbox 로 뿌려줄 지역 및 직업 1차/2차 데이터 준비
	 }
	 
	 
	 // 이전페이지 가기(plusInputFst.jsp → InfoInput.jsp 페이지로 이동~!!! )
	 @RequestMapping(value = "/preinfoinput.action", method = RequestMethod.POST)
	 public String preinfoinput(UserDTO user) throws SQLException
	 {
		return "/UserReInfoInput.jsp";
	 }
	 

	 // 회원가입 완료 → add() → 가입 완료 페이지
	 @RequestMapping(value = "/plusinfosec.action", method = RequestMethod.POST)
	 public String add(Model model, HttpServletRequest request, HttpServletResponse response, HttpSession session, UserDTO dto) throws SQLException
	 {
		 String area_fst_cd = request.getParameter("area_fst_cd");
		 String area_sec_cd = request.getParameter("area_sec_cd");
		 String job_fst_cd = request.getParameter("job_fst_cd");
		 String job_sec_cd = request.getParameter("job_sec_cd");
		 
		 model.addAttribute("area_fst_cd", area_fst_cd);
		 model.addAttribute("area_sec_cd", area_sec_cd);
		 model.addAttribute("job_fst_cd", job_fst_cd);
		 model.addAttribute("job_sec_cd", job_sec_cd);
		 
		 session.setAttribute("area_fst_cd", area_fst_cd);
		 session.setAttribute("area_sec_cd", area_sec_cd);
		 session.setAttribute("job_fst_cd", job_fst_cd);
		 session.setAttribute("job_sec_cd", job_sec_cd);
		 
		 String session_user_id = (String)session.getAttribute("user_id");
		 String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		 String session_user_name = (String)session.getAttribute("user_name");
		 String session_user_pw	= (String)session.getAttribute("user_pw");
		 String session_user_tel = (String)session.getAttribute("user_tel");
		 
		 String session_ssn = (String)session.getAttribute("ssn");
		 String session_mrg_cd = (String)session.getAttribute("mrg_cd");
		 String session_child_cd = (String)session.getAttribute("child_cd");
		 String session_fml_cd = (String)session.getAttribute("fml_cd");
		 String session_house_cd = (String)session.getAttribute("house_cd");
		 String session_pet_cd = (String)session.getAttribute("pet_cd");
		 String session_car_cd = (String)session.getAttribute("car_cd");
		 
		 String session_area_fst_cd = (String)session.getAttribute("area_fst_cd");
		 String session_area_sec_cd = (String)session.getAttribute("area_sec_cd");
		 String session_job_fst_cd = (String)session.getAttribute("job_fst_cd");
		 String session_job_sec_cd = (String)session.getAttribute("job_sec_cd");
		 
		 dto.setUser_id(session_user_id);
		 dto.setUser_dstn_cd(session_user_dstn_cd);
		 dto.setUser_name(session_user_name);
		 dto.setUser_pw(session_user_pw);
		 dto.setUser_tel(session_user_tel);
		 dto.setSsn(session_ssn);
		 dto.setMrg_cd(session_mrg_cd);
		 dto.setChild_cd(session_child_cd);
		 dto.setFml_cd(session_fml_cd);
		 dto.setPet_cd(session_pet_cd);
		 dto.setCar_cd(session_car_cd);
		 dto.setHouse_cd(session_house_cd);
		 dto.setArea_sec_cd(session_area_sec_cd);
		 dto.setJob_sec_cd(session_job_sec_cd);
		 dto.setArea_fst_cd(session_area_fst_cd);
		 dto.setJob_fst_cd(session_job_fst_cd);
		 
		 IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		 
		 dao.add(dto);
		 
		// 회원 가입 후에 보내는 뷰
		 return "UserSuOk.jsp";
	 }
	 
	// 아이디찾기
	@RequestMapping(value = "/findId.action", method = RequestMethod.POST)
	public String findId(HttpSession session, HttpServletRequest request, HttpServletResponse response, Model model)
	{
		String result = null;
		
		// 데이터 수신
		String user_name = request.getParameter("user_name");
		String user_tel = request.getParameter("user_tel");
		
		//String session_user_name = (String)session.getAttribute("user_name");
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	
		UserDTO dto = dao.findId(user_name, user_tel);
		
		if(dto != null)
		{
			// 아이디 찾기 성공
			
			// 뷰에 데이터 전달
			model.addAttribute("find_id", dto.getFind_id());
			
			session.setAttribute("find_id", dto.getFind_id());
			
			//System.out.println("-------------------------");
		 	//System.out.println(dto.getFind_id());
		 	//System.out.println("-------------------------");
	
			
			result = "/UserIdCertifiedOk.jsp";    // 성공안내 페이지
		}
		else
		{
			result = "/UserIdNo.jsp";	// 실패안내 페이지
		}
	    
	    return result;
	}
	    
	    
	// ================================================================================ 민지 추가

	// 내 게시글 리스트
	@RequestMapping(value = "/mypostlist.action", method = RequestMethod.GET)
	public ModelAndView myPostList(HttpSession session, Model model, UserDTO dto) throws SQLException  
	{
		ModelAndView mv = new ModelAndView();
		
		IUserDAO dao =sqlSession.getMapper(IUserDAO.class);

		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name    = (String)session.getAttribute("user_name");
		
        dto.setUser_dstn_cd(session_user_dstn_cd);
        dto.setUser_name(session_user_name);		
		
        mv.addObject("myPostList", dao.myPostList(dto));
	
        mv.setViewName("/MyPostList.jsp");
		
		return mv;
	}
	
	
	// 내 댓글 리스트
	@RequestMapping(value = "/mycmntlist.action", method = RequestMethod.GET)
	public String myCmntList(HttpSession session, Model model, UserDTO dto)  throws SQLException 
	{
		String result = null;
		
		IUserDAO dao =sqlSession.getMapper(IUserDAO.class);
		
		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name    = (String)session.getAttribute("user_name");
		
        dto.setUser_dstn_cd(session_user_dstn_cd);
        dto.setUser_name(session_user_name);		
		
		model.addAttribute("myCmntList", dao.myCmntList(dto));      
		
		result = "/MyCmntList.jsp";
		
		return result;
	}
	
	
	
	// 내 문의글 리스트
	@RequestMapping(value = "/myqnalist.action", method = RequestMethod.GET)
	public String myQnaList(HttpSession session, Model model, UserDTO dto) throws SQLException // 미리만들어진 UserDTO 객체 user 를 써야 하는데 syso ..?
	{
		String result = null;
		
		IUserDAO dao =sqlSession.getMapper(IUserDAO.class);
		
		String session_user_dstn_cd = (String)session.getAttribute("user_dstn_cd"); //session 객체에서 세션으로 set된 값 get으로 가져오기
		String session_user_name    = (String)session.getAttribute("user_name");
		
        dto.setUser_dstn_cd(session_user_dstn_cd);
        dto.setUser_name(session_user_name);		
		
		model.addAttribute("myQnaList", dao.myQnaList(dto));      
	
		
		result = "/MyQnaList.jsp";
		
		return result;
	}
	

	// 사이드바에서 회원정보 수정 버튼 클릭 시      //-- 쿼리 필요없음 그냥 비밀번호 확인하는 뷰페이지로만 이동
	@RequestMapping(value="/mycheckpw.action", method=RequestMethod.GET)
	public String infoCheckPw()
	{
		String result = null;
		
		result = "/MyCheckPw.jsp";
		
		return result;
	}
	
	// 비밀번호 확인 후 내정보수정 페이지로 이동
	@RequestMapping(value = "/myinfomodify.action", method = RequestMethod.POST)
	public String infoModifyForm(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, UserDTO dto)
	{
		String result = null;

		IUserDAO dao =sqlSession.getMapper(IUserDAO.class);
		
		// 세션에 있는 사용자 코드 얻어와서 dto에 set 해줌
		dto.setUser_dstn_cd((String)session.getAttribute("user_dstn_cd"));
	
		
		// 사용자가 입력한 pw 를 user_input_pw 에 담아줌
		String user_input_pw = request.getParameter("pw");     //-- input 태그에서 name=pw
		
		
		// db 에 있는 사용자 비밀번호 얻어와서 user_pw에 담아줌
		String user_pw = dao.myCheckPw(dto).getUser_pw();
		
		dto = dao.myPlusInfo(dto); //위에 200~211라인처럼 다 dto.set 안해도 됨... 이거 한줄로 끝,,,ㅠ
		
		// 비밀번호 일치 여부 확인
		if ( user_pw.equals(user_input_pw) )	  //-- 비밀번호 일치 
		{
			//dao로 쿼리 수행 하고 select 결과값 받아서 그 값 dto에 담아줌~~
			// 그리고 전부 다 model.addAttribute에 넣어서 
			// 확인 누르면 MyInfoModify.jsp로 그 값 가지고 가게...  → MyInfoModify 뷰에서 EL 사용가능
			model.addAttribute("myPlusInfo", dao.myPlusInfo(dto)); 
			model.addAttribute("ssn" , dto.getSsn());
			model.addAttribute("user_tel" , dto.getUser_tel());  
			model.addAttribute("mrg_cd" , dto.getMrg_cd());  
			model.addAttribute("child_cd" , dto.getChild_cd());  
			model.addAttribute("fml_cd" , dto.getFml_cd());   
			model.addAttribute("house_cd" , dto.getHouse_cd()); 
			model.addAttribute("pet_cd" , dto.getPet_cd()); 
			model.addAttribute("car_cd" , dto.getCar_cd()); 
			model.addAttribute("area_fst_cd" , dto.getArea_fst_cd()); 
			model.addAttribute("area_sec_cd" , dto.getArea_sec_cd()); 
			model.addAttribute("job_fst_cd" , dto.getJob_fst_cd()); 
			model.addAttribute("job_sec_cd" , dto.getJob_sec_cd()); 
			
			result = "/MyInfoModify.jsp"; 
		}
		else				                      //-- 비밀번호 불일치
		{
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			result = "/MyCheckPw.jsp"; //redirect하면 jsp에서 request -> msg값 인식 못함.... ㅠ 
			
		}
		
		return result;
	}
	
	
	// 회원 정보 수정 버튼 눌렀을 때 처리       //-- 정보 업데이트 한 뒤에 회원정보 수정 완료 뷰페이지로 이동
	@RequestMapping(value="/myinfomodifyok.action", method=RequestMethod.GET)
	public String InfoModifySubmit(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, UserDTO dto)
	{
		String result = null;
		
		
	   // 전화번호 원래는 본인인증인데 직접 입력할 수 있게 disabled 지우고 잘 바뀌나 해봄..
	 
	    IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	  
	    // 세션에 있는 사용자 코드 얻어와서 dto에 set 해줌
	 	dto.setUser_dstn_cd((String)session.getAttribute("user_dstn_cd"));
/*	 
   전화번호 수정은 인증처리 추후에 하겠다고 할게용... 
   전화번호 수정 하려면 전화번호 수정만 하는 전용 action 분리 필요해.....ㅠ 
   (원래 우리 정책은 인증API 쓰는 건데 API 까지 못할 것 같아서 직접 수정 가능하게하려구 해봄.. ㅠ)
   
	    // 사용자가 입력한 전화번호를 user_tel 에 담아줌        
	 	String user_tel = request.getParameter("tel");     //-- input 태그에서 name=tel
	 	//--  활용정보도 바꼈으면 user_tel 처럼 getParameter 로 받아서 dto에 set 해줘야 한다. 
	 	
	    // 받아온 전화번호 set해줌 
	 	dto.setUser_tel(user_tel);
	 	
		// dao에 있는 telModify() 호출하면서 수정
		dao.telModify(dto);
*/		
		
	 	
		dto.setMrg_cd(request.getParameter("mrg_cd"));
		dto.setChild_cd(request.getParameter("child_cd"));
		dto.setFml_cd(request.getParameter("fml_cd"));
		dto.setHouse_cd(request.getParameter("house_cd"));
		dto.setPet_cd(request.getParameter("pet_cd"));
		dto.setCar_cd(request.getParameter("car_cd"));
		dto.setArea_sec_cd(request.getParameter("area_sec"));
		dto.setJob_sec_cd(request.getParameter("job_sec"));
		
		// ※  활용정보,,,,,,, ajax 처리 랑 업데이트 쿼리 ... 필요...  dto.plusModify(dto);  ㅠㅠ
		// 지역, 직업 셀렉트박스 ajax 처리 못해서... 다르게 처리 했슴니다..(뷰에서 하드코딩....)
		
		// 문제 발생 --> 직업2차 없는 무직, 아르바이트, 주부, 프리랜서는 에러난다. job_sec_cd 가 null..

		dao.plusModify(dto);
		
		result = "/MyInfoModifyOk.jsp";
		
		return result;
	}
	
	
	// 회원 정보 수정완료창에서 확인하기 버튼클릭하면 
	// 새로 바뀐(업데이트) 정보 적용된 myInfoModify.jsp 뷰페이지 나와야한다.
	@RequestMapping(value="/myinfomodifycheck.action", method=RequestMethod.GET)
	public String myInfoCheck(HttpSession session, Model model, UserDTO dto)
	{
		String result = null;
		
	   // 전화번호 원래는 본인인증인데 disabled 지우고 직접 입력할 수 있게해서 수정 잘 됐나 해봄..
	 
	    IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	  
	    // 세션에 있는 사용자 코드 얻어와서 dto에 set 해줌
	 	dto.setUser_dstn_cd((String)session.getAttribute("user_dstn_cd"));
		
	 	
		// dao로 쿼리 수행 하고 결과값 받아서  필요한 정보 모두 dto에 담아주기
		dto.setSsn(dao.myInfoCheck(dto).getSsn());	            
		dto.setUser_tel(dao.myInfoCheck(dto).getUser_tel());	
		dto.setMrg_cd(dao.myInfoCheck(dto).getMrg_cd());	
		dto.setChild_cd(dao.myInfoCheck(dto).getChild_cd());	
		dto.setFml_cd(dao.myInfoCheck(dto).getFml_cd());	
		dto.setHouse_cd(dao.myInfoCheck(dto).getHouse_cd());	
		dto.setPet_cd(dao.myInfoCheck(dto).getPet_cd());	
		dto.setCar_cd(dao.myInfoCheck(dto).getCar_cd());	
		dto.setArea_fst_cd(dao.myInfoCheck(dto).getArea_fst_cd());	
		dto.setArea_sec_cd(dao.myInfoCheck(dto).getArea_sec_cd());	
		dto.setJob_fst_cd(dao.myInfoCheck(dto).getJob_fst_cd());	
		dto.setJob_sec_cd(dao.myInfoCheck(dto).getJob_sec_cd());	
			
		
		// 전부 다 model.addAttribute 로 값 넣어서
		// 확인하러가기 버튼 누르면 다시 MyInfoModify.jsp로 그 값 가지고 가게...  // → MyInfoModify 뷰에서 EL 사용가능
		model.addAttribute("myInfoCheck", dao.myInfoCheck(dto)); 
		model.addAttribute("ssn" , dto.getSsn());
		model.addAttribute("user_tel" , dto.getUser_tel());  
		model.addAttribute("mrg_cd" , dto.getMrg_cd());  
		model.addAttribute("child_cd" , dto.getChild_cd());  
		model.addAttribute("fml_cd" , dto.getFml_cd());   
		model.addAttribute("house_cd" , dto.getHouse_cd()); 
		model.addAttribute("pet_cd" , dto.getPet_cd()); 
		model.addAttribute("car_cd" , dto.getCar_cd()); 
		model.addAttribute("area_fst_cd" , dto.getArea_fst_cd()); 
		model.addAttribute("area_sec_cd" , dto.getArea_sec_cd()); 
		model.addAttribute("job_fst_cd" , dto.getJob_fst_cd()); 
		model.addAttribute("job_sec_cd" , dto.getJob_sec_cd()); 
		
		result = "/MyInfoModify.jsp";
		
		return result;
	}
	
	
	
	
	// 사이드바에서 비밀번호 수정 버튼 클릭 시      
	@RequestMapping(value="/mypwmodify.action", method=RequestMethod.GET)
	public String pwModifyForm(HttpServletResponse response, HttpSession session, Model model, UserDTO dto)
	{
		String result = null;
			
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);

		// 세션에 있는 사용자 코드 얻어와서 dto에 set 해줌
		dto.setUser_dstn_cd((String)session.getAttribute("user_dstn_cd"));
		
		
		// db 에 있는 사용자의 기존 비밀번호 얻어와서 user_pw에 담아줌
		String user_pw = dao.myCheckPw(dto).getUser_pw(); //-- 이미 복호화 된 값 가져옴	
				
		model.addAttribute("user_pw", user_pw);		
			
		result = "/MyPwModify.jsp";
			
		return result;
	}
		
	
	// 비밀번호 수정
	@RequestMapping(value="/mypwmodifyok.action", method=RequestMethod.POST)
	public String pwModify(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, UserDTO dto)
	{
		String result = null;
		
	    IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	  
	    // 세션에 있는 사용자 코드 얻어와서 dto에 set 해줌
	 	dto.setUser_dstn_cd((String)session.getAttribute("user_dstn_cd"));
	    
	 	// 사용자가 새로 입력한 암호 가져옴 (이미 여기 넘어온 이상 new_pw1, new_pw2는 같은 상태)
	 	 String newPw1 = request.getParameter("newPw1");
	 	 String newPw2 = request.getParameter("newPw2");

	 	
	    // 받아온 새 비밀번호, 확인비밀번호 setter 에 담고 get으로 가져오기
	 	dto.setUser_pw(newPw2);
	 	// dto.setNew_pw_check(newPw2); 
	 	
	 	dao.pwModify(dto);
	 	
		
        // model.addAttribute("pwModify");  // 필요없음 그냥 위에서 업데이트 까지만 시키면 끝

		
		result = "/MyPwModifyOk.jsp";
		
		return result;
	}
	
	// 비밀번호 수정 후 내 가계부로 돌아가기 버튼 클릭 시      //-- 쿼리 필요없음 그냥 메인페이지 (내 가계부 뷰페이지로만) 이동
	@RequestMapping(value="/backtomycal.action", method=RequestMethod.GET)
	public String backToMyCal()
	{
		String result = null;
		
		result = "/calendar.action";
		
		return result;
	}
	
	// 사이드바에서 회원탈퇴 버튼 클릭 시        //-- 쿼리 필요없음 그냥 탈퇴 전 비밀번호 받는 뷰페이지로만 이동
	@RequestMapping(value="/leavecheckpw.action", method=RequestMethod.GET)
	public String leaveCheckPw()
	{
		String result = null;
		
		result = "/LeaveCheckPw.jsp";
		
		return result;
	}
	
	// 비밀번호 확인 작업 후 탈퇴 폼 페이지로 이동
	@RequestMapping(value = "/leaveform.action", method = RequestMethod.GET)
	public String leaveForm(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, UserDTO dto)
	{
		String result = null;

		IUserDAO dao =sqlSession.getMapper(IUserDAO.class);
		
		// 세션에 있는 사용자 코드 얻어와서 dto에 set 해줌
		dto.setUser_dstn_cd((String)session.getAttribute("user_dstn_cd"));
	
		
		// 사용자가 입력한 pw 를 user_input_pw 에 담아줌
		String user_input_pw = request.getParameter("pw");     //-- input 태그에서 name=pw
	
		// db 에 있는 기존 사용자 정보 얻어와서(비밀번호, 전화번호, 가입일자) dto 에 set 해줌   -- 아이디, 식별코드는 세션에있음
        dto = dao.myPlusInfo(dto); //위에 200~211라인처럼 다 dto.set 안해도 됨... 이거 한줄로 끝,,,ㅠ
        
        // 밑에서 계속 써주기 귀찮아서 변수에 담음
        String user_pw = dto.getUser_pw();

		// 비밀번호 일치 여부 확인
		if ( user_pw.equals(user_input_pw) )	  //-- 비밀번호 일치할 때 
		{
			//dao로 쿼리 수행 하고 select 결과값 받아서 그 값 dto에 담아줌~~
			// 그리고 전부 다 model.addAttribute에 넣어서 
			// 확인 누르면 LeaveForm.jsp로 그 값 가지고 가게...  → LeaveForm.jsp 뷰에서 EL 사용가능
			model.addAttribute("myPlusInfo", dao.myPlusInfo(dto)); 
			model.addAttribute("user_tel" , dto.getUser_tel());  
			model.addAttribute("user_date" , dto.getUser_date());  
			result = "/LeaveForm.jsp"; 
		}
		else				                      //-- 비밀번호 불일치
		{
			request.setAttribute("msg", "비밀번호가 일치하지 않습니다.");
			result = "/LeaveCheckPw.jsp"; //redirect하면 jsp에서 request -> msg값 인식 못함.... ㅠ 
			
		}
		
		return result;
	}
	
	
	// 탈퇴 폼에서 탈퇴하기 버튼 클릭 시 
	@RequestMapping(value = "/leaveok.action", method = RequestMethod.GET)
	public String leaveOk(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, UserDTO dto)
	{
		String result = null;
		
	    IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	  
	    // 세션에 있는 사용자 코드 얻어와서 dto에 set 해줌
	 	dto.setUser_dstn_cd((String)session.getAttribute("user_dstn_cd"));
	    
		 
		// db 에 있는 기존 사용자 정보 얻어와서dto 에 set 해줌   
        dto = dao.myPlusInfo(dto); 
        
        String user_date = (String)dto.getUser_date();      // 형변환해서 담는거 필수!!
	        
        // model.addAttribute("myPlusInfo"); 
        
        
        dao.userBackUp(dto);   // 백업
        dao.leave(dto);        // 탈퇴
        

		result = "/LeaveOk.jsp"; 
		
		return result;
	}
	
	// 로그아웃
	@RequestMapping(value="logoutuser.action", method=RequestMethod.GET)
	public String logoutM(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model) throws SQLException 
	{
      
    	String user_id = (String)session.getAttribute("user_id");
    	String user_dstsn_cd = (String)session.getAttribute("user_dstsn_cd");
    	session.removeAttribute("user_id");
    	session.removeAttribute("user_dstn_cd");
    	return "moneylogwelcome.action";
	}
	
	
	//======================================= 고객센터 추가
	
	// 고객센터 클릭시 머니로그 소개        //-- 쿼리 필요없음 그냥 뷰페이지로만 이동
	@RequestMapping(value="/userservice.action", method=RequestMethod.GET)
	public String userServiceMain()
	{
		String result = null;
		
		result = "/UserServiceMain.jsp";
		
		return result;
	}
	
	// 고객센터 사이드바에서 공지사항 클릭시 공지사항 리스트      
	@RequestMapping(value="/usernotilist.action", method=RequestMethod.GET)
	public String UserNotiList(Model model) throws SQLException  
	{
		String result = null;
		
		IUserDAO dao =sqlSession.getMapper(IUserDAO.class);
		
		
		model.addAttribute("userNotiList", dao.userNotiList());      
	
		
		result = "/UserNotiList.jsp";
		
		return result;
		
	}
	
	// 고객센터 사이드바에서 문의하기 클릭시 문의글 리스트       
	@RequestMapping(value="/userqnalist.action", method=RequestMethod.GET)
	public String UserQnaList(Model model) throws SQLException  
	{
		String result = null;
		
		IUserDAO dao =sqlSession.getMapper(IUserDAO.class);
		
		model.addAttribute("userQnaList", dao.userQnaList());      
	
		result = "/UserQnaList.jsp";
		
		return result;
		
	}
	
	
	// 고객센터 사이드바에서 이용약관 클릭시 이용약관 내용 소개        //-- 쿼리 필요없음 그냥 뷰페이지로만 이동
	@RequestMapping(value="/userterms.action", method=RequestMethod.GET)
	public String userTerms()
	{
		String result = null;
		
		result = "/UserTerms.jsp";
		
		return result;
	}
	
	
	
	// 고객센터 문의하기 버튼 클릭시 문의하기 폼으로 이동       //-- 쿼리 필요없음 그냥 뷰페이지로만 이동
	@RequestMapping(value="/userqnareg.action", method=RequestMethod.GET)
	public String userQnaReg(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, UserDTO dto)
	{
		String result = null;
		
		IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
		  
	    // 세션에 있는 사용자 코드 얻어와서 dto에 set 해줌
	 	dto.setUser_dstn_cd((String)session.getAttribute("user_dstn_cd"));
	 	dto.setUser_name((String)session.getAttribute("user_name"));
	 
	 	
	 	String qna_date = new SimpleDateFormat("yyyy-mm-dd").format(new Date());
	 	
	 	
	 	dto.setQna_date(qna_date);
	 	
	 	dao.userQnaReg(dto);

		result = "/UserQnaReg.jsp";
		
		return result;
	}

	
	// 문의폼에서 등록하기 버튼 클릭하면 인서트한 후에 폼에 내용 등록된거 나온다.
	@RequestMapping(value="/userqnacont.action", method={RequestMethod.GET, RequestMethod.POST})
	public String userQnaCont(HttpServletRequest request, HttpServletResponse response, HttpSession session, Model model, UserDTO dto)
	{
		String result = null;
		
	    IUserDAO dao = sqlSession.getMapper(IUserDAO.class);
	  
	    // 세션에 있는 사용자 코드 얻어와서 dto에 set 해줌
	 	dto.setUser_dstn_cd((String)session.getAttribute("user_dstn_cd"));
	 	dto.setUser_name((String)session.getAttribute("user_name"));
	 	
	    
	 	// 사용자가 새로 입력한 내용들
	 	 String qna_title = request.getParameter("qna_title");
	 	 String qna_cont = request.getParameter("qna_cont");
	 	 String qna_view = request.getParameter("qna_view");
	 	 String qna_date = request.getParameter("qna_date");
	 	 

	    // 받아온 내용들 setter 에 담고 get으로 가져오기
	 	dto.setQna_title(qna_title);
	 	dto.setQna_cont(qna_cont);
	 	dto.setQna_view(qna_view);
	 	dto.setQna_date(qna_date);
	 
	 	
	 	dao.userQnaReg(dto);
	 	
		
       // model.addAttribute("userQnaReg");  // 필요없음 그냥 위에서 인서트 시키고 까지만 시키면 끝

		
		result = "/UserQnaCont.jsp";
		
		return result;
	}
}
