<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 - 수정</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<script type="text/javascript">
	
		/* 수정 기능은 잠시 보류 */
	
		$(function()
		{
			// 체크박스를 클릭할 때 작동
			$('input[name="pin"]').change(function()
			{
				// 상단고정 체크한다면
				if( $('input[name="pin"]').is(":checked") == true ) 
				{
					//alert("상단고정 x → 상단고정");
				
					// noti_pin 의 value 값은 Y 로 바뀌어야 함
					var noti_pin = $("#pin2").val('Y');
					
					// id가 noti_pin 인 input 태그 값을 Y 로 지정하여 넘겨줌
					//$("#noti_pin").val() = noti_pin;
					
					//$('input[name="pin"]').val('Y');
					
				}
				// 체크된 상단고정 해제한다면
				else 
				{
					//alert("상단고정 → 상단고정 x");
				
					// noti_pin 의 value 값은 N 으로 바뀌어야 함
					var noti_pin = $("#pin1").val('N');
					
					// id가 noti_pin 인 input 태그 값을 N 으로 지정하여 넘겨줌
					
					
					//$('input[name="pin"]').val('N');
				}
				
				return noti_pin;
				
			});
			
		});
	
		function update(noti_pin)
		{
			window.location.href = "./adnotiupdate.action?noti_cd=" + ${update.noti_cd} + "?noti_title=" + ${update.noti_title} + "?noti_noti_cont=" + ${update.noti_cont} + "?noti_pin=" + noti_pin;
			$("#updateForm").submit();
		}
 		
 		
</script>
</head>
<body>


<div class="wrap">
    <header>
    	<!-- ○ 상단 네비게이션 include -->
        <jsp:include page="./AdNavCs.jsp"></jsp:include>
    </header>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./AdMenuCs.jsp"></jsp:include>
            </div>
            <div class="span10">
                <main id="adNotiUpdate">
                    <section>
                        <div class="row">
                            <div class="col-12 notice-title">
                                <div class="list-title">
                                    공지사항(관리자)
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                    <form action="./adnotiupdate.action" id="updateForm" >
                        <div class="row">
                            <table id="cont" class="table2 col-12">
                                <tr>
                                    <th>공지유형</th>
                                    <td>
                                        <c:choose>
                                        	<c:when test="${update.noti_pin eq 'N'}">
                                        		<label for="pin"><input type="checkbox" id="pin1" name="pin"> 상단고정</label>
                                        	</c:when>
                                        	<c:otherwise>
                                        		<label for="pin"><input type="checkbox" id="pin2" name="pin" checked="checked"> 상단고정</label>
                                        	</c:otherwise>
                                        </c:choose>
                                    <td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td>
                                        <input class="table-title" id="title" type="text" value="${update.noti_title}">
                                    <td>
                                </tr>
                                <tr>    
                                    <th>내용</th>
                                    <td>
                                        <textarea class="table-content" id="cont" name="content" rows="10" cols="60">${update.noti_cont}</textarea>
                                    </td>    
                                </tr>
                            </table>

                        </div>
                        <div class="row">
                            <div class="col-12" style="margin-top: 20px;">	
                                <button type="submit" class="btn btn-primary reg-btn" id="updateBtn">등록하기</button>
                                <button type="button" class="btn btn-secondary return-btn"
                                onclick="javascript:location.href='<%=cp%>/adnoticont.action?noti_cd=${update.noti_cd}'">취소하기</button>
                            </div>
                        </div>
                    </form>
                    </section>
                </main>
            </div>
        </div>
    </div>
</div>


<%-- 
<!-- modal 만들기 -->
<div class="modal fade" id="modal" tabindex="-1" aria-labelledby="modal"
aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">수정되었습니다.</h4>
                
                <button type="button" class="close" data-dismiss="modal">
                    <span aria-hidde="true">&times;</span>
                </button>
            </div>
        
            <div class="modal-body" style="text-align : center;">
                <img src="./img3/register.png" width="50%;">
                  <form id="updateform">
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-primary" onclick="update()">확인</button>
                   	
                   		<input type="hidden" name="noti_cd" id="noti_cd" value="${update.noti_cd}" /> 
                        <input type="hidden" name="noti_title" id="noti_title" value="${update.noti_title}" /> 
                   		<input type="hidden" name="noti_cont" id="noti_cont" value="${update.noti_cont}" /> 
                   		
                    </div>
                  </form>  

					"adnotiupdate.action?noti_cd=" + ${update.noti_cd} + "?noti_title=" + ${update.noti_title} +
	 									 "?noti_pin=" + noti_pin + "?noti_cont=" + ${update.noti_cont} );

                 <form>
                    <img src="./img3/register.png" width="50%;">
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="javascript:location.href='<%=cp%>/adnotiupdate.action">확인</button>
                    

                        <input type="hidden" name="noti_pin" id="noti_pin" value="noti_pin" /> 
                        
                        
                    </div>
                    
                </form>
               
            </div>
        </div>
    </div>
</div>
	 --%>
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>

</body>
</html>