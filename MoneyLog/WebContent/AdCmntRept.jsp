<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>댓글 신고 처리</title>

<script type="text/javascript">
	function newPage()
	{
        window.location.href = "./adCmntReptList.jsp"
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
                <main id="adCmntRept">
                    <section>
                        <div class="row">
			
                            <!-- 신고1 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <div class="list-group">
                                    <br><br>
                                    <h4>[ 댓글 ] 신고 접수<small></small></h4>
            
                                        <div class="list-group-item">
                                            <table class="table">
                                                <tbody>
                                                        
                                                    <!-- 신고 접수 -->
                                                    <tr>
                                                        <th colspan="3" style="text-align: center;">신고 번호</th>
                                                        <th colspan="3" style="text-align: center;">접수 일자</th>
                                                        <th colspan="3" style="text-align: center;">댓글 번호</th>
                                                        <th colspan="3" class="mobile" style="text-align: center;">신고자</th>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <td colspan="3" style="text-align: center;">33</td>
                                                        <td colspan="3" style="text-align: center;">2020-05-20</td>
                                                        <td colspan="3" style="text-align: center;"><a href="./boardView.html" style="color: #000000;">2032</a></td>
                                                        <td colspan="3" class="mobile" style="text-align: center;">test@test.com</td>
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
                            <!-- 신고2 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <div class="list-group">
                                    <br><br>
                                    <h4>승인 여부<small></small></h4>
            
                                        <div class="list-group-item">
                                            <table class="table">
                                                <tbody>
                                                        
                                                    <!-- 승인 여부 -->
                                                    <tr>
                                                        <th colspan="4" style="text-align: center;">승인 여부</th>
                                                        <th colspan="4" style="text-align: center;">처리자</th>
                                                        <th colspan="4" class="mobile" style="text-align: center;">처리 일자</th>
                                                    </tr>
                                                            
                                                    <tr>
                                                        <td colspan="4" style="text-align: center;"> - </td>
                                                        <td colspan="4" style="text-align: center;"> - </td>
                                                        <td colspan="4" class="mobile" style="text-align: center;"> - </td>
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
                            <!-- 신고3 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <div class="list-group">
                                    <br><br>
                                    <h4>신고 내용<small></small></h4>
            
                                        <div class="list-group-item">
                                            <table class="table">
                                                <tbody>
                                                        
                                                    <!-- 신고 내용 -->
                                                    <tr>
                                                        <th colspan="12" style="text-align: center;">게시글 내용</th>
                                                    </tr>
                                                            
                                                    <tr>
                                                        <td colspan="12" style="text-align: center;">♚♚머니로그☆가입시♚♚전원 100만~</td>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <th colspan="6"  style="text-align: center;">신고 카테고리</th>
                                                        <th colspan="6" style="text-align: center;">신고 세부 사유</th>
                                                    </tr>
                                                            
                                                    <tr>
                                                        <td colspan="6" style="text-align: center;">홍보</td>
                                                        <td colspan="6" style="text-align: center;"> - </td>
                                                    </tr>
                                                    
                                                    
                                                    <!-- 게시글 버튼 -->
                                                    <tr>
                                                        <td colspan="12">
                                                            <button class="btn" style="width: 100%;" data-toggle="modal" data-target="#modal" onclick="location.href='MoneyPost.jsp'">
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
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <!-- 신고4 -->
                            <div class="col-md-12">
                                <div class="list-group">
                                    <div class="list-group">
                                    <br><br>
                                    <h4>신고 처리<small></small></h4>
            
                                        <div class="list-group-item">
                                            <table class="table">
                                                <tbody>
                                                        
                                                    <!-- 신고처리 -->
                                                    <tr>
                                                        <td colspan="12">
                                                            <button class="btn" style="width: 49%; background-color: #F5CAC3;">승인</button>
                                                            <button class="btn" style="width: 50%; background-color: #F7EDE2;">반려</button>
                                                        </td>
                                                    </tr>
                                                    
                                                    <!-- 돌아가기 버튼 -->
                                                    <tr>
                                                        <td colspan="12">
                                                            <button class="btn" style="width: 100%;" onclick="location.href='AdCmntReptList.jsp'">돌아가기</button>
                                                        </td>
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