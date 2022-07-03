<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>영구정지 회원 상세정보</title>

<script type="text/javascript">
	function newPage()
	{
        window.location.href = "./adBan.jsp"
	}
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="./css/bootstrap.min.css">
    <link rel="stylesheet" href="./css/admin.css">
</head>
<body>

<div class="wrap">
    <header>
        <header>
            <!-- ○ 상단 네비게이션 include -->
            <jsp:include page="./AdNavManage.jsp"></jsp:include>
        </header>
    </header>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./AdMenuManage.jsp"></jsp:include>
            </div>
            <div class="span10">
                <main id="adBanInfo">
                    <section>
                        <div class="row">
                            <!-- 계정정보 -->
                            <div class="col-md-12 mt-3">
                                <div class="list-group">
                                    <h4>계정정보<small> 선택한 회원의 기본 계정정보 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table">
                                                <!-- 계정 정보 -->
                                                <tbody>
                                                    <tr>
                                                        <th class="user-code-column" style="width: 120px;">이용자코드</th>
                                                        <th class="name-column" style="width: 80px;">이름</th>
                                                        <th class="id-column" style="width: 120px;">아이디</th>
                                                        <th class="tel-column mobile" style="width: 120px;">전화번호</th>
                                                        <th class="date-column mobile" style="width: 120px;">가입일자</th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td>001001</td>
                                                        <td>이윤윤</td>
                                                        <td>test@test.com</td>
                                                        <td class="mobile">010-0000-0000</td>
                                                        <td class="mobile">2022-06-05</td>
                                                    </tr>
                                            
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 신고내역 -->
                            <div class="col-md-12">
                                <br>
                                <div class="list-group">
                                    <h4>신고내역<small> 선택한 영구정지 회원의 지난 6개월 내 신고내역 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <th class="rept">신고처리코드</th>
                                                        <th class="rept">신고처리일자</th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td><a href="AdPostRept.jsp">게시글122030</a></td>
                                                        <td>2022/05/29</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td><a href="AdPostRept.jsp">게시글122030</a></td>
                                                        <td>2022/05/29</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td><a href="AdCmntRept.jsp">댓글122030</a></td>
                                                        <td>2022/05/29</td>
                                                    </tr>
                                                </tbody>
                                            </table>
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