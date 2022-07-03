<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 게시판</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
<script type="text/javascript">

	function sendIt()
	{
	}
</script>
</head>
<body>

<div class="wrap">
    <header>
        <header>
            <!-- ○ 상단 네비게이션 include -->
	        <jsp:include page="./AdNavCs.jsp"></jsp:include>
        </header>
    </header>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./AdMenuCs.jsp"></jsp:include>
            </div>
            <div class="span10">
                <main id="adNotiList">
                    <section>
                        <div class="row">
                            <div class="col-12" style="margin-top: 30px;" >
                                <div class="list-title">
                                        공지사항
                                </div>
                            </div>
                        </div>
                    
                        <div class="row">
                            <div class="col-12">
                                <table class="table table-striped board-table">
                                    <tr>
                                        <!-- 항목 -->
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>작성자</th>
                                        <th>등록일자</th>
                                        <th>조회수</th>
                                    </tr>	
                                    <tr>
                                        <td>38</td>
                                        <td><a href="AdNotiCont.jsp">서비스 이용약관 변경 안내</a></td>
                                        <td>admin1</td>
                                        <td>2022.06.06</td>
                                        <td>402</td>
                                    </tr>
                                    <tr>
                                        <td>37</td>
                                        <td><a href="AdNotiCont.jsp">버전3 업데이트 내용 안내</a></td>
                                        <td>admin1</td>
                                        <td>2022.06.01</td>
                                        <td>186</td>
                                    </tr>
                                    <tr>
                                        <td>36</td>
                                        <td>버전3 업데이트 안내</td>
                                        <td>admin1</td>
                                        <td>2022.06.01</td>
                                        <td>412</td>
                                    </tr>
                                    <tr>
                                        <td>35</td>
                                        <td>서비스 변경 안내</td>
                                        <td>admin2</td>
                                        <td>2022.05.12</td>
                                        <td>106</td>
                                    </tr>
                                    <tr>
                                        <td>34</td>
                                        <td>게시물 업데이트 안내</td>
                                        <td>머니로그 관리자</td>
                                        <td>2022.05.08</td>
                                        <td>397</td>
                                    </tr>
                                    <tr>
                                        <td>33</td>
                                        <td>머니로그 보안 작업에 따른 변경사항 안내</td>
                                        <td>머니로그 관리자</td>
                                        <td>2022.05.08</td>
                                        <td>397</td>
                                    </tr>
                                    <tr>
                                        <td>32</td>
                                        <td>서비스 내용 안내</td>
                                        <td>admin2</td>
                                        <td>2022.05.01</td>
                                        <td>824</td>
                                    </tr>
                                    <tr>
                                        <td>31</td>
                                        <td>서비스 이용약관 변경 안내</td>
                                        <td>admin2</td>
                                        <td>2022.04.21</td>
                                        <td>642</td>
                                    </tr>
                                    <tr>
                                        <td>30</td>
                                        <td>서비스 이용약관 변경 안내</td>
                                        <td>admin2</td>
                                        <td>2022.04.18</td>
                                        <td>486</td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div class="row">	
                            <div class="col-12">
                                <button type="button" class="btn btn-success" style="float: right;"onclick="javascript:location.href='<%=cp%>/AdNotiReg.jsp'" >작성하기</button>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12" style="place-items: center; display: grid;">
                                <div class="paging">
                                    <p> 1 <span style="color: #F5CAC3;">Prev</span> 21 22 23 24 25 26 27 28 29 30 <span style="color: #92B4EC;">Next</span> 54</p>		
                                </div>	
                            </div>
                        </div>
                    </section>
                </main>
            </div>
        </div>
    </div>
</div>

	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>

</body>
</html>