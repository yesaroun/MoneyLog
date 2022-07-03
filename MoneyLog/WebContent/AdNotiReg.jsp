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
</head>
<body>

<div class="wrap">
    <header>
        <header>
            <!-- ○ 상단 네비게이션 include -->
	        <jsp:include page="./AdNavCs.jsp"></jsp:include>
        </header>
    </header>

    <div class="container-fluid">
        <div class="row-fluid">
            <div class="span2">
                <!-- ○ 좌측 메뉴바 include -->
                <jsp:include page="./AdMenuCs.jsp"></jsp:include>
            </div>
            <div class="span10">
                <main id="adNotiList">
                    <section>
                        <div class="row">
                            <div class="col-12" style="margin-top: 30px;" >
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
                                        <input type="text" style="padding-left:15px; width: 100%; height:35px;" placeholder="제목을 입력해주세요.">
                                    </td>
                                </tr>  
                                <tr>    
                                    <th>내용</th>
                                    <td>
                                        <textarea name="content" rows="10" cols="60" placeholder="내용을 입력해주세요." style="padding-left: 12px; width: 100%;"></textarea>
                                    </td>    
                                </tr>
                            </table>
                        </div>
                    </section>
                    <section>
                        <div class="row">
                            <div class="col-12" style="margin-top: 20px;">
                                <button type="submit" class="btn btn-secondary" style="background-color: #F5CAC3; float: right;"
                                onclick="javascript:location.href='<%=cp%>/AdNotiList.jsp'">돌아가기</button>

                                <button type="submit" class="btn btn-primary" style="background-color: #92B4EC; float: right;" 
                                data-toggle="modal" data-target="#modal">등록하기</button>
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
	


</body>
</html>