<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/admin.css" />
</head>
<body>
    <div class="wrap">
        <!-- ○ 상단 네비게이션 include -->
        <header>
            <jsp:include page="./AdNavGuest.jsp"></jsp:include>
        </header>

        <section>
            <div class="container">
                <div class="row login-title" >
                    <div class="col-12" >
                        <h1>MONEYLOG</h1>
                    </div>
                    
                </div>
                <div class="row pt-2" >
                    <div id="loginForm">
                        <form action=""> 
                            <input type="text" name="id" class="text-field form-control" placeholder="아이디" />
                            <input type="password" name="pw" class="text-field form-control" placeholder="비밀번호" />
                            <button type="button" onclick="location.href='AdMain.jsp'" class="btn btn-primary" id="loginBtn">관리자 로그인</button>
                        </form>
                    </div>
                </div>
            </div>
        </section>
    </div>
	
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>