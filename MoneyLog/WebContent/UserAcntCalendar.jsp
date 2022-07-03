<%@page import="javax.websocket.Session"%>
<%@page import="java.util.Calendar"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<%
	// 데이터 수신
	String sYear = request.getParameter("defaultYear");
	String sMonth = request.getParameter("defaultMonth");
	// String dayIntot = request.getParameter("dayIntot");
	// String dayOutTot = request.getParameter("dayOutTot");
	
	// Calendar 객체 생성
	Calendar cal = Calendar.getInstance();
	
	// 현재 날짜
	int nowYear = cal.get(Calendar.YEAR);
	int nowMonth = cal.get(Calendar.MONTH)+1;
	int nowDay = cal.get(Calendar.DAY_OF_MONTH);
	
	int selectYear = nowYear;
	int selectMonth = nowMonth;
	
	if(sYear != null || sMonth != null)
	{
		selectYear = Integer.parseInt(sYear);
		selectMonth = Integer.parseInt(sMonth);
	}
	
	String yOptions = "";
	for(int year=(selectYear-2); year<=(selectYear+2); year++)
	{
		if(sYear==null && year==nowYear)
			yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
		else if (sYear!=null && Integer.parseInt(sYear)==year)
			yOptions += "<option value='" + year + "'selected='selected'>" + year + "</option>";
		else
			yOptions += "<option value='" + year + "'>" + year + "</option>";
	}
	
	String mOptions = "";
	for (int month=1; month<=12; month++)
	{
		if(sMonth==null && month==nowMonth)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else if(sMonth!=null && Integer.parseInt(sMonth)==month)
			mOptions += "<option value='" + month + "' selected='selected'>" + month + "</option>";
		else
			mOptions += "<option value='" + month + "'>" + month + "</options>";
	}
	
	// 월별 날짜
	int[] months = {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};
	
	if (selectYear%4==0 && selectYear%100!=0 || selectYear%400==0)
		months[1] = 29;
	
	// 총 날 수 누적 변수
	int nalsu;
	
	// 요일
	String[] weekNames = {"일요일", "월요일", "화요일", "수요일", "목요일", "금요일", "토요일"};
	
	nalsu = (selectYear-1)*365 + (selectYear-1)/4 - (selectYear-1)/100 + (selectYear-1)/400;
	
	for(int i=0; i<selectMonth-1; i++)
		nalsu += months[i];
	nalsu++;
	int week = nalsu%7;
	int lastDay = months[selectMonth-1];
	
	// 달력 그리기
	String calStr = "";
	calStr += "<table border='1'  class='col-12' id='calendar'>";
	
	// 요일 이름 발생
	calStr += "<tr>";
	for (int i=0; i<weekNames.length; i++)
	{
		if(i==0)									// 일요일
			calStr += "<th style='font-weight:bold; text-align:center; color:red;'>" + weekNames[i] + "</th>";
		else if(i==6)								// 토요일
			calStr += "<th style='font-weight:bold; text-align:center; color:blue;'>" + weekNames[i] + "</th>";
		else										// 평일
			calStr += "<th style='font-weight:bold; text-align:center;'>" + weekNames[i] + "</th>";
	}
	calStr += "</tr>";
	// 빈 칸 공백 td 발생
	calStr += "<tr>";
	for (int i=1; i<=week; i++)
		calStr += "<td></td>";

		
	// 날짜 td 발생
	for (int i=1; i<=lastDay; i++)
	{
		week++;								//-- 날짜가 하루씩 찍힐 때 마다(구성이 이루어질 때 마다) 요일도 함께 1씩 증가~!!!	check~!!!
		
		if(selectYear==nowYear && selectMonth == nowMonth && i==nowDay && week%7==0) //-- 토요일인 오늘
			calStr += "<td class='nowSat'><a href=\'useracntdaylist.action?day=" + i + "\' style=\'text-decoration:none\'>" + i + "<br><span class='mobile'>수입 : 12,000원<br>지출 : 12,000원</span></a></td>";
		else if (selectYear==nowYear && selectMonth == nowMonth && i==nowDay && week%7==1) //-- 일요일인 오늘
			calStr += "<td class='nowSun'><a href=\'useracntdaylist.action?day=" + i + "\' style=\'text-decoration:none\'>" + i + "<br><span class='mobile'>수입 : 12,000원<br>지출 : 12,000원</span></a></td>";
		else if(selectYear==nowYear && selectMonth == nowMonth && i==nowDay)		//-- 평일인 오늘
			calStr += "<td class='now'><a href=\'useracntdaylist.action?day=" + i + "\' style=\'text-decoration:none\'>" + i + "<br><span class='mobile'>수입 : 12,000원<br>지출 : 12,000원</span></a></td>";
		else if (week%7==0)															//-- 오늘이 아닌 토요일
			calStr += "<td class='sat'><a href=\'useracntdaylist.action?day=" + i + "\' style=\'text-decoration:none\'>" + i + "<br><span class='mobile'>수입 : 12,000원<br>지출 : 12,000원</span></a></td>";
		else if (week%7==1)															//-- 오늘이 아닌 일요일
			calStr += "<td class= 'sun'><a href=\'useracntdaylist.action?day=" + i + "\' style=\'text-decoration:none\'>" + i + "<br><span class='mobile'>수입 : 12,000원<br>지출 : 12,000원</span></a></td>";
		else																		//-- 오늘이 아닌 평일
			calStr += "<td><a href=\'useracntdaylist.action?day=" + i + "\' style=\'text-decoration:none\'>" + i + "<br><span class='mobile'>수입 : 12,000원<br>지출 : 12,000원</span></a></td>";
			
		if(week%7 == 0)
			calStr += "</tr><tr>";
	}
	
	// 빈칸 공백 td 발생
	for (int i=0 ; i<=week; i++, week++)
	{
		if (week%7==0)
			break;
		calStr += "<td></td>";
	}
	
	if (week%7!=0)
		calStr += "</tr>";
	
	calStr += "</table>";
	
	if(selectYear != 0 || selectMonth != 0)
	{
		String year = String.valueOf(selectYear);
		String month = String.valueOf(selectMonth);
		session.setAttribute("year", year);
		session.setAttribute("month", month);
	}
	else
	{
		String year = String.valueOf(sYear);
		String month = String.valueOf(sMonth);
		session.setAttribute("year", year);
		session.setAttribute("month", month);
	}
	
	
	// 세션에서 이용자활용정보코드 가져오기
    String user_dstn_cd = (String)session.getAttribute("user_dstn_cd");
	
%>
<%
	int pigTotCount = (int)request.getAttribute("pigTotCount");
	int pigMonthCount = (int)request.getAttribute("pigMonthCount");
	
	int result1 = pigTotCount > 60 ? 60 : pigTotCount;
	int result2 = pigMonthCount > 60 ? 60 : pigTotCount;
	
	double pigCount = (result1+result2)/(double)120;
	// double pigCount = ((result1+result2)/(double)60)/2*100;
	// double pigCount = Math.floor(((result1+result2)/(double)60)/2*100);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 가계부</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />
<script type="text/javascript">
	function formCalendar(obj)
	{
		obj.submit();
	}
	function moveMonthIn()
	{
		window.location.href = "./monthinlist.action";
	}
	function moveMonthOut()
	{
		window.location.href = "./monthoutlist.action";
	}
	function movePostReg()
	{
		<%-- window.location.href = "./moneypostreg.action?user_dstn_cd="+<%=user_dstn_cd%>; --%>
		window.location.href = "./moneypostreg.action?user_dstn_cd="+<%=user_dstn_cd%>;
	}
	function moveAnalysis()
	{
		window.location.href = "./analysis.action";
	}
</script>
</head>
<body>
	<!-- 상단 네비게이션바 -->
	<jsp:include page="./UserNav.jsp"></jsp:include>

	<div class="container">
		<div class="row">
			<div class="col-12">
				<div>
					<span>날짜 선택 &nbsp;</span>                     
					<form action="calendar.action" method="post">
						<select id="defaultyear" name="defaultYear" onchange="formCalendar(this.form)">
							<%=yOptions%>
						</select> 년
						<select id="defaultMonth" name="defaultMonth" onchange="formCalendar(this.form)">
							<%=mOptions%>
						</select> 월
					</form>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-12 m-2" style="text-align: center;">
				<%=selectYear %>년 <%=selectMonth %>월<br />
				<div class="page-header">
					<h1>내 가계부</h1>
				</div>
			</div>
		</div>
		<div class="row">
			<table class="col-6" style="text-align: center;">
				<tr>
					<th>
						<button type="button" class="btn btn-primary" style="background-color: #f79900; font-size: 20px" onclick="moveMonthIn()">
							수입<br />
							<span style="font-size: 17px;">
								<fmt:formatNumber value="${monthInTot }" groupingUsed="true"></fmt:formatNumber> 원
							</span>
						</button>	
						<!-- <a href="monthinlist.action" style="color: #f79900; font-size: 30px">
							■ 수입
						</a> -->
					</th>
				</tr>
			</table>
			<table class="col-6" style="text-align: center;">
				<tr>
					<th>
						<button type="button" class="btn btn-primary" style="background-color: #03a313; font-size: 20px" onclick="moveMonthOut()">
							지출 <br />
							<span style="font-size: 17px;">
								<fmt:formatNumber value="${monthOutTot }" groupingUsed="true"></fmt:formatNumber> 원
							</span>
						</button>
						<!-- <a href="monthoutlist.action" style="color: #03a313; font-size: 30px">
							■ 지출
						</a> -->
					</th>
				</tr>
			</table>
		</div>
		<div class="row mb-2">
			<div class="col-6" style="text-align: left;">
				<span style="color: #f79900">
					이월
					<fmt:formatNumber value="${nowRemain-monthInTot+monthOutTot }" groupingUsed="true"></fmt:formatNumber> 원
				</span>
			</div>
			<div class="col-6" style="text-align: right;">
				<span style="color: #03a313;">
					잔액 <fmt:formatNumber value="${nowRemain }" groupingUsed="true"></fmt:formatNumber> 원
				</span>
			</div>
		</div>

		<div class="row">
			<!-- <div class="col-12" id="calendar"> -->
			<!-- 달력 -->
			<%=calStr %>
		</div>

	</div>

	<div class="container mt-5 mb-5">
		<div class="row">

			<div class="col-11">

				<div class="list-group">

					<!-- 머니리뷰 달성 현황(현 오리바) -->
					<div class="progress" style="background-color: white;">

						<div
							class="progress-bar progress-bar bg-white progress-bar-animated"
							role="progressbar" 
							style="width: <%=(pigCount*100)-5%>%;"
							aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
						</div>
						<img style="width: 100px;" src="./img2/duck.gif">
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-11">

				<div class="list-group">
					<!-- 머니리뷰 프로그레스바 -->
					<div class="progress"
						style="height: 40px; background-color: #F7EDE2;">

						<div
							class="progress-bar progress-bar bg-warning progress-bar-animated"
							role="progressbar" style="font-size: 17pt; width: <%=pigCount*100%>%;"
							aria-valuenow="50" aria-valuemin="0" aria-valuemax="100">
							<%-- <fmt:formatNumber type="percent" value=""  pattern=".%"/> --%>
							<fmt:formatNumber type="percent" value="<%=pigCount%>" minIntegerDigits="0"/>
						</div>
					</div>
				</div>
			</div>
			<div class="col-1" style="place-items: left; display: grid;">
			<!-- 조건문으로 분기해줘야함!!!! -->
				<%
				if (pigCount != 1)
				{
				%>
					<!-- class의 btn-primary 빼면 테두리 사라짐! -->
					<button type="submit" class="btn" style="background-color:#b3b3b3; height: 40px; color: white;"
					 data-toggle="modal" data-target="#modal" disabled="disabled">리뷰하기</button>
				<%
				}
				else
				{
				%>
					<button type="submit" class="btn" style="background-color: #F7EDE2; height: 40px; color: white;"
					 data-toggle="modal" data-target="#modal">리뷰하기</button>
				<%
				}
				%>
			
			</div>
		</div>
		<div class="row mt-3">
			<div class="col-12">
				<button type="submit" class="btn" style="background-color: #1fa766; width: 100%; color: white;" onclick="moveAnalysis()">
					이번달 분석하기
				</button>
			</div>
		</div>
	</div>


	<!-- modal 만들기 ★ -->
	<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modal"
	aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h4 class="modal-title">목표 달성을 축하합니다!! </h4>
					
					<!-- 화면 닫기 버튼 -->
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidde="true">&times;</span>
					</button>
					
				</div>
				
				<div class="modal-body">
						<br>
						${user_name}님은 가계부를 공유할 수 있습니다.
						<br>
						머니리뷰를 작성하시겠습니까?
						
						<!-- 축하 이미지 넣기 -->
						<!-- <img src="./img2/image1.jpg" width="100%;"> -->
						
						<div class="modal-footer">
							<button type="button" class="btn btn-primary" style="width: 100px;" onclick="movePostReg()"> 네 </button>
							<button type="button" class="btn btn-secondary" style="width: 100px;" data-dismiss="modal"> 나중에 </button>
						</div>
				</div>
			</div>
		</div>
	</div> 
	<!-- modal 만들기 끝 -->

	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>