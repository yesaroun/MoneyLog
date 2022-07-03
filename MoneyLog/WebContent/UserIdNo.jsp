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
<title>아이디찾기결과</title>
<link rel="stylesheet" href="./css/bootstrap.min.css" />
<link rel="stylesheet" href="./css/main.css" />

<script src="./js/userTerms.js"></script>
</head>
<body>
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./GuestNav.jsp"></jsp:include>

	<div class="container-fixed m-4">
        <div class="row sign-up-form">
            <h2 id="sign-up-intro">아이디 찾기 <span id="sign-up-moneylog">MONEYLOG</span></h2>
        </div>

        <div class="row bg-light sign-up-form mt-3" style="border-radius: 3px;">
			<div class="sign-up-process col-12">
                <form class="pt-3 md-3" style="max-width: 720px">
					<div class="form-group text-center">
						<img src="img2/frown.svg" alt="슬픈얼굴" style="width: 50px;" class="mb-3">
						<p>입력하신 정보로 회원님의 계정을 찾을 수 없습니다.</p>
					</div>
					<div class="text-center mt-3">
						<button type="submit" class="btn btn-primary mb-3" style="background-color: #1fa766;">아이디찾기</button>
						<button type="submit" class="btn btn-primary mb-3" style="background-color: #1fa766;">로그인하러 가기</button>
					</div>
					
				</form>
            </div>
		</div>
    </div>

    <script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>
</body>
</html>