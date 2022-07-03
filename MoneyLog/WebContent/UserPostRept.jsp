<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>신고하기 - 게시글</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" type="text/css" href="<%=cp %>/css/board.css">
<script type="text/javascript">

	function postRept()
	{
		//confirm("신고가 완료되었습니다.");
		
		var post_empt_cd;
		var post_cd=${rnum };
		
		var cate = document.getElementById("postReptCate");
		var cateId = cate.options[cate.selectedIndex].value;
		
		var ReptDtlCont =  document.getElementById("postReptDtlCont");
		var postReptDtlCont =  ReptDtlCont.value;
		var user_dstn_cd = ${user_dstn_cd};
		
		if (cateId == 5)
		{
			// 카테고리 기타일때
			window.location.href = "./userpostlist.action?pageNum="+1;
		}
		else if (cateId != 5)
		{
			// 그 외
			window.location.href = "./userpostlist.action?pageNum="+1;
		} 
	}
	
	function postReptDtlContBox()
	{
		var cate = document.getElementById("postReptCate");
		var cateId = cate.options[cate.selectedIndex].value;
		if (cateId == 5)
		{
			//alert(cateId);
			var postReptDtlCont = document.getElementById("postReptDtlCont");
			postReptDtlCont.style.display='inline';
		}
		else if (cateId != 5)
		{
			//alert(cateId);
			var postReptDtlCont = document.getElementById("postReptDtlCont");
			postReptDtlCont.style.display='none';
		} 
	}
	
</script>
</head>
<body>
	<!-- ○ 상단 네비게이션 include -->
	<jsp:include page="./UserNavMoney.jsp"></jsp:include>

	<!-- 여백이 없는 반응형 웹을 만들때 container-fluid 사용 -->
    <div class="container-fluid">
    
		<div class="row d-flex d-md-block flex-nowrap wrapper">
    
	<!-- 코드 들어가기 -->	
	
		<div class="container">
			<div class="row">
				<div class="col-12" id="List_title" style="margin-top: 30px;" >
					신고하기 - 게시글
				</div>
			</div>
		</div>
	
		<div class="container">
				<div class="row">
						<table id="cont" class="table2 col-12">
						     <tr>
						         <th>게시글번호</th><!-- value 확인 -->
						      	 <td>
						      	 	<input type="text" value="${rnum }" style="padding-left:15px; width: 500px; height:35px; background-color: #EAE7E7; border:0 solid black;" readonly="readonly">
						      	 <td>
						     <tr>    
						         <th>신고구분</th>
						         <td>
						         	<select id="postReptCate" name="postReptCate" class="" style="padding-left:15px; width:500px;height:35px;" onchange="postReptDtlContBox()">
						               <option value="1" selected="selected">홍보/도배글</option>
						               <option value="2">음란물</option>
						               <option value="3">명예훼손/사생활침해</option>
						               <option value="4">욕설/생명경시/혐오/차별</option>
						               <option value="5">기타</option>
						            </select>
						         </td>
						     <tr>    
						         <th><div style="display: none;">내용</div></th>
						         <td>
						         	<textarea name="content" cols="60" rows="7"
						         	 id="postReptDtlCont" style="display: none;"></textarea>
						     	</td>    
						     </tr>
						     <tr>    
						         <th>신고일자</th><!-- value 확인 -->
						      	 <td>
						      	 	<input type="text" value="2022.06.20" style="padding-left:15px; width:500px;height:35px; background-color: #EAE7E7; border:0 solid black;" readonly="readonly">
						      	 </td>
						      </tr>	
						</table>
				</div>
				<div class="row">
					<div class="col-12" style="margin-top: 20px;">
						<button type="reset" class="btn btn-primary" style="background-color: #1fa766; float: right; padding-left: 10px;"
						onclick="postRept()">취소하기</button>
						
						<button type="submit" id="postReptBtn1" class="btn btn-secondary"
						style="background-color: skyblue; float: right;"  data-toggle="modal" data-target="#modal">신고하기</button>
					</div>
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
               <h4 class="modal-title">정말 신고하실건가요?</h4>
               
               <button type="button" class="close" data-dismiss="modal">
                  <span aria-hidde="true">&times;</span>
               </button>
            </div>
            
            <div class="modal-body" style="text-align : center;">
               <form>
                  <img src="./img3/warning.png" width="50%;">
                  <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                     <button type="button" class="btn btn-primary" onclick="postRept()">신고하기</button>
                  </div>
               </form>
            </div>
         </div>
      </div>
   </div>



</body>
</html>