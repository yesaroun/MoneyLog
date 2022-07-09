<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<title>공지사항 - 등록</title>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="stylesheet" href="./css/admin.css">
<script type="text/javascript" src="./js/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
	
	$(function()
	{

		
		$("#regBtn").click(function()
		{	
			// 데이터 검사(공란이 있는지 없는지에 대한 여부 확인)
			$("#err1").css("display", "none");
			$("#err2").css("display", "none");
							
			if ( $("#noti_title").val()=="")
				{
					$("#errForm").css("display" ,"inline");
					$("#noti_title").focus();
					return;
				} 
			
			if ( $("#noti_cont").val()=="")
			{
				$("#err2").css("display", "inline");
				$("#noti_cont").focus();
				return;
			}
							
				$("#adNotiInsert").submit();
						
		});
		
	});

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
                <main id="adNotiReg">
                <form action="adNotiInsert" method="get">
                    <section>
                        <div class="row">
                            <div class="col-12 notice-title">
                                <div class="list-title">
                                        공지사항
                                </div>
                            </div>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <table class="table2 col-12">
                                <tr>
                                    <th>공지유형</th>
                                    <td>
                                        <label for="pin"><input type="checkbox" id="pin" name="pin" checked> 상단고정</label>
                                    </td>
                                </tr>
                                <tr>    
                                    <th>제목</th>
                                    <td>
                                        <input type="text" id="noti_title" name="noti_title" class="table-title" placeholder="제목을 입력해주세요.">
                                    	<span id="err1" style="color: red; display: none;">※ 제목을 입력하세요.</span>	
                                    </td>
                                </tr>  
                                <tr>    
                                    <th>내용</th>
                                    <td>
                                        <textarea class="table-content" id="noti_cont" name="noti_cont"  rows="10" cols="60" placeholder="내용을 입력해주세요."></textarea>
                                    	<span id="err2" style="color: red; display: none;">※ 내용을 입력하세요.</span>	
                                    </td>    
                                </tr>
                            </table>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <div class="col-12" style="margin-top: 20px;">
                                <button type="submit" class="btn btn-secondary return-btn"
                                onclick="javascript:location.href='<%=cp%>/adnotilist.action'">돌아가기</button>

                                <button type="button" id="regBtn" class="btn btn-primary reg-btn">등록하기</button>          		
                            		
                            	<!-- <button type="button" id="regBtn" class="btn btn-primary reg-btn"
                                data-toggle="modal" data-target="#modal">등록하기</button> -->
                            </div>
                        </div>
                    </section>
                </form>
                </main>
            </div>
        </div>
    </div>
</div>

	
	<script src="./js/jquery-3.2.1.min.js"></script>
	<script src="./js/popper.min.js"></script>
	<script src="./js/bootstrap.min.js"></script>

<%-- 
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
                        <button type="button" class="btn btn-primary" onclick="javascript:location.href='<%=cp%>/AdNotiCont.jsp'">확인</button>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
</div>
 --%>	


</body>
</html>