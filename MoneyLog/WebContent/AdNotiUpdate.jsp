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

/* --> 진행중
		$(function()
		{
			// 체크박스를 클릭할 때 작동
			$('input[name="pin"]').change(function()
			{
				//alert("확인");
				
				//var value = $(this).val();
				//var checked = $(this).prop('checked', 1);
				
				// $("#pin1") 체크박스를 건드리면 noti_pin 은 Y 로 바뀌어야 함
				if($("#pin1"))
				{
					// value 1 을 줄 것이고, 1일 경우에 컨트롤러에서 update 쿼리가 noti_pin 이 y 로 바뀌는 메소드 실행
					$("#pin1").prop("value", 1);
				}
				// $("#pin2") 체크박스를 건드리면 noti_pin 은 N 로 바뀌어야 함
				else
				{
					// value 1 을 줄 것이고, 1일 경우에 컨트롤러에서 update 쿼리가 noti_pin 이 y 로 바뀌는 메소드 실행
					$("#pin2").prop("value", 0);
				}
			});
			
		});
 */
 
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
                        <div class="row">
                            <table id="cont" class="table2 col-12">
                                <tr>
                                    <th>공지유형</th>
                                    <td>
                                        <c:choose>
                                        	<c:when test="${UpdateForm.noti_pin eq 'N'}">
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
                                        <input class="table-title" type="text" value="${UpdateForm.noti_title}">
                                    <td>
                                </tr>
                                <tr>    
                                    <th>내용</th>
                                    <td>
                                        <textarea class="table-content" name="content" rows="10" cols="60">${UpdateForm.noti_cont}</textarea>
                                    </td>    
                                </tr>
                            </table>

                        </div>
                        <div class="row">
                            <div class="col-12" style="margin-top: 20px;">	
                                <button type="submit" class="btn btn-primary reg-btn" data-toggle="modal" data-target="#modal">등록하기</button>
                                <button type="button" class="btn btn-secondary return-btn"
                                onclick="javascript:location.href='<%=cp%>/adnoticont.action?noti_cd=${UpdateForm.noti_cd}'">취소하기</button>
                            </div>
                        </div>
                    </section>
                </main>
            </div>
        </div>
    </div>
</div>



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
                <form>
                    <img src="./img3/register.png" width="50%;">
                    
                    <div class="modal-footer">
                        <button type="button" class="btn btn-primary" onclick="javascript:location.href='<%=cp%>/adnotiupdate.action">확인</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>
	
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>

</body>
</html>