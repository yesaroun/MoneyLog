<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>커뮤니티 웹 사이트</title>

<script type="text/javascript">
	function newPage()
	{
	    window.location.href = "./adUserList.jsp"
	}
</script>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- 부트스트랩 CSS 추가하기 -->
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
</head>
<body>
<div class="wrap">
    <!-- ○ 상단 네비게이션 include -->
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
                <main id="adUserInfo">
                    <section>
                        <div class="row">
                            <div class="col-sm-12 m-3">
                                <div class="btn-group float-left">
                                    <button type="button" class="btn dropdown-toggle info-btn" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 상세 정보</button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="./AdUserInfo.jsp" style="background-color: #F0B1A8;">상세 정보</a>
                                        <a class="dropdown-item" href="./AdUserPostList.jsp">게시글 내역</a>
                                        <a class="dropdown-item" href="./AdUserCmntList.jsp">댓글 내역</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 계정정보 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <h4>계정정보<small> 선택한 회원의 기본 계정정보 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table user-info-table">
                                                <tbody>
                                                    <!-- 계정 정보 -->
                                                    <tr>
                                                        <th class="code-column" >이용자코드</th>
                                                        <th class="name-column" >이름</th>
                                                        <th class="id-column mobile">아이디</th>
                                                        <th class="tel-column mobile" >전화번호</th>
                                                        <th class="date-column mobile" >가입일자</th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td >001001</td>
                                                        <td >이윤윤</td>
                                                        <td class="mobile" >test@test.com</td>
                                                        <td class="mobile" >010-0000-0000</td>
                                                        <td class="mobile" >2022-06-05</td>
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
                            <!-- 활용정보1 -->
                            <div class="col-md-12">
                                <br>
                                <div class="list-group">
                                    <h4>활용정보<small> 선택한 회원의 활용정보 입니다.</small></h4>
                                    <div class="list-group-item">
                                        <div class="list-group">
                                            <table class="table">
                                                <tbody>
                                                    <!-- 계정 정보 -->
                                                    <tr>
                                                        <th >주민번호</th>
                                                        <th class="mobile">반려동물</th>
                                                        <th class="mobile">결혼여부</th>
                                                        <th class="mobile">자녀수</th>
                                                        <th class="mobile">총가구구성원수</th>
                                                        <th class="mobile">차량운용대수</th>
                                                        <th class="mobile">주거형태</th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td >990304-2</td>
                                                        <td class="mobile">2</td>
                                                        <td class="mobile">미혼</td>
                                                        <td class="mobile">0</td>
                                                        <td class="mobile">1</td>
                                                        <td class="mobile">1</td>
                                                        <td class="mobile">전세</td>
                                                    </tr>
                                                    <tr>
                                                        <th colspan="2" >지역 1차</th>
                                                        <th class="mobile" colspan="2" >지역 2차</th>
                                                        <th colspan="2" >직업 1차</th>
                                                        <th class="mobile" colspan="2" >직업 2차</th>
                                                    </tr>
                                                            
                                                    <tr>
                                                        <td colspan="2" >서울</td>
                                                        <td class="mobile" colspan="2" >성동구</td>
                                                        <td colspan="2" >IT/개발</td>
                                                        <td class="mobile" colspan="2" >프론트엔드</td>
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
                                                        <th>신고처리코드</th>
                                                        <th >신고처리일자</th>
                                                    </tr>
                                                    <tr>
                                                        <td><a href="">게시글122030</a></td>
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