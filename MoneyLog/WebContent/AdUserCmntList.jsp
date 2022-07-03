<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>댓글 내역 목록</title>

<script type="text/javascript">
	function newPage()
	{
	    window.location.href = "./adUserList.jsp"
	}
</script>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
</head>
<body>

    <div class="wrap">
        <!-- ○ 상단 네비게이션 include -->
        <header>
            <header>
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
                    <main id="adUserCmmtList">
                        <section>
                            <div class="row">
                                <div class="col-sm-12 m-3">
                                    <div class="btn-group float-left ">
                                        <button type="button" class="btn info-btn dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 댓글 내역 </button>
                                        <div class="dropdown-menu">
                                            <a class="dropdown-item" href="./AdUserInfo.jsp">상세 정보</a>
                                            <a class="dropdown-item" href="./AdUserPostList.jsp">게시글 내역</a>
                                            <a class="dropdown-item" href="./AdUserCmntList.jsp" style="background-color: #F0B1A8;">댓글 내역</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <section>
                            <div class="row">
                                <!-- 댓글 내역 -->
                                <div class="col-md-12">
                                    <div class="list-group">
                                        <h4>댓글 내역<small> 해당 회원이 등록한 댓글입니다.</small></h4>
                                        <div class="list-group-item">
                                            <div class="list-group">
                                                <table class="table table-striped">
                                                    <thead>
                                                    <tr>
                                                        <th scope="col" class="mobile number-column" >no</th>
                                                        <th scope="col" class="mobile board-number-column">게시글 번호</th>
                                                        <th scope="col" class="mobile" >댓글 내용</th>
                                                        <th scope="col" class="mobile date-column">날짜</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td scope="row" class="mobile" >5</td>
                                                            <td scope="row" class="mobile" >
                                                                <a href="./AdCmntInfo.jsp" >2032</a>
                                                            </td>
                                                            <td> <a href="./AdCmntInfo.jsp">가게부 잘 보고갑니다 참고할게요~~~</a> </td>
                                                            <td class="mobile" >2018-01-05</td>
                                                        </tr>
                                                        <tr>
                                                            <td scope="row" class="mobile" >5</td>
                                                            <td scope="row" class="mobile" >
                                                                <a href="./AdCmntInfo.jsp" >2032</a>
                                                            </td>
                                                            <td> <a href="./AdCmntInfo.jsp">가게부 잘 보고갑니다 참고할게요 !! 가게부 잘 보고갑니다 참고할게요~~가게부 잘 보고갑니다 참고할게요@@</a> </td>
                                                            <td class="mobile" >2018-01-05</td>
                                                        </tr>
                                                        <tr>
                                                            <td scope="row" class="mobile" >5</td>
                                                            <td scope="row" class="mobile" >
                                                                <a href="./AdCmntInfo.jsp" >2032</a>
                                                            </td>
                                                            <td> <a href="./AdCmntInfo.jsp">가게부 잘 보고갑니다 참고할게요</a> </td>
                                                            <td class="mobile" >2018-01-05</td>
                                                        </tr>
                                                        <tr>
                                                            <td scope="row" class="mobile" >5</td>
                                                            <td scope="row" class="mobile" >
                                                                <a href="./AdCmntInfo.jsp" >2032</a>
                                                            </td>
                                                            <td> <a href="./AdCmntInfo.jsp">가게부 잘 보고갑니다 참고할게요</a> </td>
                                                            <td class="mobile" >2018-01-05</td>
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