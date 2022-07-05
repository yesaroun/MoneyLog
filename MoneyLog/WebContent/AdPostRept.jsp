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
        window.location.href = "./adPostReptList.jsp"
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
    <header>
        <!-- ○ 상단 네비게이션 include -->
        <jsp:include page="./AdNavManage.jsp"></jsp:include>
    </header>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./AdMenuManage.jsp"></jsp:include> 
            </div>
            <div class="span10">
                <main id="adPostRept">
                    <section>
                        <div class="row">
                            <!-- 신고접수 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <br><br>
                                    <h4>[ 게시글 ] 신고 접수</h4>
                                    <div class="list-group-item">
                                        <table class="table">
                                            <tbody>
                                                <tr>
                                                    <th colspan="3">신고 번호</th>
                                                    <th colspan="3">접수 일자</th>
                                                    <th colspan="3">게시글 번호</th>
                                                    <th colspan="3" class="mobile">신고자</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">33</td>
                                                    <td colspan="3">2020-05-20</td>
                                                    <td colspan="3"><a href="./AdPostInfo.jsp">2032</a></td>
                                                    <td colspan="3" class="mobile">test@test.com</td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 승인여부 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <br><br>
                                    <h4>승인 여부</h4>
                                    <div class="list-group-item">
                                        <table class="table">
                                            <tbody>
                                                <!-- 승인 여부 -->
                                                <tr>
                                                    <th colspan="4">승인 여부</th>
                                                    <th colspan="4">처리자</th>
                                                    <th colspan="4" class="mobile">처리 일자</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="4"> - </td>
                                                    <td colspan="4"> - </td>
                                                    <td colspan="4" class="mobile"> - </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 신고내용 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <br><br>
                                    <h4>신고 내용</h4>
                                    <div class="list-group-item">
                                        <table class="table">
                                            <tbody>
                                                <!-- 신고 내용 -->
                                                <tr>
                                                    <th colspan="12">게시글 내용</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="12">어쩌구저쩌구 게시글내용 부분입니다~</td>
                                                </tr>
                                                <tr>
                                                    <th colspan="6">신고 카테고리</th>
                                                    <th colspan="6">신고 세부 사유</th>
                                                </tr>
                                                <tr>
                                                    <td colspan="6">기타</td>
                                                    <td colspan="6">이상한 글을 썼어요</td>
                                                </tr>
                                                <!-- 게시글 버튼 -->
                                                <tr>
                                                    <td colspan="12">
                                                        <button class="btn send-content-btn" data-toggle="modal" data-target="#modal" onclick="location.href='MoneyPost.jsp'">
                                                            게시글 보러가기
                                                        </button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 신고 처리 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <br><br>
                                    <h4>신고 처리<small></small></h4>
                                    <div class="list-group-item">
                                        <table class="table">
                                            <tbody>
                                                <!-- 신고처리 -->
                                                <tr>
                                                    <td colspan="12">
                                                        <button class="btn approve-btn" data-toggle="modal" data-target="#modal">승인</button>
                                                        <button class="btn deny-btn" data-toggle="modal" data-target="#modal">반려</button>
                                                    </td>
                                                </tr>
                                                <!-- 돌아가기 버튼 -->
                                                <tr>
                                                    <td colspan="12">
                                                        <button class="btn return-btn" data-toggle="modal" data-target="#modal" onclick="location.href='AdPostReptList.jsp'">돌아가기</button>
                                                    </td>
                                                </tr>
                                            </tbody>
                                        </table>
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