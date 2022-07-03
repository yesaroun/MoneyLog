<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>관리자 문의사항 게시판</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
<script type="text/javascript">

	function sendIt()
	{
		alert("검색");
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
                                <div class="list_title">
                                        문의사항
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <div class="col-12">
                                <table class="table table-striped board-table">
                                    <tr>
                                        <!-- 항목 -->
                                        <th>번호</th>
                                        <th>제목</th>
                                        <th>답변처리</th>
                                        <th>등록일자</th>
                                    </tr>	
                                    <tr>
                                        <td>38</td>
                                        <td><a href="AdQnaAnswer.jsp">홈페이지 활용 방법을 모르겠어요</a> </td>
                                        <td> - </td>
                                        <td>2022.05.17</td>					      	
                                    </tr>
                                        
                                    <tr>
                                        <td>37</td>
                                        <td><a href="AdQnaAnswer.jsp">가계부 입력 모르겠어요</a></td>
                                        <td> - </td>
                                        <td>2022.05.10</td>	
                                    </tr>
                                    
                                    <tr>
                                        <td>36</td>
                                        <td><a href="AdQnaAnswer.jsp">머니의 전당이 뭔가요</a></td>
                                        <td>완료</td>
                                        <td>2022.05.01</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>35</td>
                                        <td><a href="AdQnaAnswer.jsp">마이페이지가 어디있나요</a></td>
                                        <td>완료</td>
                                        <td>2022.04.23</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>34</td>
                                        <td>머니로그 광고 문의드려요</td>
                                        <td>완료</td>
                                        <td>2022.04.18</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>33</td>
                                        <td>가계부를 어떻게 작성하죠</td>
                                        <td>완료</td>
                                        <td>2022.04.11</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>32</td>
                                        <td>이것 저것 물어보는 곳인가요?</td>
                                        <td>완료</td>
                                        <td>2022.04.08</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>31</td>
                                        <td>이용자 신고는 어디서 하죠</td>
                                        <td>완료</td>
                                        <td>2022.04.01</td>
                                    </tr>
                                    
                                    <tr>
                                        <td>30</td>
                                        <td>분석하기 문의</td>
                                        <td>완료</td>
                                        <td>2022.03.25</td>
                                    </tr>
                                </table>
                                <div class="row">
                                    <div class="col" style="place-items: center; display: grid;">
                                        <div id="paging" class="mb-5">
                                            <p>1 <span style="color: #F5CAC3;">Prev</span> 21 22 23 24 25 26 27 28 29 30 <span style="color: #92B4EC;">Next</span> 54</p>		
                                        </div>	
                                    </div>
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