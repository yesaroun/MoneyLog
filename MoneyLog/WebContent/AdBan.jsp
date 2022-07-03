<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>영구정지 회원 목록</title>

<script type="text/javascript">
	function newPage()
	{
        window.location.href = "./adBanInfo.jsp"
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
                    <main id="adBan">
                        <section>
                            <div class="row">
                                <!-- 영구정지 회원 리스트 -->
                                <div class="col-md-12 mt-3 mb-3">
                                    <div class="list-group">
                                        <h4>영구정지 회원 목록<small> 영구정지된 회원들을 관리하세요</small></h4>
                                        <div class="list-group-item">
                                            <div class="list-group">
                                                <table class="table">
                                                    <tbody>
                                                        <tr>
                                                            <th class="number-column" >번호</th>
                                                            <th class="user-code-column mobile" >이용자코드</th>
                                                            <th class="name-column" >이름</th>
                                                            <th class="id-column mobile" >아이디</th>
                                                            <th class="ban-date-column mobile" >정지일자</th>
                                                            <th class="rept-column" >상세정보/신고내역</th>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td >3</td>
                                                            <td class="mobile" >001001</td>
                                                            <td >이윤태</td>
                                                            <td class="mobile" >test@test.com</td>
                                                            <td class="mobile" >2022-06-05</td>
                                                            <td>
                                                                <button type="button" class="btn btn-success" onclick="location.href='AdBanInfo.jsp'">보기</button>
                                                            </td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td style="">3</td>
                                                            <td class="mobile" >001001</td>
                                                            <td >이태태</td>
                                                            <td class="mobile" >test@test.com</td>
                                                            <td class="mobile" >2022-06-05</td>
                                                            <td >
                                                                <button type="button" class="btn btn-success" onclick="location.href='AdBanInfo.jsp'">보기</button>
                                                            </td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td >3</td>
                                                            <td class="mobile" >001001</td>
                                                            <td >이태태</td>
                                                            <td class="mobile" >test@test.com</td>
                                                            <td class="mobile" >2022-06-05</td>
                                                            <td >
                                                                <button type="button" class="btn btn-success" onclick="location.href='AdBanInfo.jsp'">보기</button>
                                                            </td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td >3</td>
                                                            <td class="mobile" >001001</td>
                                                            <td >이태태</td>
                                                            <td class="mobile" >test@test.com</td>
                                                            <td class="mobile" >2022-06-05</td>
                                                            <td >
                                                                <button type="button" class="btn btn-success" onclick="location.href='AdBanInfo.jsp'">보기</button>
                                                            </td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td >3</td>
                                                            <td class="mobile" >001001</td>
                                                            <td >이태태</td>
                                                            <td class="mobile" >test@test.com</td>
                                                            <td class="mobile" >2022-06-05</td>
                                                            <td >
                                                                <button type="button" class="btn btn-success" onclick="location.href='AdBanInfo.jsp'">보기</button>
                                                            </td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td >3</td>
                                                            <td class="mobile" >001001</td>
                                                            <td >이태태</td>
                                                            <td class="mobile" >test@test.com</td>
                                                            <td class="mobile" >2022-06-05</td>
                                                            <td >
                                                                <button type="button" class="btn btn-success" onclick="location.href='AdBanInfo.jsp'">보기</button>
                                                            </td>
                                                        </tr>
                                                        
                                                        <tr>
                                                            <td >3</td>
                                                            <td class="mobile" >001001</td>
                                                            <td >이태태</td>
                                                            <td class="mobile" >test@test.com</td>
                                                            <td class="mobile" >2022-06-05</td>
                                                            <td style="">
                                                                <button type="button" class="btn btn-success" onclick="location.href='AdBanInfo.jsp'">보기</button>
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