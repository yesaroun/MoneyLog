<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>문의하기 - 등록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/board.css">
<script type="text/javascript">

	$(function()
	{
		$("#qnaReg-btn").click(function()      // ※ button id : input_btn 으로 되어 있어서 수정
		{
			$("#err").css("display", "none");
					
			if($("#qna_title").val()=="")   // f12로 임의로 아이디 ""로 변경할 수 있길래 함 넣어봤음..
			{
					$("#err").html("※ 제목을 입력하세요.").css("display", "inline");
					return;
			}
			
			if($("#qna_cont").val()=="")
			{
					$("#err").html("※내용을 입력하세요.").css("display", "inline");
					return;
			}
			
			$("#qnaContForm").submit();	// 서브밋 하면 myinfomodify.action 처리
			
		});
				
	});
		
</script>
</head>
<body>
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavCs.jsp"></jsp:include>

	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    
		<div class="row d-flex d-md-block flex-nowrap wrapper">
           
            <nav class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
            	<!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./UserMenuCs.jsp"></jsp:include>
            </nav>            
        </div>
    
	<!-- 코드 들어가기 -->	
	
		<div class="container">
			<div class="row">
				<div class="col-12" id="List_title" style="margin-top: 30px;" >
					<h5 style="font-weight: bold;">문의하기</h5>
					<hr />
				</div>
			</div>
		</div>
	
		<div class="container">
				<div class="row">
					<form action="userqnacont.action" id="qnaContForm">
						<table id="cont" class="table2 col-12">
						     <tr>
						         <th>제목</th><!-- value 확인 -->
						      	 <td>
						      	 	<input type="text" id="qna_title" name="qna_title" style="padding-left:15px; width: 500px; height:35px;">
						      	 <td>
						     <tr>    
						         <th>작성자</th>
						         <td>
						         	<input type="text" id="user_name" name="user_name" value="${user_name }" style="padding-left:15px; width: 500px; height:35px; background-color: #EAE7E7; border:0 solid black;" readonly="readonly">
						         </td>
						     <tr>  
						     <tr>    
						         <th>작성일자</th>
						         <td>
						         	<input type="text" id="qna_date"  name="qna_date" value="2022-06-19" style="padding-left:15px; width: 500px; height:35px; background-color: #EAE7E7; border:0 solid black;" readonly="readonly">
						         </td>
						     <tr>    
						         <th>내용</th>
						         <td>
						         	<textarea id="qna_content" name="qna_content" rows="10" cols="60"></textarea>
						     	</td>    
						     </tr>
						</table>
						</form>
				</div>
				<div class="row">
						<div class="col-12" style="margin-top: 20px;">
							<button type="button" class="btn btn-primary"  style="background-color: skyblue; float: right;"  data-toggle="modal" data-target="#modal">등록하기</button>
							<button type="reset" class="btn btn-secondary" style="background-color: #1fa766; float: right;"  onclick="location.href='./userqnalist.action'">취소하기</button>
						</div>
				</div>
				<div>
                   <span id="err" style="color: red; display: none;"></span>
                </div>
		</div>
	</div>				

	
	<!-- 제이쿼리 자바스크립트 추가하기 -->
	<script src="./js/jquery-3.2.1.min.js"></script>
	<!-- Popper 자바스크립트 추가하기 -->
	<script src="./js/popper.min.js"></script>
	<!-- 부트스트랩 자바스크립트 추가하기 -->
	<script src="./js/bootstrap.min.js"></script>
	<!-- MDB 라이브러리 추가하기 <== chart!!!! **** -->
	<script src="./js/mdb.min.js"></script>


   <!-- modal 만들기 -->
   <div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modal"
   aria-hidden="true">
      <div class="modal-dialog">
         <div class="modal-content">
            <div class="modal-header">
               <h4 class="modal-title">등록되었습니다.</h4>
               
               <button type="button" class="close" data-dismiss="modal">
                  <span aria-hidde="true">&times;</span>
               </button>
            </div>
            
            <div class="modal-body" style="text-align : center;">
               <form>
                  <img src="./img3/register.png" width="50%;">
                  
                  <div class="modal-footer">
                     <button type="button" class="btn btn-primary"  id="qnaReg-btn">확인</button>
                  </div>
                  
               </form>
            </div>
         </div>
      </div>
   </div>


</body>
</html>