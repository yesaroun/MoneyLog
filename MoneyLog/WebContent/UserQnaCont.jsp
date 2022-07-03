<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>문의하기 - 게시글</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/board.css">
<script type="text/javascript">

	function qnaDelete()
	{
		confirm("삭제가 완료되었습니다.");
		window.location.href = "http://localhost:8090/WEB/UserQnaList.jsp";
	}

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
						<table id="cont" class="table2 col-12">
						     <tr>    
						         <th>제목</th>
						         <td>
						         	${qna_title }
						         </td>
						     </tr>  
						     <tr>    
						         <th>내용</th>
						         <td>
						         	<textarea name="content" rows="10" cols="60" readonly="readonly">${qna_cont }</textarea>
						     	</td>    
						     </tr>
						</table>
				</div>
				
				<!-- 관리자 답변 -->
				<div class="container">
					<div class="row" >
						<div class="col-2" style="margin-top: 30px; text-align: right; font-weight: bold; font-size: 18px;" >
							답변
						</div>
						<div class="col-8" style="margin-top: 20px;" >
							<div class="input-group">
								   <input type="text" class="form-control" style="height: 70px; border: 1px solid;" readonly="readonly">
							</div>
						</div><!-- /.col-sm-8 -->
						<div class="col-2" style="margin-top: 20px;" >
							<img src="./img3/operator.png" width="80px;">
						</div>
					</div>
					<br>
					
				</div>
				
				<div class="row">
						<div class="col-12" style="margin-top: 20px;">
								
								<button type="submit" class="btn btn-primary" style="background-color: lightgray; float: right;"
								onclick="javascript:location.href='<%=cp%>/UserQnaUpdate.jsp'">수정하기</button>
								
								<button type="submit" class="btn btn-secondary" style="background-color: skyblue; float: right;" 
								data-toggle="modal" data-target="#modal">삭제하기</button>
						
								<button type="submit" class="btn btn-third" style="background-color: #1fa766; float: right; color: white;"
								onclick="javascript:location.href='<%=cp%>/UserQnaList.jsp'">목록가기</button>
						</div>
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
               <h4 class="modal-title">정말 삭제하실건가요?</h4>
               
               <button type="button" class="close" data-dismiss="modal">
                  <span aria-hidde="true">&times;</span>
               </button>
            </div>
            
            <div class="modal-body" style="text-align : center;">
               <form>
                  <img src="./img3/warning.png" width="50%;">
                  
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">취소하기</button>
                     <button type="button" class="btn btn-primary" onclick="qnaDelete()">삭제하기</button>
                  </div>
                  
               </form>
            </div>
         </div>
      </div>
   </div>

</body>
</html>