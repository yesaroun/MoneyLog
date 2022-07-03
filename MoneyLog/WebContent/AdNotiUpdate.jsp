<%@ page contentType="text/html; charset=UTF-8"%>
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
                                        <label for="pin"><input type="checkbox" id="pin" name="pin" checked> 상단고정</label>
                                    <td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td>
                                        <input type="text" value="원래 공지했던 제목" style="padding-left:15px; width: 500px; height:35px;">
                                    <td>
                                </tr>
                                <tr>    
                                    <th>내용</th>
                                    <td>
                                        <textarea name="content" rows="10" cols="60" style="padding-left: 12px;">원래 공지했던 내용들</textarea>
                                    </td>    
                                </tr>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-12" style="margin-top: 20px;">	
                                <button type="submit" class="btn btn-primary" style="background-color: skyblue; float: right;"  data-toggle="modal" data-target="#modal">등록하기</button>
                                <button type="submit" class="btn btn-secondary" style="background-color: #F5CAC3; float: right;"
                                onclick="javascript:location.href='<%=cp%>/AdNotiCont.jsp'">돌아가기</button>
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
                        <button type="button" class="btn btn-primary" onclick="javascript:location.href='<%=cp%>/AdNotiCont.jsp'">확인</button>
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